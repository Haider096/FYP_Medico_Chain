import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medi_care/Sign_btnX.dart';
import 'package:provider/provider.dart';

import 'google_sign.dart';


class LoggedInWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Container(
      color:Color.fromRGBO(28, 46, 74,1),
      alignment: Alignment.center,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Padding(
            padding: const EdgeInsets.fromLTRB(1, 10, 10, 1),
            child: Image(image: AssetImage(
              'images/Mew.png'
            )),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(40, 30, 10, 1),
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
          SizedBox(height: 8),
          Text(
            'Logged In',
            style:GoogleFonts.mcLaren(color: Colors.white,

              fontStyle: FontStyle.italic,),
          ),
          SizedBox(height: 8),
          CircleAvatar(
            maxRadius: 40,
            backgroundImage: NetworkImage(user.photoURL),
          ),
          SizedBox(height: 8),
          Text(
            'Name: ' + user.displayName,
            style:GoogleFonts.mcLaren(color: Colors.white,

              fontStyle: FontStyle.italic,),
          ),
          SizedBox(height: 8),
          Text(
            'Email: ' + user.email,
            style:GoogleFonts.mcLaren(color: Colors.white,

              fontStyle: FontStyle.italic,),
          ),
          SizedBox(height: 8),
          RaisedButton(
            onPressed: () {
              final provider =
              Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.logout();
            },
            child: Text('Logout',
              style:GoogleFonts.mcLaren(color: Colors.white,

                fontStyle: FontStyle.italic,),),
            color: Colors.cyan[800],
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(100, 40, 80, 10),
            child: RaisedButton.icon(onPressed:(){
              Navigator.pushReplacementNamed(context, '/homesearch');
            },
              icon:Icon(Icons.adjust,
                color: Colors.white,
              ),

              label:Text("LET'S START",
                style:GoogleFonts.mcLaren(color: Colors.white,

                  fontStyle: FontStyle.italic,),


              ),

              color: Colors.cyan[800],),
          )






        ],




      ),





    );




  }
}
