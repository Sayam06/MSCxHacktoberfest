import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:task_1_zairza/screens/2_B.dart';
import 'package:task_1_zairza/screens/4.dart';
import 'package:task_1_zairza/screens/cart.dart';
import 'package:task_1_zairza/screens/Signin.dart';
import 'package:task_1_zairza/widgets/cart_icon.dart';

import '../screens/2_A.dart';
import '../screens/3.dart';
import '../screens/7.dart';
PreferredSizeWidget skillappbar(BuildContext context){
  return AppBar(
    backgroundColor: Colors.white,
    toolbarHeight: 70,
    title: Align(
      alignment:  Alignment.center,
      child: Text(
        "     SkillKart",
        style: TextStyle(
          fontSize: 30,
          color: Colors.black,
        ),
      ),
    ),
      actions: <Widget>[
        Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: GestureDetector(
                onTap: () {

                },
                child: CartIcon()
              )
        ),
      ]
  );
}


class DemoBottomAppBar extends StatefulWidget {
  const DemoBottomAppBar({Key? key}) : super(key: key);

  @override
  State<DemoBottomAppBar> createState() => _DemoBottomAppBarState();
}


class _DemoBottomAppBarState extends State<DemoBottomAppBar>{
  _DemoBottomAppBarState();
  void _onItemTapped(int index) {
    setState(() {
    temp.selectindex = index;
      print(index);
      if(temp.selectindex==2){
        Navigator.push(
          context,
          PageTransition(
              duration: Duration(milliseconds: 6),
              type: PageTransitionType.rightToLeft,
              child: Page4(),
              inheritTheme: true,
              ctx: context),
        );

      }
      else if(temp.selectindex==0){
        Navigator.push(
          context,
          PageTransition(
              duration: Duration(milliseconds: 6),
              type: PageTransitionType.rightToLeft,
              child: temp.pg2A?Page2A():Page2B(),
              inheritTheme: true,
              ctx: context),
        );
      }
      else if(temp.selectindex==1){
        Navigator.push(
          context,
          PageTransition(
              duration: Duration(milliseconds: 6),
              type: PageTransitionType.rightToLeft,
              child: Page3(),
              inheritTheme: true,
              ctx: context),
        );
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xff0D49E2),
      currentIndex: temp.selectindex,
      selectedItemColor: Colors.black,
      onTap: _onItemTapped,
      items: [
        new BottomNavigationBarItem(
          backgroundColor: Colors.red,
          icon: new Icon(Icons.home,color: temp.selectindex==0 ? Colors.black : Colors.white),
          label: ''
        ),
        new BottomNavigationBarItem(
          icon: new Icon(Icons.restore_outlined,color: temp.selectindex==1 ? Colors.black : Colors.white,),
          label: ''
        ),

        new BottomNavigationBarItem(
            icon: Icon(Icons.person,color: temp.selectindex==2 ? Colors.black : Colors.white),
            label: ''
        )
      ],

    );
  }
}

PreferredSizeWidget orderappbar(BuildContext context){
  return AppBar(
      backgroundColor: Colors.white,
      toolbarHeight: 70,
      leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                  duration: Duration(milliseconds: 600),
                  type: PageTransitionType.leftToRight,
                  child: Page7(),
                  inheritTheme: true,
                  ctx: context),
            );
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      title: Align(
        alignment:  Alignment.center,

        child: Text(
          "Your Orders",
          style: TextStyle(
            fontSize: 30,
            color: Colors.black,
          ),
        ),
      ),

  );
}

PreferredSizeWidget profileappbar(BuildContext context){
  return AppBar(
    backgroundColor: Colors.white,
    toolbarHeight: 70,
    leading: GestureDetector(
      onTap: () {},
      child: Icon(
        Icons.arrow_back_ios,
        color: Colors.black,
      ),
    ),
    title: Align(
      alignment:  Alignment.center,

      child: Text(
        "Your Orders",
        style: TextStyle(
          fontSize: 30,
          color: Colors.black,
        ),
      ),
    ),

  );
}

InputDecoration textFieldInputDecoration(String xtext){
  return InputDecoration(
    hintText: xtext,
    border: OutlineInputBorder(),
  );
}

TextStyle simpleTextFieldStyle(){
  return TextStyle(
    fontSize: 16,
  );
}

TextStyle mediumTextFieldStyle(){
  return TextStyle(
    fontSize: 17,
  );
}
TextStyle mdTextFieldStyle(){
  return TextStyle(
      fontSize: 23,
      color: Colors.black,
      fontWeight: FontWeight.bold
  );
}

PreferredSizeWidget skill1appbar(BuildContext context){
  return AppBar(
      backgroundColor: Colors.white,
      toolbarHeight: 70,
      leading: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => temp.pg2A?Page2A():Page2B(),
            ),
          );
        },
        child: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
      ),
      title: Align(
        alignment:  Alignment.center,
        child: Text(
          "SkillKart",
          style: TextStyle(
            fontSize: 30,
            color: Colors.black,
          ),
        ),
      ),
      actions: <Widget>[
        CartIcon()
      ]
  );
}
PreferredSizeWidget profile1appbar(BuildContext context){
  return AppBar(
    backgroundColor: Colors.white,
    toolbarHeight: 70,
    leading: GestureDetector(
      onTap: () {},
      child: Icon(
        Icons.arrow_back_ios,
        color: Colors.black,
      ),
    ),
    title: Align(
      alignment:  Alignment.centerLeft,

      child: Text(
        "           Profile",
        style: TextStyle(
          fontSize: 30,
          color: Colors.black,
        ),
      ),
    ),

  );
}

PreferredSizeWidget cartappbar(BuildContext context){
  return AppBar(
    backgroundColor: Colors.white,
    toolbarHeight: 70,
    leading: GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageTransition(
              duration: Duration(milliseconds: 600),
              type: PageTransitionType.leftToRight,
              child: Page7(),
              inheritTheme: true,
              ctx: context),
        );
      },
      child: Icon(
        Icons.arrow_back_ios,
        color: Colors.black,
      ),
    ),
    title: Align(
      alignment:  Alignment.centerLeft,
      child: Text(
        "              Cart",
        style: TextStyle(
          fontSize: 30,
          color: Colors.black,
        ),
      ),
    ),

  );
}

