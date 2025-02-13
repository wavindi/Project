import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Profile Header Section
              _buildProfileHeader(context),
              
              // Stats Cards
              _buildStatsRow(),
              
              // Settings Options List
              _buildSettingsList(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: null, // Add actual image
            child: Icon(Icons.person, size: 40, color: Colors.grey.shade600),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Anwar Raza',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Icon(Icons.verified, color: Colors.blue, size: 20),
                  ],
                ),
                Text(
                  'UI Designer',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 12,
                  ),
                ),
                Text(
                  '@Fiverr',
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.edit, color: Colors.blue),
            onPressed: () => _showEditProfileDialog(context),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsRow() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          _buildStatCard('100', 'Co2 saved', Icons.eco),
          const SizedBox(width: 8),
          _buildStatCard('44', 'Carpools', Icons.directions_car),
          const SizedBox(width: 8),
          _buildStatCard('6', 'Members met', Icons.people),
        ],
      ),
    );
  }

  Widget _buildStatCard(String value, String label, IconData icon) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Column(
          children: [
            Icon(icon, color: Colors.blue),
            const SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            Text(
              label,
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsList(BuildContext context) {
    final settingsItems = [
      {'icon': Icons.person, 'title': 'Account Information', 'action': () => _showEditProfileDialog(context)},
      {'icon': Icons.location_on, 'title': 'My Addresses'},
      {'icon': Icons.business, 'title': 'Company Deal'},
      {'icon': Icons.settings, 'title': 'My Preferences'},
      {'icon': Icons.history, 'title': 'History'},
      {'icon': Icons.lock, 'title': 'Privacy Settings', 'action': () => _showChangePasswordDialog(context)},
      {'icon': Icons.help, 'title': 'Help & Support'},
      {'icon': Icons.settings, 'title': 'General Settings'},
      {'icon': Icons.logout, 'title': 'Sign Out', 'action': _handleLogout},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: settingsItems.map((item) {
          return Card(
            margin: const EdgeInsets.only(bottom: 8),
            child: ListTile(
              leading: Icon(item['icon'] as IconData, color: Colors.blue),
              title: Text(item['title'] as String),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: item['action'] as void Function()? ?? () {},
            ),
          );
        }).toList(),
      ),
    );
  }

  

  void _handleLogout() async {
    await FirebaseAuth.instance.signOut();
    // Add your navigation logic here
  }

  void _showEditProfileDialog(BuildContext context) {
    // Keep your existing dialog implementation
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Profile'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(decoration: InputDecoration(labelText: 'Name')),
            TextField(decoration: InputDecoration(labelText: 'Email')),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text('Save')),
        ],
      ),
    );
  }

  void _showChangePasswordDialog(BuildContext context) {
    // Keep your existing password change implementation
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Change Password'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(obscureText: true, decoration: InputDecoration(labelText: 'Current Password')),
            TextField(obscureText: true, decoration: InputDecoration(labelText: 'New Password')),
            TextField(obscureText: true, decoration: InputDecoration(labelText: 'Confirm Password')),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text('Change')),
        ],
      ),
    );
  }
}