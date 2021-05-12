import 'package:app_skin_mate/AppointmentScreens/scheduleAppointment.dart';
import 'package:app_skin_mate/Screens/WelcomeScreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: WelcomeScreen(),
      routes: <String, WidgetBuilder>{
        // When navigating to the "/" route, build the FirstScreen widget.
        //'/': (context) => FirstScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/schedule': (BuildContext context) => scheduleAppoitment(),
      },
    );
  }
}

