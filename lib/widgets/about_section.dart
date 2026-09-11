import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final mobile = MediaQuery.of(context).size.width < 800;

    return _section(
      child: Column(
        children: [
          _heading(
            'About Me',
            'A little bit about who I am',
          ),

          const SizedBox(height: 55),

          mobile
              ? Column(
                  children: [
                    _introCard(context),
                    const SizedBox(height: 25),
                    _stats(),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: _introCard(context),
                    ),
                    const SizedBox(width: 30),
                    Expanded(
                      flex: 2,
                      child: _stats(),
                    ),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _introCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.auto_awesome_rounded,
            color: AppTheme.secondary,
            size: 35,
          ),
          const SizedBox(height: 22),
          const Text(
            'Curious by nature. Developer by choice.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 18),
          Text(
           'I am a third-year Computer Science Engineering student '
          'at JNTUH with a passion for software development and '
          'artificial intelligence. I enjoy building practical '
          'projects that solve real-world problems and exploring '
          'new technologies.',
          ),
          const SizedBox(height: 18),
          Text(
            'My goal is to become a skilled software developer who '
            'combines technical knowledge with creativity to build '
            'useful and meaningful applications.',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }

  Widget _stats() {
    return Column(
      children: [
        _statCard(
          Icons.school_rounded,
          'Student',
          'Always learning',
          AppTheme.primary,
        ),
        const SizedBox(height: 15),
        _statCard(
          Icons.code_rounded,
          'Developer',
          'Building projects',
          AppTheme.secondary,
        ),
        const SizedBox(height: 15),
        _statCard(
          Icons.lightbulb_outline_rounded,
          'Problem Solver',
          'Creating solutions',
          AppTheme.accent,
        ),
      ],
    );
  }

  Widget _statCard(
    IconData icon,
    String title,
    String subtitle,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: _cardDecoration(),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: color.withOpacity(.1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(
              icon,
              color: color,
            ),
          ),
          const SizedBox(width: 18),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(
                  color: AppTheme.textSecondary,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _heading(String title, String subtitle) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 38,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          subtitle,
          style: const TextStyle(
            color: AppTheme.textSecondary,
            fontSize: 15,
          ),
        ),
      ],
    );
  }

  Widget _section({required Widget child}) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 100,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 1100,
          ),
          child: child,
        ),
      ),
    );
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: AppTheme.surface,
      borderRadius: BorderRadius.circular(22),
      border: Border.all(
        color: Colors.white.withOpacity(.06),
      ),
    );
  }
}
