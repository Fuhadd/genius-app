import 'package:flutter/material.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Profile'),
              boldText('Profile'),
              semiBoldText('Profile'),
              mediumText('Profile'),
              regularText('Profile'),
              verticalSpacer(10),
              Text(
                'Easy life starts with your health, \nvehicles, gadgets, and trips that are\nalways protected.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF0E2521),
                  fontSize: 16,
                  fontFamily: 'VisbyBold',
                  // fontWeight: FontWeight.w700,
                  height: 1.40,
                ),
              ),
              Text(
                'Easy life starts with your health, \nvehicles, gadgets, and trips that are\nalways protected.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF0E2521),
                  fontSize: 16,
                  fontFamily: 'VisbySemibold',
                  // fontWeight: FontWeight.w600,
                  height: 1.40,
                ),
              ),
              verticalSpacer(20),
              Text(
                'Easy life starts with your health, \nvehicles, gadgets, and trips that are\nalways protected.&',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF0E2521),
                  fontSize: 16,
                  fontFamily: 'VisbyMedium',
                  // fontWeight: FontWeight.w500,
                  height: 1.40,
                ),
              ),
              verticalSpacer(10),
              Text(
                'Easy life starts with your health, \nvehicles, gadgets, and trips that are\nalways protected.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF0E2521),
                  fontSize: 16,
                  fontFamily: 'VisbyRegular',
                  // fontWeight: FontWeight.w400,
                  height: 1.40,
                ),
              ),
              // verticalSpacer(10),
              // Text(
              //   'Easy life starts with your health, \nvehicles, gadgets, and trips that are\nalways protected.',
              //   textAlign: TextAlign.center,
              //   style: TextStyle(
              //     color: Color(0xFF0E2521),
              //     fontSize: 16,
              //     fontFamily: 'Visby',
              //     fontWeight: FontWeight.w500,
              //     height: 1.40,
              //   ),
              // )
              // semiBoldText('Profile'),
            ],
          ),
          // ShadButton(
          //   height: 50,
          //   width: double.infinity,
          //   decoration: ShadDecoration(
          //     color: Colors.red,
          //     border: ShadBorder(
          //       radius: BorderRadius.circular(25),
          //     ),
          //   ),
          //   child:
          //   onPressed: () {
          //     //Completely replaces it
          //     context.pushNamed('/profile', extra: 'John Doe');
          //   },
          // ),
        ),
      ),
    );
  }
}
