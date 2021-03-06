import 'package:flutter/material.dart';

class privacyPolicy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 150.0),
            child: Center(
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  child: Text("This file contains the privacy policy details about the SkinMate app",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Color(0xff2A3E49)
                    ),)),
            ),
          ),
        ],
      ),
    );
  }
}