import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class Navbar extends StatelessWidget {
  final VoidCallback onHome;
  final VoidCallback onAbout;
  final VoidCallback onEducation;
  final VoidCallback onSkills;
  final VoidCallback onProjects;
  final VoidCallback onContact;

  const Navbar({
    super.key,
    required this.onHome,
    required this.onAbout,
    required this.onEducation,
    required this.onSkills,
    required this.onProjects,
    required this.onContact,
  });

  void _handleMenuSelection(String value) {
    switch (value) {
      case 'home':
        onHome();
        break;
      case 'about':
        onAbout();
        break;
      case 'education':
        onEducation();
        break;
      case 'skills':
        onSkills();
        break;
      case 'projects':
        onProjects();
        break;
      case 'contact':
        onContact();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 16,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Container(
            constraints: const BoxConstraints(
              maxWidth: 1150,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: AppTheme.surface.withOpacity(0.92),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.white.withOpacity(0.08),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 30,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final isMobile = constraints.maxWidth < 700;

                if (isMobile) {
                  return Row(
                    children: [
                      _logo(),
                      const Spacer(),
                      PopupMenuButton<String>(
                        color: AppTheme.surfaceLight,
                        icon: const Icon(
                          Icons.menu_rounded,
                          color: Colors.white,
                          size: 28,
                        ),
                        onSelected: _handleMenuSelection,
                        itemBuilder: (context) => const [
                          PopupMenuItem(
                            value: 'home',
                            child: Text('Home'),
                          ),
                          PopupMenuItem(
                            value: 'about',
                            child: Text('About'),
                          ),
                          PopupMenuItem(
                            value: 'education',
                            child: Text('Education'),
                          ),
                          PopupMenuItem(
                            value: 'skills',
                            child: Text('Skills'),
                          ),
                          PopupMenuItem(
                            value: 'projects',
                            child: Text('Projects'),
                          ),
                          PopupMenuItem(
                            value: 'contact',
                            child: Text('Contact'),
                          ),
                        ],
                      ),
                    ],
                  );
                }

                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _logo(),
                      const SizedBox(width: 18),
                      _navItem('Home', onHome),
                      _navItem('About', onAbout),
                      _navItem('Education', onEducation),
                      _navItem('Skills', onSkills),
                      _navItem('Projects', onProjects),
                      _navItem('Contact', onContact),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _logo() {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            AppTheme.primary,
            AppTheme.secondary,
          ],
        ),
        borderRadius: BorderRadius.circular(13),
      ),
      child: const Center(
        child: Text(
          '<S/>',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w900,
            fontSize: 13,
          ),
        ),
      ),
    );
  }

  Widget _navItem(String title, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          foregroundColor: AppTheme.textSecondary,
          padding: const EdgeInsets.symmetric(
            horizontal: 11,
            vertical: 10,
          ),
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}