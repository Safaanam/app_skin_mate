import 'package:app_skin_mate/checkIn_Screens/checkIn_Complete.dart';
import 'package:app_skin_mate/checkIn_Screens/model_CheckIn/checkIn_Model.dart';
import 'package:flutter/material.dart';

class checkIn extends StatefulWidget {
  @override
  _checkInState createState() => _checkInState();
}

class _checkInState extends State<checkIn> {
  List<checkInn> problems = new List<checkInn>();
  bool probSelected=false;
  @override
  void initState() {
    super.initState();
    problems.add(new checkInn("Cough", 'assets/checkIn_Images/Cough.png', false));
    problems.add(new checkInn("Fever",'assets/checkIn_Images/Fever.png', false));
    problems.add(new checkInn("Cold", 'assets/checkIn_Images/Cold.png', false));
    problems.add(new checkInn("None of the above", 'assets/checkIn_Images/None.png', false));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: Container(
          height: 20.0,
          width: 20.0,
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Image.asset('assets/Profile_Images/arrow_back.png')),
          ),
          title: Text("Check In",
          style: TextStyle(
          color: Color(0xff112027),
          fontSize: 17,
          fontWeight: FontWeight.bold),),
          backgroundColor: Colors.white,
          brightness: Brightness.light,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left:20.0,top: 38.0),
                  child: Container(
                      width:64.0,
                      height: 65.0,
                      child: Image.asset('assets/checkIn_Images/Covid.png')
                  ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0,top: 14.0),
                child: Container(
                    width: 311.0,
                    height: 96.0,
                    child: Text("With your health & safety our number\n"
                                "one priority against COVID-19, Are you\n"
                                "experiencing any of the following\n"
                                "symptoms?",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                              color: Color(0xff112027)
                        ),)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 19.5,top: 29.5,right:19.5),
                child: GridView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: problems.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 19.5),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            problems.forEach((prob) => prob.isSelected = false);
                            problems[index].isSelected = true;
                            probSelected=true;
                          });
                        },
                        child: checkInIssue(problems[index]),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0,top: 39.5,right:20.0),
                child: ButtonTheme(
                  child: Container(
                    width: 335.0,
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: () {
                        if(probSelected == true)
                          Navigator.push(
                              context, MaterialPageRoute(builder: (_) => checkInComplete()));
                        else
                          {
                            final snackBar = SnackBar(
                              content: Text('Please select any of the above options'),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          }
                      },
                      style: ElevatedButton.styleFrom(
                          primary: probSelected
                              ? Color(0xff749BAD)
                              : Colors.blueGrey[100],
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),)),
                      child: Text('CONFIRM',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          color: Color(0xffFFFFFF),
                        ),),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:39.0),
                child: Container(
                  constraints: BoxConstraints.expand(
                    width: 375.0,
                    height: 82.0
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xff2B4049),
                    borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35.0),
                    bottomRight: Radius.circular(35.0),),
                  ),
                  child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left:21.0,),
                          child: Container(
                              width:22.0,
                              height: 22.0,
                              child: Image.asset('assets/checkIn_Images/info.png')
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40.0,top:20.0),
                          child: Container(
                              width: 275.0,
                              height: 76.0,
                              child: Text("You will be notified when your\n"
                                  "appointment is ready for walk-in.",
                                  style: TextStyle(
                                    fontSize: 13.0,
                                    color: Colors.white,
                                ),)),
                        ),
                      ],
                  )
                ),
              ),
            ],
          ),
        ),
    );
  }
}
