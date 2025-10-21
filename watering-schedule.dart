import 'package:flutter/material.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    final double headerHeight = 87;
    final double navBarHeight = 79;

    return Scaffold(
      backgroundColor: const Color(0xFFFFF7FB),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // HEADER (green with back arrow and title)
            Container(
              height: headerHeight,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFF2FA66B),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: 16,
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),
                  const Center(
                    child: Text(
                      'Schedule',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // MAIN CONTENT
            Expanded(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ListView(
                      padding: const EdgeInsets.only(top: 18, bottom: 80),
                      children: [
                        _SectionHeader(title: 'Today'),
                        const SizedBox(height: 8),
                        const _PlaceholderCard(text: 'No tasks for today'),
                        const SizedBox(height: 20),

                        _SectionHeader(title: 'Overdue'),
                        const SizedBox(height: 8),
                        const _PlaceholderCard(text: 'No overdue tasks'),
                        const SizedBox(height: 20),

                        _SectionHeader(title: 'Upcoming'),
                        const SizedBox(height: 8),
                        const _PlaceholderCard(text: 'No upcoming tasks'),
                        const SizedBox(height: 20),

                        _SectionHeader(title: 'Completed'),
                        const SizedBox(height: 8),
                        const _PlaceholderCard(text: 'No completed tasks'),
                        const SizedBox(height: 120),
                      ],
                    ),
                  ),

                  // ADD BUTTON inside content zone
                  Positioned(
                    bottom: 20,
                    right: 25,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const RegisteredPlantsPage()),
                        );
                      },
                      child: Container(
                        width: 65,
                        height: 65,
                        decoration: BoxDecoration(
                          color: const Color(0xFF77E4C8),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 6,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.add,
                          size: 32,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // NAVIGATION BAR
            Container(
              height: navBarHeight,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFFFBFBFB),
                border: Border(
                  top: BorderSide(color: Color(0xFFE7E7E7), width: 1.5),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  _NavItem(icon: Icons.home_outlined, label: 'Home'),
                  _NavItem(icon: Icons.local_florist_outlined, label: 'Catalog'),
                  _NavItem(icon: Icons.schedule_outlined, label: 'Schedule', isActive: true),
                  _NavItem(icon: Icons.menu_book_outlined, label: 'Library'),
                  _NavItem(icon: Icons.camera_alt_outlined, label: 'AI'), // ✅ changed icon here
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.black87,
      ),
    );
  }
}

class _PlaceholderCard extends StatelessWidget {
  final String text;
  const _PlaceholderCard({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(fontSize: 15, color: Colors.black54),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  const _NavItem({required this.icon, required this.label, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    final Color color = isActive ? const Color(0xFF2FA66B) : Colors.grey;
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 12, color: color)),
      ],
    );
  }
}

class RegisteredPlantsPage extends StatelessWidget {
  const RegisteredPlantsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Registered Plants'),
        backgroundColor: const Color(0xFF2FA66B),
      ),
      body: const Center(
        child: Text(
          'No plants registered yet.',
          style: TextStyle(fontSize: 18, color: Colors.black54),
        ),
      ),
    );
  }
}
