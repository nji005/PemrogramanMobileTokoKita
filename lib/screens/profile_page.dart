import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
        Theme.of(context)
            .colorScheme
            .inversePrimary,

        title: const Text(
          'Profil',
        ),
      ),

      body: const Center(
        child: Column(
          mainAxisSize:
          MainAxisSize.min,

          children: [
            Icon(
              Icons.person_outline,
              size: 64,
              color: Colors.grey,
            ),

            SizedBox(height: 12),

            Text(
              'Halaman profil pengguna.',

              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}