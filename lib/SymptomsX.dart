

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medi_care/DatabaseManager.dart';
import 'package:medi_care/Dropdown.dart';
import 'package:provider/provider.dart';



class Sym extends StatefulWidget {
  @override
  _SymState createState() => _SymState();
}

class _SymState extends State<Sym> {
  bool _folded= true;
  final user = FirebaseAuth.instance.currentUser;
  PageController _pagecontroller;
  int currentPage=0;



  TextEditingController sampledata =new TextEditingController();



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pagecontroller=PageController(
      initialPage: currentPage,keepPage: false,viewportFraction: 0.5,
    );
  }



  @override
  Widget build(BuildContext context) {


    return Material(
        color: Color.fromRGBO(28, 46, 74, 43.81),
        child: Stack(children: [






          StreamBuilder(
            stream: Firestore.instance.collection('mediinfo01').snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot>snapshot){
              if(!snapshot.hasData){
                return Text ("No Such Data");
              }
              return ListView.builder(
itemCount: snapshot.data.documents.length,
                itemBuilder: (context,index){
  DocumentSnapshot symptomsx = snapshot.data.documents[index];
               return ListTile(
                 title:  Text(symptomsx['name'],),
               )
                },
                children: snapshot.data.documents.map((document){
                  return Text(document['symptomsx'] ,
                    style: TextStyle(
                        color: Colors.white
                    ),);
                },
                ).toList(),
              );},

          ),



Container(
  child: PageView.builder(onPageChanged: (value){
    setState(() {
      currentPage=value;
    });
  },
  controller: _pagecontroller,
    itemBuilder: (context,index) => animateItemBuilder(index)

  ),
),





      Align(
        alignment: Alignment(0, 70),
      child: ClipPath(
        clipper: Rectanglecurve2(),
        child: Container(
          color: Color.fromRGBO(28, 46, 74, 43.81),
        ),
      ),
    ),





      Padding(
        padding: const EdgeInsets.fromLTRB(20, 65, 10, 10),
        child: Text('Symptoms',
            style:GoogleFonts.mcLaren(
              color: Colors.white,
              fontSize:27.0,

              fontStyle: FontStyle.italic,
            )),
      ),


      // Padding(
      //   padding: const EdgeInsets.fromLTRB(20, 175
      //       , 10, 10),
      //   child: Text(  greetingx,
      //
      //       style:TextStyle(
      //         color: Colors.cyan[800],
      //         fontSize: 28.0,
      //         fontWeight: FontWeight.bold,
      //         fontFamily: 'RedHat',
      //         fontStyle: FontStyle.italic,
      //       )),
      // ),

      //Just simple blue container in case of needed
      // Padding(
      //   padding: EdgeInsets.fromLTRB(20, 187, 30, 20),
      //   child: Container(
      //
      //     decoration: BoxDecoration(
      //         shape: BoxShape.rectangle,
      //
      //         color: Colors.blue,
      //         borderRadius:BorderRadius.only(
      //           topLeft: Radius.circular(25.0),
      //           bottomRight: Radius.circular(25.0),
      //         )
      //
      //     ),
      //
      //     alignment: Alignment.center,
      //     width: 250,
      //     height: 500,
      //     margin: EdgeInsets.all(25.0),
      //     padding: EdgeInsets.all(40.0),
      //   ),
      // ),



      Padding(
        padding: EdgeInsets.fromLTRB(20, 87, 30, 20),
        child: Container(



          decoration: BoxDecoration(
            shape: BoxShape.rectangle,

            color:Colors.cyan[800],
            borderRadius:BorderRadius.only(
                topLeft: Radius.circular(25.0),
                bottomRight: Radius.circular(25.0),
            )

          ),



          alignment: Alignment.center,
          width: 250,
          height: 50,
          margin: EdgeInsets.all(25.0),
          padding: EdgeInsets.all(40.0),

        ),




      ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 175, 10, 10),
            child: Text('Recommended Medicines.',
                style:GoogleFonts.mcLaren(
                  color: Colors.white,
                  fontSize:25.0,

                  fontStyle: FontStyle.italic,
                )),
          ),







      Padding(
        padding: EdgeInsets.fromLTRB(10, 640, 80, 10),
        child: RaisedButton.icon(onPressed:(){
          Navigator.pushReplacementNamed(context, '/detailview');
        },
          icon:Icon(Icons.add,
            color: Colors.white,



          ),


          label:Text('DETAILS',
            style:GoogleFonts.mcLaren(color: Colors.white,

              fontStyle: FontStyle.italic,),


          ),

          color: Color.fromRGBO(28, 46, 74, 43.81),),
      ),



      Padding(
        padding: EdgeInsets.fromLTRB(10, 15, 80, 10),
        child: RaisedButton.icon(onPressed:(){
          Navigator.pushReplacementNamed(context, '/drop_down');
        },
          icon:Icon(Icons.arrow_back,
            color: Colors.white,
          ),
          

          label:Text(' BACK',
            style:GoogleFonts.mcLaren(color: Colors.white,

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






      ])



           );
  }

  animateItemBuilder(int index) {
    return AnimatedBuilder(animation: _pagecontroller, 
        builder: (context,child){
      double value =1;
      if(_pagecontroller.position.haveDimensions){
        value=_pagecontroller.page - index;
        value=(1-(value.abs()*0.5)).clamp(0.0, 1.0);
      }

      return  Padding(
        padding: EdgeInsets.fromLTRB(10, 210, 10, 10),
        child: Center(
          child: SizedBox(
            height: Curves.easeOut.transform(value)*500,
            width: Curves.easeOut.transform(value)*750,
            child: child,
          ),
        ),
      );
        },
    child: Container(


      color: Colors.cyan[800],


 
    ),

    );


  }

  Widget displayUserInformation(BuildContext context, AsyncSnapshot snapshot) {}}






  class Rectanglecurve2 extends CustomClipper<Path>{

  @override
  Path getClip(Size size) {
  Path path = Path();
  final double _xScaling = size.width / 375;
  final double _yScaling = size.height / 812;
  path.lineTo(0 * _xScaling,0 * _yScaling);
  path.cubicTo(0 * _xScaling,0 * _yScaling,375 * _xScaling,0 * _yScaling,375 * _xScaling,0 * _yScaling,);
  path.cubicTo(375 * _xScaling,0 * _yScaling,375 * _xScaling,168 * _yScaling,375 * _xScaling,168 * _yScaling,);
  path.cubicTo(375 * _xScaling,169.105 * _yScaling,374.105 * _xScaling,170 * _yScaling,373 * _xScaling,170 * _yScaling,);
  path.cubicTo(373 * _xScaling,170 * _yScaling,50 * _xScaling,170 * _yScaling,50 * _xScaling,170 * _yScaling,);
  path.cubicTo(22.3858 * _xScaling,170 * _yScaling,0 * _xScaling,147.614 * _yScaling,0 * _xScaling,120 * _yScaling,);
  path.cubicTo(0 * _xScaling,120 * _yScaling,0 * _xScaling,0 * _yScaling,0 * _xScaling,0 * _yScaling,);
  path.cubicTo(0 * _xScaling,0 * _yScaling,0 * _xScaling,0 * _yScaling,0 * _xScaling,0 * _yScaling,);
  return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
  }




