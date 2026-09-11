import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/about_section.dart';
import '../widgets/contact_section.dart';
import '../widgets/education_section.dart';
import '../widgets/hero_section.dart';
import '../widgets/navbar.dart';
import '../widgets/projects_section.dart';
import '../widgets/skills_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey heroKey = GlobalKey();
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey educationKey = GlobalKey();
  final GlobalKey skillsKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  void scrollTo(GlobalKey key) {
    final targetContext = key.currentContext;

    if (targetContext != null) {
      Scrollable.ensureVisible(
        targetContext,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOutCubic,
        alignment: 0.05,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                KeyedSubtree(
                  key: heroKey,
                  child: HeroSection(
                    onViewProjects: () => scrollTo(projectsKey),
                    onContact: () => scrollTo(contactKey),
                  ),
                ),

                KeyedSubtree(
                  key: aboutKey,
                  child: const AboutSection(),
                ),

                KeyedSubtree(
                  key: educationKey,
                  child: const EducationSection(),
                ),

                KeyedSubtree(
                  key: skillsKey,
                  child: const SkillsSection(),
                ),

                KeyedSubtree(
                  key: projectsKey,
                  child: const ProjectsSection(),
                ),

                KeyedSubtree(
                  key: contactKey,
                  child: const ContactSection(),
                ),

                const SizedBox(height: 40),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    '© 2026 Student Portfolio • Built with Flutter',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppTheme.textSecondary,
                      fontSize: 13,
                    ),
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),

          Navbar(
            onHome: () => scrollTo(heroKey),
            onAbout: () => scrollTo(aboutKey),
            onEducation: () => scrollTo(educationKey),
            onSkills: () => scrollTo(skillsKey),
            onProjects: () => scrollTo(projectsKey),
            onContact: () => scrollTo(contactKey),
          ),
        ],
      ),
    );
  }
}