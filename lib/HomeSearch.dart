import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medi_care/API.dart';
import 'package:medi_care/log_in.dart';
import 'package:http/http.dart 'as http;
import 'dart:convert';


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _folded= true;
  final user = FirebaseAuth.instance.currentUser;

  String name = ""; //user's response will be assigned to this variable
  String final_response = ""; //will be displayed on the screen once we get the data from the server
  final _formkey = GlobalKey<FormState>(); //key created to interact with the form


  //function to validate and save user form
  Future<void> _savingData() async{
    final validation = _formkey.currentState.validate();
    if (!validation){
      return;
    }
    _formkey.currentState.save();


  }


    TextEditingController sampledata =new TextEditingController();

String url;
var Data;
String QueryText = 'Query';





//function to add border and rounded edges to our form
  OutlineInputBorder _inputformdeco(){
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
      borderSide:
      BorderSide(width: 1.0, color: Colors.cyan[800], style: BorderStyle.solid),
    );
  }

  
  @override
  Widget build(BuildContext context) {

     var _name;
    return Material(
      color:  Color.fromRGBO(28, 46, 74, 43.81),
      child: Stack(children: [Align(
      alignment: Alignment(0, 40),
      child: ClipPath(
        clipper: Rectanglecurve(),
        child: Container(
          color: Colors.cyan[800],
        ),
      ),
    ),

        Padding(
          padding: const EdgeInsets.fromLTRB(20, 30, 10, 10),
          child: Text('MEDICO CHAIN',
              style:GoogleFonts.abel(
                color: Colors.white,
                fontSize: 27.0,
                fontStyle: FontStyle.normal,
                letterSpacing: 2.0,
              )),
        ),

      Padding(
        padding:EdgeInsets.fromLTRB(40, 80, 0, 0),
        child: Text('Hi, '+ user.displayName,

          style:GoogleFonts.mcLaren(

            color: Colors.white,

            fontSize: 39.0,
            wordSpacing: 5.0,
            fontStyle: FontStyle.italic,

          ),),
      ),

      Padding(
        padding: const EdgeInsets.fromLTRB(300, 26, 10, 10),
        child: CircleAvatar(
          maxRadius: 15,
          backgroundImage: NetworkImage(user.photoURL),
        ),
      ),

      Padding(
        padding:EdgeInsets.fromLTRB(40, 150, 0, 0),
        child: Text('Please search your Symptoms here.',
          style:GoogleFonts.mcLaren(
            color: Colors.white,

            fontStyle: FontStyle.italic,
            fontSize: 23.0,
            wordSpacing: 5.0,

          ),),
      ),


    Padding(
      padding: const EdgeInsets.fromLTRB(0, 100,0, 0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center,
      children: [
      SizedBox(height: 200),
      Container(width: 350,
      child: Form(key: _formkey,
      child: TextFormField(
        style: TextStyle(color:Colors.cyan[500],

       ),
        cursorColor:Colors.blue,

        onChanged: (value){
          url = 'http://10.0.2.2:5000/home'+value.toString();

        },

        controller: sampledata,
      decoration: InputDecoration(
      labelText: 'Enter your Symptoms... ',
      labelStyle:GoogleFonts.mcLaren( color:Colors.white,

        fontStyle: FontStyle.italic,
      ),


      enabledBorder: _inputformdeco(),
      focusedBorder: _inputformdeco(),

      ),onSaved: (value){
      name = value;
      //getting data from the user form and assigning it to name
      },
      ),
      ),
      ),

      Padding(
        padding: const EdgeInsets.all(25.0),
        child: FlatButton(
        onPressed: () {

       Map <String,dynamic> data = {"symptomsx":sampledata.text};
       Firestore.instance.collection("mediinfo01").add(data);
       Navigator.pushReplacementNamed(context, '/symptoms');
        },
        child: Text('SEND',
          style:GoogleFonts.mcLaren(  color:Colors.white,
          fontStyle: FontStyle.italic,),
       ),
        color: Colors.cyan[800],
        ),
      ),


      Padding(
        padding: const EdgeInsets.all(1.0),
        child: FlatButton(
        onPressed: () {
         setState(() {
         _name = sampledata.text;

         });


        },
        child: Text('GET',
          style:GoogleFonts.mcLaren( color:Colors.white,
          fontStyle: FontStyle.italic,),),
        color: Colors.cyan[800],
        ),
      ),

      //displays the data on the screen
      Text('Your symptoms are $_name .',
        style:GoogleFonts.mcLaren(fontSize: 24,color: Colors.white),)
      ],
      ),
    ),





        Padding(
          padding: EdgeInsets.fromLTRB(130, 215, 80, 20),
          child: RaisedButton.icon(onPressed:() {

            Navigator.pushReplacementNamed(context, '/drop_down');



          },
              icon:Icon(Icons.adjust,
                color: Colors.white,



              ),


              label:Text('ALTERNATE',
                style:GoogleFonts.mcLaren(color: Colors.white,

                  fontStyle: FontStyle.italic,),


              ),

              color: Colors.cyan[800]),
        ),














        // child: Icon(
                        //   _folded ? Icons.search : Icons.close,
                        //   color:Colors.cyan[800],
                        // ),
                        //


                      
                      // onTap: () async {
                        // setState(() {
                        //   _folded =!_folded;
                        //
                        //   // Navigator.pushReplacementNamed(context, '/symptoms');
                        // },
                        // showSearch(context: context, delegate: DataSearch());








    ]) ,



    );

      // Padding(
      //   padding: EdgeInsets.fromLTRB(120, 410, 30, 100),
      //   child: RaisedButton.icon(onPressed: () async{
      //     final url = 'http://127.0.0.1:5000/symp';
      //
      //     //getting data from the python server script and assigning it to response
      //     final response = await http.get(url);
      //
      //     //converting the fetched data from json to key value pair that can be displayed on the screen
      //     final decoded = json.decode(response.body) as Map<String, dynamic>;
      //
      //     //changing the UI be reassigning the fetched data to final response
      //     setState(() {
      //       final_response = decoded['symp'];
      //     });
      //     // Navigator.pushReplacementNamed(context, '/symptoms');
      //   },
      //     icon:Icon(Icons.arrow_forward,
      //       color: Colors.white,
      //     ),
      //
      //
      //     label:Text('Get',
      //       style: TextStyle(color: Colors.white,
      //         fontFamily: 'RedHat',
      //         fontStyle: FontStyle.italic,),
      //
      //     ),
      //
      //
      //
      //     color: Color.fromRGBO(277,52,43,1),),
      // ),
      // Text(final_response, style: TextStyle(fontSize: 24)),
      //
      //

      // Padding(
      //   padding: EdgeInsets.fromLTRB(5, 15, 80, 10),
      //   child: RaisedButton.icon(onPressed:(){
      //     Navigator.pushReplacementNamed(context, '/log_in');
      //   },
      //     icon:Icon(Icons.arrow_back,
      //       color: Colors.white,
      //     ),
      //
      //     label:Text("Back",
      //       style: TextStyle(color: Colors.white,
      //         fontFamily: 'RedHat',
      //         fontStyle: FontStyle.italic,),


    //
    //       ),
    //
    //       color: Color.fromRGBO(277,52,43,1),),
    //   ),
    //
    //
    //
    //
    //
    // ]),        );

  }
}
//
// class DataSearch extends SearchDelegate<String>{
//
// final medicines = [
//   "Fever",
//   "Flu",
//   "Cough",
//   "Pain",
//   "Headache",
//   "Low Blood Pressure",
// ];
//
// final medicinesSearch =[
//   "Fever",
//   "Flu",
//   "Cough",
// ];
//
//
//
//
//
//
//
//   @override
//   List<Widget> buildActions(BuildContext context) {
//
//     return [IconButton( icon:Icon(Icons.clear), onPressed:(){
//       query="";
//     })];
//   }
//
//   @override
//   Widget buildLeading(BuildContext context) {
//    return IconButton(
//   icon : AnimatedIcon(icon: AnimatedIcons.menu_arrow, progress: transitionAnimation,),
//    onPressed: (){
//     close(context,null);
//
//    });
//   }
//
//   @override
//   Widget buildResults(BuildContext context) {
//     // TODO: implement buildResults
//     throw UnimplementedError();
//   }
//
//   @override
//   Widget buildSuggestions(BuildContext context) {
//  final suggestionList = query.isEmpty ? medicinesSearch : medicines.where((pi) => pi.startsWith(query)).toList();
//  return ListView.builder(itemBuilder: (context,index)=>ListTile(
//    onTap: (){
//      Navigator.pushReplacementNamed(context, '/symptoms');
//
//
//    },
//    leading: Icon(Icons.location_city),
//    title:
//      RichText(text: TextSpan(
//        text: suggestionList[index].substring(0,query.length),
//        style: TextStyle(
//          color: Colors.black,
//          fontWeight: FontWeight.bold
//        ),
//        children: [
//          TextSpan(
//            text: suggestionList[index].substring(query.length),
//            style: TextStyle(color: Colors.grey)
//          )
//        ]
//      ))
//
//  ),
//  itemCount: suggestionList.length,);
//
//
//   }}


class Rectanglecurve extends CustomClipper<Path>{
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

