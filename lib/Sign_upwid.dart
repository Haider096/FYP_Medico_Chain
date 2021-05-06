import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:medi_care/Sign_btnX.dart';

import 'Background.dart';
class SignUpWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Stack(

    fit: StackFit.expand,


    children: [


      CustomPaint(painter: BackgroundPainter()),
      buildSignUp(),
    ],
  );

  Widget buildSignUp() => Column(
    children: [


      Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 30, 10, 1),
          child: Container(

            margin: EdgeInsets.symmetric(horizontal: 20),
            width: 180,
            child: Text(
              'MEDICO CHAIN',
              style:GoogleFonts.abel(
                color: Colors.white,
                fontSize: 19,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,


              ),
            ),
          ),
        ),
      ),



      // Spacer(),




      Align(
        alignment: Alignment.centerLeft,
        child: Container(
          margin: EdgeInsets.symmetric(vertical:70,horizontal: 20),
          width: 140,
          child: Text(
            'Welcome to the World of Medico.',
            style:GoogleFonts.mcLaren(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,


            ),
          ),
        ),
      ),
      Spacer(),
      GoogleSigninWidget(),
      SizedBox(height: 12),
      Text(
        'Sign-in to continue',
        style:GoogleFonts.mcLaren(fontSize: 16),
      ),
      Spacer(),
    ],
  );
}