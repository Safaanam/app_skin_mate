import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 200.0),
            child: Center(
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  child: Text("There is no Notifications yet",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                        color: Color(0xff2A3E49)
                    ),)),
            ),
          ),
        ],
      ),
    );
  }
}