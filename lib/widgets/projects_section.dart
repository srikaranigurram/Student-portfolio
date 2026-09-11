
import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = [
      _Project(
        title: 'AI Meeting Assistant',
        description:
            'An AI-powered meeting assistant that converts '
            'meeting audio into transcripts, summaries and '
            'actionable tasks.',
        icon: Icons.smart_toy_rounded,
        color: AppTheme.primary,
        tags: ['AI', 'Python', 'NLP'],
        githubUrl: '',
      ),
      _Project(
        title: 'CleanGuard',
        description:
            'A smart waste management system designed to '
            'monitor campus waste and improve waste '
            'collection efficiency.',
        icon: Icons.recycling_rounded,
        color: AppTheme.accent,
        tags: ['AI', 'Database', 'Web'],
        githubUrl: '',
      ),
      _Project(
        title: 'Library Management System',
        description:
            'A library management application developed '
            'to manage books, student records and library '
            'operations.',
        icon: Icons.local_library_rounded,
        color: AppTheme.secondary,
        tags: ['Python', 'Database'],
        githubUrl: '',
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
            maxWidth: 1100,
          ),
          child: Column(
            children: [
              const Text(
                'Featured Projects',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 38,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Some things I have built and experimented with',
                style: TextStyle(
                  color: AppTheme.textSecondary,
                ),
              ),
              const SizedBox(height: 55),

              LayoutBuilder(
                builder: (context, constraints) {
                  final columns =
                      constraints.maxWidth > 850 ? 3 : 1;

                  return GridView.builder(
                    shrinkWrap: true,
                    physics:
                        const NeverScrollableScrollPhysics(),
                    itemCount: projects.length,
                    gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: columns,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio:
                          columns == 3 ? .83 : 1.2,
                    ),
                    itemBuilder: (context, index) {
                      return _projectCard(projects[index]);
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

  Widget _projectCard(_Project project) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Colors.white.withOpacity(.06),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  project.color.withOpacity(.25),
                  project.color.withOpacity(.04),
                ],
              ),
            ),
            child: Center(
              child: Container(
                width: 75,
                height: 75,
                decoration: BoxDecoration(
                  color: project.color.withOpacity(.12),
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(
                    color: project.color.withOpacity(.25),
                  ),
                ),
                child: Icon(
                  project.icon,
                  color: project.color,
                  size: 38,
                ),
              ),
            ),
          ),

          Expanded(
            child: Theme(
              data: ThemeData(
                brightness: Brightness.dark,
                dividerColor: Colors.transparent,
              ),
              child: ExpansionTile(
                tilePadding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 4,
                ),
                childrenPadding: const EdgeInsets.fromLTRB(
                  22,
                  0,
                  22,
                  22,
                ),
                iconColor: project.color,
                collapsedIconColor:
                    AppTheme.textSecondary,
                title: Text(
                  project.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                children: [
                  Text(
                    project.description,
                    style: const TextStyle(
                      color: AppTheme.textSecondary,
                      height: 1.55,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 18),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Wrap(
                      spacing: 7,
                      runSpacing: 7,
                      children: project.tags.map((tag) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: project.color.withOpacity(.08),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            tag,
                            style: TextStyle(
                              color: project.color,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  if (project.githubUrl.isNotEmpty) ...[
                    const SizedBox(height: 18),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton.icon(
                        onPressed: () {
                          // Add your GitHub link here.
                        },
                        icon: const Icon(Icons.open_in_new_rounded),
                        label: const Text('View on GitHub'),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Project {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final List<String> tags;
  final String githubUrl;

  _Project({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.tags,
    required this.githubUrl,
  });
}