// lib/features/home/presentation/pages/home_page.dart

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomePageWidget extends StatelessWidget {
  const HomePageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Welcome Header
            const Text(
              'Welcome Back!',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Here is an overview of your activity',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 25),

            // 2. Stats Grid
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 1.4,
              children: [
                _buildStatCard(
                  title: 'Active Projects',
                  value: '12',
                  icon: Icons.assignment_rounded,
                  color: Colors.blue,
                ),
                _buildStatCard(
                  title: 'Pending Tasks',
                  value: '5',
                  icon: Icons.pending_actions_rounded,
                  color: Colors.orange,
                ),
                _buildStatCard(
                  title: 'Alerts',
                  value: '2',
                  icon: Icons.notifications_active_rounded,
                  color: Colors.red,
                ),
                _buildStatCard(
                  title: 'Finished Items',
                  value: '84',
                  icon: Icons.check_circle_rounded,
                  color: Colors.green,
                ),
              ],
            ),
            const SizedBox(height: 30),

            // 3. Recent Activity Section
            const Text(
              'Recent Activities',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),

            _buildActivityTile(
              title: 'Project Update',
              description: 'You updated the landing page design.',
              time: '10 minutes ago',
              icon: Icons.edit_rounded,
              color: Colors.blue,
            ),
            _buildActivityTile(
              title: 'Task Completed',
              description: 'Step 10 Login implementation completed.',
              time: '1 hour ago',
              icon: Icons.check_rounded,
              color: Colors.green,
            ),
            _buildActivityTile(
              title: 'Security Alert',
              description: 'Login detected from a new browser session.',
              time: 'Yesterday',
              icon: Icons.security_rounded,
              color: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(icon, color: color, size: 28),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityTile({
    required String title,
    required String description,
    required String time,
    required IconData icon,
    required Color color,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      elevation: 0,
      color: Colors.grey.withOpacity(0.05),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.1),
          child: Icon(icon, color: color, size: 20),
        ),
        title: Text(
          title,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          description,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
        trailing: Text(
          time,
          style: const TextStyle(fontSize: 10, color: Colors.grey),
        ),
      ),
    );
  }
}
