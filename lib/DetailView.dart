import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Detailed extends StatefulWidget {
  @override
  _DetailedState createState() => _DetailedState();
}

class _DetailedState extends State<Detailed> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
        backgroundColor: Color.fromRGBO(28, 46, 74, 43.81),
        body:
       Stack(children: [Align(
          alignment: Alignment(0, 40),
      child: ClipPath(
        clipper: Rectanglecurve00(),

        child: Container(

            decoration: BoxDecoration(


            image: DecorationImage(image: AssetImage('images/Mew.png',
            ),

              // fit: BoxFit.scaleDown,




            ),


              color: Colors.cyan[800]
            ),


        ),
      ),
    ),




          Padding(
          padding: EdgeInsets.fromLTRB(20, 300, 30, 20),
          child: Container(

           decoration: BoxDecoration(
             shape: BoxShape.rectangle,

            color: Colors.cyan[800],
             borderRadius:BorderRadius.only(
             topLeft: Radius.circular(25.0),
              bottomRight: Radius.circular(25.0),
                 )
              ),

              alignment: Alignment.center,
              width: 550,
              height: 350,
            margin: EdgeInsets.all(   15.0),
            padding: EdgeInsets.all(30.0),
            ),
          ),


         Padding(
           padding: const EdgeInsets.fromLTRB(55, 330
               , 10, 10),
           child: Text('Detail',
               style:GoogleFonts.mcLaren(
                 color: Colors.white,
                 fontSize: 30.0,
                 fontWeight: FontWeight.bold,

                 fontStyle: FontStyle.italic,
               )),
         ),

         Padding(
           padding: EdgeInsets.fromLTRB(5, 15, 80, 10),
           child: RaisedButton.icon(onPressed:(){
             Navigator.pushReplacementNamed(context, '/symptoms');
           },
             icon:Icon(Icons.arrow_back,
               color: Colors.white,
             ),

             label:Text(' BACK',
               style:GoogleFonts.mcLaren( color: Colors.white,

                 fontStyle: FontStyle.italic,),

             ),

             color: Color.fromRGBO(28, 46, 74, 43.81),),
         ),


         Padding(
           padding: const EdgeInsets.fromLTRB(300, 26, 10, 10),
           child: CircleAvatar(
             maxRadius: 15,
             backgroundImage: NetworkImage(user.photoURL),
           ),
         ),






       ]));
  }
}

class Rectanglecurve00  extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 375;
    final double _yScaling = size.height / 812;
    path.lineTo(0 * _xScaling,0 * _yScaling);
    path.cubicTo(0 * _xScaling,0 * _yScaling,375 * _xScaling,0 * _yScaling,375 * _xScaling,0 * _yScaling,);
    path.cubicTo(375 * _xScaling,0 * _yScaling,375 * _xScaling,318 * _yScaling,375 * _xScaling,318 * _yScaling,);
    path.cubicTo(375 * _xScaling,319.105 * _yScaling,374.105 * _xScaling,320 * _yScaling,373 * _xScaling,320 * _yScaling,);
    path.cubicTo(373 * _xScaling,320 * _yScaling,50 * _xScaling,320 * _yScaling,50 * _xScaling,320 * _yScaling,);
    path.cubicTo(22.3858 * _xScaling,320 * _yScaling,0 * _xScaling,297.614 * _yScaling,0 * _xScaling,270 * _yScaling,);
    path.cubicTo(0 * _xScaling,270 * _yScaling,0 * _xScaling,0 * _yScaling,0 * _xScaling,0 * _yScaling,);
    path.cubicTo(0 * _xScaling,0 * _yScaling,0 * _xScaling,0 * _yScaling,0 * _xScaling,0 * _yScaling,);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}





