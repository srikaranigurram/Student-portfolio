import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 100,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 1000,
          ),
          child: Column(
            children: [
              const Text(
                'Education',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 38,
                  fontWeight: FontWeight.w800,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'My academic journey',
                style: TextStyle(
                  color: AppTheme.textSecondary,
                ),
              ),

              const SizedBox(height: 55),

              _timelineItem(
                year: '2024 — Present',
                title: 'B.Tech in Computer Science Engineering',
                institute: 'Jawaharlal Nehru Technological University Hyderabad (JNTUH)',
                description:
                    'Currently pursuing my B.Tech in Computer Science Engineering '
                    'with a CGPA of 8.47.',
                icon: Icons.school_rounded,
                color: AppTheme.primary,
                isLast: false,
              ),

              _timelineItem(
                year: '2022 — 2024',
                title: 'Intermediate Education',
                institute: 'Narayana Institute of Colleges',
                description:
                    'Completed Intermediate education with 98.4%.',
                icon: Icons.menu_book_rounded,
                color: AppTheme.secondary,
                isLast: false,
              ),

            _timelineItem(
              year: '2020 — 2022',
              title: 'Secondary School Education',
              institute: 'Narayana Institute of Colleges',
              description:
                  'Completed secondary school education with 95%.',
              icon: Icons.auto_stories_rounded,
              color: AppTheme.accent,
              isLast: true,
            ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _timelineItem({
    required String year,
    required String title,
    required String institute,
    required String description,
    required IconData icon,
    required Color color,
    required bool isLast,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 70,
          child: Column(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: color.withOpacity(.12),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: color.withOpacity(.35),
                  ),
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 22,
                ),
              ),
              if (!isLast)
                Container(
                  width: 1,
                  height: 145,
                  color: Colors.white.withOpacity(.08),
                ),
            ],
          ),
        ),

        const SizedBox(width: 25),

        Expanded(
          child: Container(
            margin: const EdgeInsets.only(bottom: 25),
            padding: const EdgeInsets.all(25),
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
                Text(
                  year,
                  style: TextStyle(
                    color: color,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  institute,
                  style: const TextStyle(
                    color: AppTheme.textSecondary,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  description,
                  style: const TextStyle(
                    color: AppTheme.textSecondary,
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
