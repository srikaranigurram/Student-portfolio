import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onViewProjects;
  final VoidCallback onContact;

  const HeroSection({
    super.key,
    required this.onViewProjects,
    required this.onContact,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final isMobile = width < 700;
        final isTablet = width >= 700 && width < 1050;

        return Container(
          width: double.infinity,
          constraints: BoxConstraints(
            minHeight: isMobile ? 850 : 760,
          ),
          padding: EdgeInsets.only(
            left: isMobile ? 22 : isTablet ? 45 : 80,
            right: isMobile ? 22 : isTablet ? 45 : 80,
            top: isMobile ? 130 : 155,
            bottom: 70,
          ),
          child: Stack(
            children: [
              Positioned(
                top: 80,
                right: isMobile ? -170 : -100,
                child: _glow(AppTheme.primary, isMobile ? 230 : 280),
              ),
              Positioned(
                bottom: 20,
                left: isMobile ? -160 : -120,
                child: _glow(AppTheme.secondary, isMobile ? 200 : 240),
              ),
              Center(
                child: isMobile
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _textContent(
                            context,
                            mobile: true,
                          ),
                          const SizedBox(height: 55),
                          _profileCard(
                            size: 300,
                          ),
                        ],
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 6,
                            child: _textContent(
                              context,
                              mobile: false,
                            ),
                          ),
                          SizedBox(
                            width: isTablet ? 35 : 70,
                          ),
                          Expanded(
                            flex: 4,
                            child: Center(
                              child: _profileCard(
                                size: isTablet ? 280 : 320,
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _textContent(
    BuildContext context, {
    required bool mobile,
  }) {
    return Column(
      crossAxisAlignment:
          mobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            color: AppTheme.accent.withOpacity(0.08),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: AppTheme.accent.withOpacity(0.2),
            ),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.circle,
                color: AppTheme.accent,
                size: 8,
              ),
              SizedBox(width: 8),
              Text(
                'AVAILABLE FOR OPPORTUNITIES',
                style: TextStyle(
                  color: AppTheme.accent,
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 28),

        Text(
          'Hi, I\'m',
          textAlign: mobile ? TextAlign.center : TextAlign.left,
          style: TextStyle(
            color: AppTheme.textSecondary,
            fontSize: mobile ? 21 : 27,
            fontWeight: FontWeight.w500,
          ),
        ),

        const SizedBox(height: 5),

        ShaderMask(
          shaderCallback: (bounds) {
            return const LinearGradient(
              colors: [
                Colors.white,
                AppTheme.secondary,
                AppTheme.primary,
              ],
            ).createShader(bounds);
          },
          child: Text(
            'Srikarani Gurram',
            textAlign: mobile ? TextAlign.center : TextAlign.left,
            style: TextStyle(
              color: Colors.white,
              fontSize: mobile ? 43 : 72,
              fontWeight: FontWeight.w900,
              height: 1.1,
            ),
          ),
        ),

        const SizedBox(height: 18),

        Text(
          'Computer Science Student • Developer',
          textAlign: mobile ? TextAlign.center : TextAlign.left,
          style: TextStyle(
            color: AppTheme.textPrimary,
            fontSize: mobile ? 19 : 28,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 20),

        ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 620,
          ),
          child: Text(
            'I am a Computer Science student at JNTUH who enjoys '
            'building practical projects with Java, C, Python '
            'and Flutter. I love exploring AI, creating useful '
            'applications, and turning ideas into real-world '
            'solutions.',
            textAlign: mobile ? TextAlign.center : TextAlign.left,
            style: TextStyle(
              color: AppTheme.textSecondary,
              fontSize: mobile ? 14 : 16,
              height: 1.8,
            ),
          ),
        ),

        const SizedBox(height: 35),

        Wrap(
          alignment:
              mobile ? WrapAlignment.center : WrapAlignment.start,
          spacing: 14,
          runSpacing: 12,
          children: [
            ElevatedButton.icon(
              onPressed: onViewProjects,
              icon: const Icon(Icons.arrow_forward_rounded),
              label: const Text('View My Work'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 17,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
              ),
            ),
            OutlinedButton.icon(
              onPressed: onContact,
              icon: const Icon(Icons.mail_outline_rounded),
              label: const Text('Contact Me'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: BorderSide(
                  color: Colors.white.withOpacity(0.15),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 17,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 35),

        Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(
              Icons.location_on_outlined,
              color: AppTheme.textSecondary,
              size: 17,
            ),
            SizedBox(width: 6),
            Text(
              'Hyderabad, India',
              style: TextStyle(
                color: AppTheme.textSecondary,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _profileCard({
    required double size,
  }) {
    final cardHeight = size * 1.18;
    final circleSize = size * 0.56;

    return Container(
      width: size,
      height: cardHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF18243B),
            Color(0xFF0B111E),
          ],
        ),
        border: Border.all(
          color: Colors.white.withOpacity(0.08),
        ),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primary.withOpacity(0.15),
            blurRadius: 70,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 25,
            right: 25,
            child: Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                color: AppTheme.secondary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Icon(
                Icons.code_rounded,
                color: AppTheme.secondary,
              ),
            ),
          ),

          Container(
            width: circleSize,
            height: circleSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [
                  AppTheme.primary,
                  AppTheme.secondary,
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.primary.withOpacity(0.3),
                  blurRadius: 50,
                ),
              ],
            ),
            child: Icon(
              Icons.person_rounded,
              size: circleSize * 0.55,
              color: Colors.white,
            ),
          ),

          Positioned(
            bottom: 30,
            left: 15,
            right: 15,
            child: Column(
              children: [
                const Text(
                  'CSE STUDENT',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 3,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Building ideas into real projects',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppTheme.textSecondary,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _glow(Color color, double size) {
    return IgnorePointer(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color.withOpacity(0.06),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.12),
              blurRadius: 120,
              spreadRadius: 30,
            ),
          ],
        ),
      ),
    );
  }
}