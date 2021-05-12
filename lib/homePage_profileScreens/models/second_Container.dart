import 'package:app_skin_mate/Screens/WelcomeScreen.dart';
import 'package:app_skin_mate/homePage_profileScreens/ProfileChangePw.dart';
import 'package:flutter/material.dart';


class secondCont {
  String bodyName;
  String imageUrl;

  secondCont({
    this.bodyName,
    this.imageUrl,
  });
}

final List<secondCont> field2 = [
  secondCont(
    bodyName: 'TouchID Authentication',
    imageUrl: 'assets/user_Profile/touch_ID.png',
  ),
  secondCont(
    bodyName: 'Change Password',
    imageUrl: 'assets/user_Profile/change_Password.png',
  ),
];

Widget buildSecondContainer(BuildContext context, int index) {
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
                Navigator.push(context, MaterialPageRoute(builder: (_) => WelcomeScreen()));
              else
                Navigator.push(context, MaterialPageRoute(builder: (_) => profileChangePw()));
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
                    image: AssetImage(field2[index].imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
             ),
            ),
            title: Text(field2[index].bodyName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13.0,
                color: Color(0XFF112027),
              ),
            ),
            trailing: IconButton(
              icon: index ==0 ? Icon(Icons.toggle_on_rounded) : Icon(Icons.arrow_forward_ios),
                iconSize: index ==0 ? 50.0 : 30.0,
                onPressed: () => {}
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
