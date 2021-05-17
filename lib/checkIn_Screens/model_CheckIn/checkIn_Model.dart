import 'package:flutter/material.dart';

class checkInn {
  String name;
  String imageUrl;
  bool isSelected;

  checkInn(this.name, this.imageUrl, this.isSelected);
}

class checkInIssue extends StatefulWidget {
  checkInn _issue;

  checkInIssue(this._issue);

  @override
  _checkInIssueState createState() => _checkInIssueState();
}

class _checkInIssueState extends State<checkInIssue> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    String _backgroundImage;
    String setImage() {
      if(widget._issue.isSelected == true)
        _backgroundImage = "assets/Profile_Images/checked.png";
      else
        _backgroundImage = "assets/Profile_Images/unchecked.png";
      return _backgroundImage;
    }
    return Container(
      height: 126.0,
      width: 159.0,
      decoration: BoxDecoration(
        border: Border.all(color: widget._issue.isSelected ? Color(0xFF143A4C) : Color(0xFFE5E7E9)),
        color: widget._issue.isSelected ? Color(0xFFB2BFB8) : Color(0xFFFFFFFF),
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(0.0),
            topLeft:  Radius.circular(25.0),
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(25.0)
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment. spaceEvenly,
        children: <Widget>[
          Row(
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 124.5,top:14.5),
                  child: Container(
                      width: 19,
                      height: 19,
                      child: Image.asset(setImage()))
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top:27.5),
            child: Center(
              child: Image(
                image: AssetImage(widget._issue.imageUrl),
                width: 42.0,
                height: 52.0,
              ),),
          ),
          Padding(
            padding: const EdgeInsets.only(top:11.0,bottom:10.0),
            child: Text(
              widget._issue.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0,
                  color: Color(0xff02122C)
              ),),
          ),
        ],
      ),
    );
  }
}
