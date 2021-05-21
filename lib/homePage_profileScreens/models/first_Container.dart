import 'package:app_skin_mate/AppointmentScreens/family_Setup_Profile/family_Members.dart';
import 'package:app_skin_mate/Screens/WelcomeScreen.dart';
import 'package:app_skin_mate/Screens/homePage.dart';
import 'package:app_skin_mate/homePage_profileScreens/add_Insurance.dart';
import 'package:flutter/material.dart';


class firstCont {
  String? bodyName;
  String? imageUrl;

  firstCont({
    this.bodyName,
    this.imageUrl,
  });
}

final List<firstCont> field1 = [
  firstCont(
    bodyName: 'Family Members',
    imageUrl: 'assets/user_Profile/family_Members.png',
  ),
  firstCont(
    bodyName: 'Add Insurance',
    imageUrl: 'assets/user_Profile/add_Insurance.png',
  ),
];

Widget buildFirstContainer(BuildContext context, int index) {
  return Container(
    color: Colors.white,
    child: Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 60.0,
          child: GestureDetector(
          onTap: () {
            if(index == 0)
              Navigator.push(context, MaterialPageRoute(builder: (_) =>family_Members()));
            else
              Navigator.push(context, MaterialPageRoute(builder: (_) => addInsurance()));
          },
          child: ListTile(
            leading: Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(),
              child: CircleAvatar(
                child: ClipOval(
                  child: Image(
                    height: 50.0,
                    width: 50.0,
                    image: AssetImage(field1[index].imageUrl!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            title: Text(field1[index].bodyName!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13.0,
                color: Color(0XFF112027),
              ),
            ),
            trailing: IconButton(
                icon: Icon(Icons.arrow_forward_ios),
                iconSize: 30.0,
                onPressed: () {},
            ),
          ),
          ),
        ),
      ],
    ),
  );
}
