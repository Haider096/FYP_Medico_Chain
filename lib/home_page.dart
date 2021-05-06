import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medi_care/google_sign.dart';
import 'package:provider/provider.dart';

import 'Background.dart';
import 'Sign_upwid.dart';
import 'log_in.dart';


class HomePage extends StatelessWidget {
  @override

  Widget build(BuildContext context) =>


      Scaffold(

    body:ChangeNotifierProvider(
      create: (context)=> GoogleSignInProvider(),
      child:
      StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          final provider = Provider.of<GoogleSignInProvider>(context);

          if (provider.isSigningIn) {
            return buildLoading();
          } else if (snapshot.hasData) {
            return LoggedInWidget();
          } else {
            return SignUpWidget();
          }
        },
      ),
    ),
  );


  Widget buildLoading() => Stack(
    fit: StackFit.expand,
    children: [
      CustomPaint(painter: BackgroundPainter()),
      Center(child: CircularProgressIndicator()),
    ],
  );
}




