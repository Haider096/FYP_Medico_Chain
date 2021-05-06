import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medi_care/HomeSearch.dart';
import 'package:medi_care/SymptomsX.dart';
import 'package:medi_care/DetailView.dart';
import 'package:medi_care/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:medi_care/log_in.dart';
import 'package:medi_care/Dropdown.dart';




Future main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(  initialRoute: '/',
      routes: {
        '/': (context) =>HomePage(),
        '/homesearch': (context) => MyApp(),
        '/homepage': (context) => HomePage(),
        '/symptoms': (context) => Sym(),
        '/detailview': (context) => Detailed(),
        '/log_in': (context) => LoggedInWidget(),
        '/drop_down':(context) => Dropdine(),
      }


  ));


}



