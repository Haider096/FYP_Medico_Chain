import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medi_care/Sign_in.dart';
import 'package:medi_care/google_sign.dart';
import 'package:provider/provider.dart';

class GoogleSigninWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.all(4),
      child: OutlineButton.icon(  label:Text('Sign In With Google',
        style:GoogleFonts.mcLaren(fontWeight: FontWeight.bold,fontSize: 23),
      ),
      shape: StadiumBorder(),
        padding: EdgeInsets.symmetric(horizontal: 12,vertical: 4),
        highlightedBorderColor:Color.fromRGBO(28, 46, 74, 1) ,
        borderSide: BorderSide(color:Color.fromRGBO(28, 46, 74, 1),),
      textColor: Colors.cyan[800],
        icon: FaIcon(FontAwesomeIcons.google),
        onPressed: (){
        final provider =
            Provider.of<GoogleSignInProvider>(context,listen: false);
        provider.login();
        },
      ),


    );
  }
}


