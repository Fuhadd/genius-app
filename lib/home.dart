import 'package:flutter/material.dart';
import 'package:genius_app/constants/route_constants.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: ShadButton(
            height: 50,
            width: double.infinity,
            decoration: ShadDecoration(
              color: Colors.deepPurple,
              // border: ShadBorder(
              //   radius: BorderRadius.circular(25),
              // ),
            ),
            child: const Text('Login'),
            onPressed: () {
              //Completely replaces it
              context.goNamed(RouteConstants.stackLogin);
            },
          ),
        ),
      ),
    );
  }
}
