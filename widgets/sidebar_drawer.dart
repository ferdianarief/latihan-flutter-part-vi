import 'package:flutter/material.dart';

class SidebarDrawer extends StatelessWidget {
  final Function(String) onMenuItemSelected;

  const SidebarDrawer({Key? key, required this.onMenuItemSelected})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final menuItems = [
      {'id': 'dashboard', 'icon': Icons.dashboard, 'title': 'Dashboard'},
      {
        'id': 'profile',
        'icon': Icons.business,
        'title': 'Kelola Profile Usaha',
      },
    ];

    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.green[700]),
            child: Row(
              children: [
                Icon(Icons.store, color: Colors.white, size: 32),
                SizedBox(width: 16),
                Text(
                  'Kasir Q',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  ' Version 1.0',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: menuItems.map((item) {
                return ListTile(
                  leading: Icon(item['icon'] as IconData),
                  title: Text(item['title'] as String),
                  onTap: () {
                    Navigator.pop(context);
                    onMenuItemSelected(item['id'] as String);
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
