import 'package:flutter/material.dart';
import 'package:medi_care/Sign_btnX.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) => buildSignIn();

  Widget buildSignIn() => Column(

    children:[
      Spacer(),
      Align(
        alignment:Alignment.centerLeft,
        child:Container(
        margin: EdgeInsets.symmetric(horizontal:20),
          width:175,
          child:Text(
            'Welcome To The World Of Medico.',
            style:TextStyle(
              color: Color.fromRGBO(277,52,43,1),
              letterSpacing: 2.0,

              fontFamily: 'Air Americana',
            ),
          ),
        ),

      ),
      Spacer(),
GoogleSigninWidget(),
SizedBox(height:12),
      Text(
        'Login to continue',
        style:TextStyle(fontSize:16,
        color: Colors.blue[400],
          letterSpacing: 2.0,

          fontFamily: 'Air Americana',),
      ),

    ],

  );
}
