import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:e_commerce/features/profile/view_model/profile_view_model.dart';
import 'package:e_commerce/features/profile/widgets/user_card.dart';
import 'package:e_commerce/features/profile/widgets/profile_tile.dart';
import 'package:e_commerce/features/auth/auth_view/auth_wapper.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  void _showLogoutDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Confirm Logout'),
        content: const Text('Are you sure you want to log out?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
            },
            child: const Text('Cancel'),
          ),
          TextButton(
              onPressed: () async {
                Navigator.pop(ctx);
                await ref.read(profileViewModelProvider).signOut();
                if (context.mounted) {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (ctx) => AuthWrapper(),
                    ),
                    (route) => false,
                  );
                }
              },
              child: Text(
                'Logout',
                style: TextStyle(color: Colors.red),
              ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(profileViewModelProvider).user;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          UserCard(),
          const SizedBox(height: 20),
          ProfileTile(icon: Icons.shopping_bag, title: 'Orders', onTap: () {}),
          const SizedBox(height: 3),
          ProfileTile(icon: Icons.location_on, title: 'Address', onTap: () {}),
          const Divider(),
          ProfileTile(icon: Icons.settings, title: 'Settings', onTap: () {}),
          const SizedBox(height: 3),
          ProfileTile(
              icon: Icons.help_outline, title: 'Help & Support', onTap: () {}),
          const SizedBox(height: 3),
          ProfileTile(
              icon: Icons.privacy_tip, title: 'Privacy Policy', onTap: () {}),
          const SizedBox(height: 3),
          ProfileTile(
              icon: Icons.description,
              title: 'Terms & Conditions',
              onTap: () {}),
          const SizedBox(height: 16),
          ListTile(
            onTap: () => _showLogoutDialog(context, ref),
            leading: const Icon(
              Icons.logout,
              color: Colors.red,
            ),
            title: const Text("Log Out", style: TextStyle(color: Colors.red)),
            tileColor: Colors.grey[200],
          )
        ],
      ),
    );
  }
}
