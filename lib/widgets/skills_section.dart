
import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      _SkillCategory(
        title: 'Programming Languages',
        icon: Icons.code_rounded,
        color: AppTheme.primary,
        skills: ['Java', 'C'],
      ),
      _SkillCategory(
        title: 'Web Development',
        icon: Icons.language_rounded,
        color: AppTheme.secondary,
        skills: ['HTML', 'Django'],
      ),
      _SkillCategory(
        title: 'Database',
        icon: Icons.storage_rounded,
        color: AppTheme.accent,
        skills: ['SQL'],
      ),
      _SkillCategory(
        title: 'Tools',
        icon: Icons.build_rounded,
        color: AppTheme.primary,
        skills: ['Git'],
      ),
      _SkillCategory(
        title: 'AI & Machine Learning',
        icon: Icons.smart_toy_rounded,
        color: AppTheme.secondary,
        skills: ['AI Integration', 'NLP'],
      ),
    ];

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
                'Skills',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 38,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Technologies and abilities I am developing',
                style: TextStyle(
                  color: AppTheme.textSecondary,
                ),
              ),
              const SizedBox(height: 55),

              LayoutBuilder(
                builder: (context, constraints) {
                  final columns =
                      constraints.maxWidth > 800 ? 2 : 1;

                  return GridView.builder(
                    shrinkWrap: true,
                    physics:
                        const NeverScrollableScrollPhysics(),
                    itemCount: categories.length,
                    gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: columns,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio:
                          columns == 2 ? 2.7 : 2.4,
                    ),
                    itemBuilder: (context, index) {
                      return _categoryCard(categories[index]);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _categoryCard(_SkillCategory category) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withOpacity(.06),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  color: category.color.withOpacity(.12),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Icon(
                  category.icon,
                  color: category.color,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  category.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: category.skills.map((skill) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 7,
                ),
                decoration: BoxDecoration(
                  color: category.color.withOpacity(.08),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  skill,
                  style: TextStyle(
                    color: category.color,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _SkillCategory {
  final String title;
  final IconData icon;
  final Color color;
  final List<String> skills;

  _SkillCategory({
    required this.title,
    required this.icon,
    required this.color,
    required this.skills,
  });
}