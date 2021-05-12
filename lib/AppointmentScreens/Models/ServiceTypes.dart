import 'package:flutter/material.dart';


class Service {
  String ServiceType;
  String imageUrl;
  bool isSelected;

  Service(this.ServiceType, this.imageUrl, this.isSelected);
}
class selectService extends StatefulWidget {
  Service _service;
  selectService(this._service);
  @override
  _selectServiceState createState() => _selectServiceState();
}

class _selectServiceState extends State<selectService> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 75.0,
      margin: EdgeInsets.all(20) ,
      decoration: BoxDecoration(
        border: Border.all(color: widget._service.isSelected ? Color(0xFF143A4C) : Color(0xFFE5E7E9)),
        color: widget._service.isSelected ? Color(0xffB2BFB8) : Colors.white,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(0.0),
            topLeft:  Radius.circular(15.0),
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(15.0)
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 115.0),
              child: Container(
                width: 150.0,
                height: 70.0,
                child: Center(
                  child: Row(
                    children: [
                      Image(
                        height: 50.0,
                        width: 50.0,
                        image: AssetImage(widget._service.imageUrl),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(widget._service.ServiceType,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                          color: Color(0XFF749BAD),
                        ),
                      ),
                      ),

                    ],
                  ),
               ),
            ),
          ),
        ],
      ),
    );
  }
}

