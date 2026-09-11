
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

import '../theme/app_theme.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();

  bool isSending = false;

  // Replace this with your actual Formspree endpoint.
  static const String formspreeEndpoint =
      'https://formspree.io/f/xppzboyz';

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    messageController.dispose();
    super.dispose();
  }

  Future<void> sendMessage() async {
    if (nameController.text.trim().isEmpty ||
        emailController.text.trim().isEmpty ||
        messageController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all fields.'),
        ),
      );
      return;
    }

    if (!emailController.text.contains('@')) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid email address.'),
        ),
      );
      return;
    }

    if (formspreeEndpoint == 'YOUR_FORMSPREE_ENDPOINT') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please configure the email service first.'),
        ),
      );
      return;
    }

    setState(() {
      isSending = true;
    });

    try {
      final response = await http.post(
        Uri.parse(formspreeEndpoint),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'name': nameController.text.trim(),
          'email': emailController.text.trim(),
          'message': messageController.text.trim(),
        }),
      );

      if (!mounted) return;

      if (response.statusCode >= 200 &&
          response.statusCode < 300) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Message sent successfully!'),
          ),
        );

        nameController.clear();
        emailController.clear();
        messageController.clear();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Could not send message. Try again.'),
          ),
        );
      }
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Something went wrong. Please try again.'),
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          isSending = false;
        });
      }
    }
  }

  Future<void> openLink(String url) async {
    final uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    final mobile = MediaQuery.of(context).size.width < 800;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 100,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 1050,
          ),
          child: Column(
            children: [
              const Text(
                'Let\'s Connect',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 38,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Have an idea or just want to say hello?',
                style: TextStyle(
                  color: AppTheme.textSecondary,
                ),
              ),
              const SizedBox(height: 55),
              mobile
                  ? Column(
                      children: [
                        _contactInfo(),
                        const SizedBox(height: 25),
                        _form(),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: _contactInfo()),
                        const SizedBox(width: 30),
                        Expanded(child: _form()),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _contactInfo() {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF151D32),
            Color(0xFF0B111D),
          ],
        ),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: Colors.white.withOpacity(.06),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.waving_hand_rounded,
            color: AppTheme.accent,
            size: 35,
          ),
          const SizedBox(height: 22),
          const Text(
            'Let\'s build something\ninteresting together.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 27,
              fontWeight: FontWeight.w800,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 18),
          const Text(
            'I\'m always open to learning, collaboration, '
            'interesting projects and new opportunities.',
            style: TextStyle(
              color: AppTheme.textSecondary,
              height: 1.7,
            ),
          ),
          const SizedBox(height: 30),
          _contactItem(
            Icons.email_outlined,
            'Email',
            'srikaranigurram@gmail.com',
          ),
          const SizedBox(height: 18),
          _contactItem(
            Icons.location_on_outlined,
            'Location',
            'Hyderabad, India',
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              _socialButton(
                Icons.code_rounded,
                'GitHub',
                'https://github.com/srikaranigurram',
              ),
              const SizedBox(width: 10),
              _socialButton(
                Icons.link_rounded,
                'LinkedIn',
                'https://www.linkedin.com/in/srikarani-gurram-7a3b31396',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _contactItem(
    IconData icon,
    String title,
    String value,
  ) {
    return Row(
      children: [
        Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: AppTheme.primary.withOpacity(.1),
            borderRadius: BorderRadius.circular(13),
          ),
          child: Icon(
            icon,
            color: AppTheme.secondary,
            size: 20,
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: AppTheme.textSecondary,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _socialButton(
    IconData icon,
    String tooltip,
    String url,
  ) {
    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: () => openLink(url),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.05),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.white.withOpacity(.06),
            ),
          ),
          child: Icon(
            icon,
            color: AppTheme.textSecondary,
            size: 19,
          ),
        ),
      ),
    );
  }

  Widget _form() {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: Colors.white.withOpacity(.06),
        ),
      ),
      child: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              hintText: 'Your name',
              prefixIcon: Icon(Icons.person_outline_rounded),
            ),
          ),
          const SizedBox(height: 15),
          TextField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: 'Your email',
              prefixIcon: Icon(Icons.email_outlined),
            ),
          ),
          const SizedBox(height: 15),
          TextField(
            controller: messageController,
            maxLines: 5,
            decoration: const InputDecoration(
              hintText: 'Your message',
              prefixIcon: Padding(
                padding: EdgeInsets.only(bottom: 75),
                child: Icon(Icons.chat_bubble_outline_rounded),
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: isSending ? null : sendMessage,
              icon: isSending
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Icon(Icons.send_rounded),
              label: Text(
                isSending ? 'Sending...' : 'Send Message',
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  vertical: 17,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}