import 'package:flutter/material.dart';

class Doctor {
  String firstname;
  String lastname;
  String designation;
  String imageUrl;
  bool isSelected;


  Doctor(this.firstname, this.lastname,this.designation,
      this.imageUrl, this.isSelected);
}

class selectDoctor extends StatefulWidget {
  Doctor _doctor;
  selectDoctor(this._doctor);
  @override
  _selectDoctorState createState() => _selectDoctorState();
}

class _selectDoctorState extends State<selectDoctor> {
  @override
  Widget build(BuildContext context) {
    String _backgroundImage;
    String setImage() {
      if(widget._doctor.isSelected == true)
        _backgroundImage = "assets/user_Profile/ticked.png";
      else
        _backgroundImage = "assets/user_Profile/plain.jpg";
      return _backgroundImage;
    }
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 75.0,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFE5E7E9)),
        color: widget._doctor.isSelected ? Color(0xffF3F6F8) : Colors.white,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left:30.0,right: 40.0),
              child: Center(
                    child: Image(
                    height: 50.0,
                    width: 50.0,
                    image: AssetImage(widget._doctor.imageUrl),
                  ),
                )
              ),
          Padding(
            padding: const EdgeInsets.only(),
            child: Text(widget._doctor.firstname + " " + widget._doctor.lastname
              + "," + "\n" + widget._doctor.designation,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                      color: Color(0XFF112027),
                    ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 80.0),
              child: Container(
                  width: 30,
                  height: 30,
                  child: Image.asset(setImage()))
          ),
        ],
      ),
    );
  }
}
