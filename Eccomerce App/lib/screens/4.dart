import 'package:animated_button/animated_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';
import 'package:page_transition/page_transition.dart';
import 'package:task_1_zairza/modals/appbars.dart';
import 'package:task_1_zairza/screens/Signup.dart';
import 'package:task_1_zairza/screens/Signin.dart';


class Page4 extends StatefulWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  _Page4State createState() => _Page4State();
}

class _Page4State extends State<Page4> {

  GoogleSignIn _googleSignIn = GoogleSignIn();

  void _signOut() async {
    await FirebaseAuth.instance.signOut();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profile1appbar(context),
      bottomNavigationBar: DemoBottomAppBar(),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - 360,
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min ,
              children: [
                //SizedBox(height:50,),
                Icon(Icons.person,color: Colors.black,size: 200,),
                SizedBox(height: 20,),
                Text(temp.email1,
                  style: TextStyle(
                    fontSize: 20,
                      fontWeight: FontWeight.bold,
                          color: Colors.green,
                  ),
                ),
                SizedBox(height: 10,),

                AnimatedButton(
                  duration: 10,
                  height: 50,
                  width: 120,
                  color: Color(0xff0D49E2),
                    child: Text(temp.isloggedin ?"Log Out":"Log In",style: TextStyle(
                      fontSize: 23,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )
                    ),
                    onPressed: ()  {
                      temp.isloggedin?
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Signin())
                      )
                          :temp.gsuccess?
                      _googleSignIn.signOut().then((userData){
                        setState(() {
                          print("done");
                          temp.isloggedin=false;
                          temp.gsuccess=false;
                          Navigator.push(
                            context,
                              MaterialPageRoute(builder: (context) => Signin())
                          );
                        });
                      }).catchError((e){
                        print(e);
                      }):
                      _signOut();
                      setState(() {
                      temp.isloggedin=false;
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Signin())
                      );
                      });

                    },
                  ),

              ],
            ),
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}
