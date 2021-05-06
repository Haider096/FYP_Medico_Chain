import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medi_care/SymptomsX.dart';
import 'package:medi_care/DatabaseManager.dart';

class Dropdine extends StatefulWidget {
  @override
  _DropdineState createState() => _DropdineState();
}

class _DropdineState extends State<Dropdine> {

  String valueChoosy;
  String valueChoosy02;
  String valueChoosycolor;
  List listItem = [
    "None","Fever","Fever & Flu","Cough","Soar Throat","Fatigue","Headache & Body Pain","Constipation","Diabetes","Asthma","Anxiety and Stress",
    "Acne","Sore Throat","Birth Control","Fatigue,Headache,Vomiting","High Cholesterol","Hot Flashes","Vomiting,Bloating","Weight Loss",
"Obesity","Emergency Contraception","Seizures"

  ];
  List listItem02 =[
   "None", "HIV","Urinary Tract","Vaginal Yeast","Helicobacter Pylori","Kidney Infection","Upper Respiratory Tract Infection","Pain","Skin and Structure Infection","Hepatitis C",
    "Bronchitis","Chronic Pain","Back Pain","Muscle Spasm","Period Pain","Osteoarthritis","Bipolar Disorde","Restless Legs Syndrome",
    "Spondyloarthritis","Irritable Bowel Syndrome",

  ];

  Color bulbColor = Colors.white;

  final user = FirebaseAuth.instance
      .currentUser;

  String get bloodpressure => valueChoosycolor;
  String get infection => valueChoosy02;

  String get symptoms => valueChoosy;





  @override
  Widget build(BuildContext context) {


    return Material(

     color:Color.fromRGBO(28, 46, 74, 43.81),


    child: Column(

        children:[

    Align(
      alignment: Alignment.topLeft,
      child: Padding(
      padding: EdgeInsets.fromLTRB(10, 20, 80, 1),
        child: RaisedButton.icon(onPressed:(){
          Navigator.pushReplacementNamed(context, '/homesearch');
        },
            icon:Icon(Icons.arrow_back,
              color: Colors.cyan[700],
            ),


            label:Text(' BACK',
              style:GoogleFonts.mcLaren(color: Colors.white,

                fontStyle: FontStyle.italic,),



            ),   color: Color.fromRGBO(28, 46, 74, 43.81),),)),




    Padding(
    padding: const EdgeInsets.fromLTRB(300, 10, 10, 1),
      child: CircleAvatar(
        maxRadius: 16,
        backgroundImage: NetworkImage(user.photoURL),
      ),
    ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 10, 10),
            child: Text('MEDICO CHAIN',
                style:GoogleFonts.abel(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 2.0,
                )),
          ),




    Padding(
              padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
              child: Container(

                padding: EdgeInsets.only(left: 15,right: 15),
                decoration: BoxDecoration(
                  border:   Border.all(color: Colors.cyan[800], width:1),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: DropdownButton<String>(
                  hint: Text("Select the symptoms...",
                    style:GoogleFonts.mcLaren(
                    color: Colors.white,

                    fontStyle: FontStyle.italic,
                  ),),
                 dropdownColor: Colors.cyan[600],
                  icon: Icon(Icons.arrow_drop_down),
                 iconSize: 37,
                  isExpanded: true,
                  style:GoogleFonts.mcLaren(
                    color: Colors.white,
                    fontSize: 22,


                    fontStyle: FontStyle.italic,
                  ),

                  value: valueChoosy,
                  onChanged: (newValue){
                    setState(() {
                      valueChoosy = newValue;

                    });
                  },
                  items: listItem.map<DropdownMenuItem<String>>((valueItem){
                    return DropdownMenuItem(
                        value: valueItem,
                        child: Text(valueItem),);
                  }).toList(),
                ),



              ),
            ),








             Padding(
               padding: const EdgeInsets.fromLTRB(10, 40, 10, 15),
               child: Container(
                  padding: EdgeInsets.only(left: 15,right: 15),
                  decoration: BoxDecoration(
                    border:   Border.all(color: Colors.cyan[800], width:1),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: DropdownButton<String>(
                    hint: Text("Infection|Pain|Virus...",
                      style:GoogleFonts.mcLaren(
                        color: Colors.white,

                        fontStyle: FontStyle.italic,
                      ),),
                    dropdownColor: Colors.cyan[600],
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 37,
                    isExpanded: true,
                    style:GoogleFonts.mcLaren(
                        color: Colors.white,
                        fontSize: 22,

                      fontStyle: FontStyle.italic,
                    ),

                    value: valueChoosy02,
                    onChanged: (_newValue){
                      setState(() {
                        valueChoosy02 = _newValue;
                      });
                    },
                    items: listItem02.map<DropdownMenuItem<String>>((_valueItem){
                      return DropdownMenuItem(
                        value: _valueItem,
                        child: Text(_valueItem),);
                    }).toList(),
                  ),



                ),
             ),





          Padding(
            padding: const EdgeInsets.fromLTRB(2, 13, 10, 0),
            child: Container(
              height: 2,
              child: Icon(
                Icons.local_hospital,
                size: 30,
                color: bulbColor,



              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 1, 10, 18),

            child: Container(
              width: 330,
              child: Text("Blood Pressure",

                style:GoogleFonts.mcLaren(
                fontSize: 17,
                color: Colors.white,

                fontStyle: FontStyle.italic,

              ),),
            ),
          ),


          Container(
            width: 350,
            child: Row(
              children: <Widget>[
                Radio(
                    value: Colors.red,
                    groupValue: bulbColor,
                    onChanged: (val) {
                      bulbColor = val;
                      setState(() {
                        valueChoosycolor='High';
                      });
                    }),
                Text(
                  'High',
                  style:GoogleFonts.mcLaren(fontSize: 17, color: Colors.white,

                    fontStyle: FontStyle.italic,),
                )
              ],
            ),
          ),
          Container(
            width: 350,
            child: Row(
              children: <Widget>[
                Radio(
                    value: Colors.green,
                    groupValue: bulbColor,
                    onChanged: (val) {
                      bulbColor = val;
                      setState(() {  valueChoosycolor='Normal';});
                    }),
                Text('Normal', style:GoogleFonts.mcLaren(fontSize: 15, color: Colors.white,
                  fontStyle: FontStyle.italic,))
              ],
            ),
          ),
          Container(
            width: 350,
            child: Row(
              children: <Widget>[
                Radio(
                    value: Colors.blue,
                    groupValue: bulbColor,
                    onChanged: (val) {
                      bulbColor = val;
                      setState(() {  valueChoosycolor='Low';});
                    }),
                Text('Low', style:GoogleFonts.mcLaren(fontSize: 15,
                color: Colors.white,
                  fontStyle: FontStyle.italic,))
              ],
            ),
          ),




          Padding(
            padding: EdgeInsets.fromLTRB(70, 30, 80, 20),
            child: RaisedButton.icon(onPressed:() async {


              await DatabaseManager().createUserData( this.symptoms, this.infection, this.bloodpressure,user.uid);

              Navigator.pushReplacementNamed(context, '/symptoms');




            },
              icon:Icon(Icons.arrow_forward,
                color: Colors.white,



              ),


              label:Text('PROCEED',
                style:GoogleFonts.mcLaren(color: Colors.white,

                  fontStyle: FontStyle.italic,),


              ),

              color: Colors.cyan[800]),
          ),






        ]),










    );





      }
}
