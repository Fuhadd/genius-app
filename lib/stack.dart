import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class StackLogin extends StatefulWidget {
  const StackLogin({super.key});

  @override
  State<StackLogin> createState() => _StackLoginState();
}

class _StackLoginState extends State<StackLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: ShadButton(
            height: 50,
            width: double.infinity,
            decoration: ShadDecoration(
              color: Colors.blue,
              border: ShadBorder(
                radius: BorderRadius.circular(25),
              ),
            ),
            child: const Text('Profile11'),
            onPressed: () {
              //Completely replaces it
              context.pushNamed('/profile', extra: 'John Doe');
            },
          ),
        ),
      ),
    );
  }
}
