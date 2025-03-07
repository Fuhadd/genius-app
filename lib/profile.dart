import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ProfilePage extends StatefulWidget {
  final String userName;
  const ProfilePage({super.key, required this.userName});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.userName),
              ShadButton(
                height: 50,
                width: double.infinity,
                decoration: ShadDecoration(
                  color: Colors.deepPurple,
                  // border: ShadBorder(
                  //   radius: BorderRadius.circular(25),
                  // ),
                ),
                child: const Text('Pricing'),
                onPressed: () {
                  //Completely replaces it
                  // context.goNamed('/login');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
