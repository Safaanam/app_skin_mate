import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart' as dp;


class dateTimeSelect extends StatefulWidget {
  @override
  _dateTimeSelectState createState() => _dateTimeSelectState();
}

class _dateTimeSelectState extends State<dateTimeSelect> {
  DateTime _selectedDate = DateTime.now();

  DateTime _firstDate = DateTime.now().subtract(Duration(days: 45));
  DateTime _lastDate = DateTime.now().add(Duration(days: 45));

  Color selectedDateStyleColor = Colors.blue;
  Color selectedSingleDateDecorationColor = Colors.red;

  void _onSelectedDateChanged(DateTime newDate) {
    setState(() {
      _selectedDate = newDate;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: new IconButton(icon: ImageIcon(AssetImage('assets/images/back_button.png'),
          color: Color(0xff02122C), size: 35,),
          onPressed: () => Navigator.of(context).pop(),
        ),
        titleSpacing: 0,
        title: Text("Select Date & Time",
            style: TextStyle(//fontFamily: 'Poppins-SemiBold',
              fontWeight: FontWeight.bold,
              fontSize: 22.0,
              color: Color(0xff112027),
            )),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        //scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 120,),
              Container(
                //margin: EdgeInsets.only(left: 0.0),
                padding: EdgeInsets.only(left: 30.0),
                width: double.infinity,
                child: Text('Select a date for appointment',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff25414A),
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: dp.DayPicker.single(
                  selectedDate: _selectedDate,
                  onChanged: _onSelectedDateChanged,
                  firstDate: _firstDate,
                  lastDate: _lastDate,
                  //datePickerStyles: styles,
                  datePickerLayoutSettings: dp.DatePickerLayoutSettings(
                    maxDayPickerRowCount: 8,
                    showPrevMonthEnd: true,
                    //showNextMonthStart: true
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Container(
                child: Text('Available Time Slots',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff25414A),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
