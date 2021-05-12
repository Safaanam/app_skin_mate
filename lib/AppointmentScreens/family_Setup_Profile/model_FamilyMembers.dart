import 'package:app_skin_mate/AppointmentScreens/family_Setup_Profile/delete_FamilyMember.dart';
import 'package:app_skin_mate/AppointmentScreens/family_Setup_Profile/family_ProfileSetup.dart';
import 'package:flutter/material.dart';

class Family {
  String name;
  String imageUrl;


  Family(this.name, this.imageUrl);
}

class familyMembers extends StatefulWidget {
  Family _family;
  familyMembers(this._family);
  @override
  _familyMembersState createState() => _familyMembersState();
}

class _familyMembersState extends State<familyMembers> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 75.0,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFE5E7E9)),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Padding(
              padding: const EdgeInsets.only(left:30.0,right: 40.0),
              child: Center(
                child: Image(
                  height: 50.0,
                  width: 50.0,
                  image: AssetImage(widget._family.imageUrl),
                ),
              )
          ),
          Padding(
            padding: const EdgeInsets.only(),
            child: Container(
              height: 50.0,
              width: 80.0,
              child: Text(widget._family.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                  color: Color(0XFF112027),
               ),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 110.0,bottom: 10.0),
              child: Container(
              child: GestureDetector(
              onTap: () {
                bottomscreen(context);
              },
                  child: Text("...",
                    style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                    color: Color(0XFF687181),
                  ),)
              ),
             ),
          ),
        ],
      ),
    );
  }
  Widget bottomscreen(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(50.0),
          topLeft: Radius.circular(50.0),),
      ),
      builder: (context) => Container(
        height: 100.0,
        child: Column(
            children: <Widget>[
              Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color(0XFFE5E7E9),
                        width: 2.0,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 70.0),
                    child: FlatButton(
                      onPressed: () => {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => family_SetProfile()))
                      },
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.edit),
                          SizedBox(width: 5.0),
                          Text("Edit Family Member",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              color: Color(0XFF749BAD),
                            ),)
                        ],
                      ),
                    ),
                  ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 70.0),
                child: Container(
                  child: FlatButton(
                    onPressed: () => {
                      deleteAlert(context)
                    },
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.delete),
                        SizedBox(width: 5.0),
                        Text("Delete Member",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                            color: Color(0XFFA2071E),
                          ),)
                      ],
                    ),
                  ),
                ),
              ),
            ],
        )
      ),
    );
  }
}
