import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:task_1_zairza/modals/appbars.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:animated_button/animated_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '7.dart';
import 'Signup.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  _SigninState createState() => _SigninState();
}
class temp {
  static String email1=" ";
  static bool gsuccess=false;
  static bool isloggedin = false;
  static int selectindex=0;
  static bool pg2A= true;
}


class _SigninState extends State<Signin> {

  final GlobalKey<FormState> _formKey =GlobalKey<FormState>();
  final TextEditingController _emailController =TextEditingController();
  final TextEditingController _passwordController =TextEditingController();

  GoogleSignInAccount? _userobj;
  GoogleSignIn _googleSignIn = GoogleSignIn();
  static String email="manas";
  String wr=" ";


  void _login() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,


      );
      setState(() {
        temp.email1=_emailController.text;
        temp.gsuccess=false;
        temp.isloggedin=true;
      });

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        setState(() {
          wr='No user found for that email.';
        });
      } else if (e.code == 'wrong-password') {
        setState(() {
          wr='Wrong password provided for that user.';
        });

      }
      else{
        setState(() {
          wr='Invalid Input';
        });
      }
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    // Create a new credential
    final credential1 = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential1);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height - 10,
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min ,
                children: [
                  //SizedBox(height:50,),
                  Text('SkillKart',style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                  ),),
                  SizedBox(height: 40,),
                  Text('Login',style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),),
                  SizedBox(height: 20,),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Email',style: mdTextFieldStyle(),)
                  ),
                  SizedBox(height: 15,),
                  TextField(
                    controller: _emailController,
                    style: simpleTextFieldStyle(),
                    decoration: textFieldInputDecoration(""),
                  ),
                  SizedBox(height: 15,),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Password',style: mdTextFieldStyle(),)
                  ),
                  SizedBox(height: 15,),
                  TextField(
                    controller: _passwordController,
                    style: simpleTextFieldStyle(),
                    decoration: textFieldInputDecoration(""),
                  ),
                  SizedBox(height: 5,),
                  Text(wr,style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),),
                  SizedBox(height: 5,),
                  AnimatedButton(
                    onPressed: () {
                      _login();
                      temp.selectindex=0;
                      if (temp.isloggedin == true){
                          Navigator.push(
                            context,
                            PageTransition(
                                duration: Duration(milliseconds: 600),
                                type: PageTransitionType.rightToLeft,
                                child: Page7(),
                                inheritTheme: true,
                                ctx: context),
                          );
                      }
                    },
                    duration: 10,
                    height: 70,
                    width: 300,
                    color: Color(0xff0D49E2),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 8,),
                  AnimatedButton(
                    duration: 10,
                    height: 70,
                    width: 300,
                    color: Color(0xff0D49E2),
                    child: Text(
                      'Sign In With Google',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onPressed: ()  {
                      _googleSignIn.signIn().then((userData){
                        setState(() {
                          signInWithGoogle();
                          temp.selectindex=0;
                          temp.isloggedin=true;
                          _userobj =userData;
                          email=_userobj!.email;
                          temp.email1=email;
                          temp.gsuccess=true;
                          print(temp.email1);
                          if (temp.isloggedin == true){
                            Navigator.push(
                              context,
                              PageTransition(
                                  duration: Duration(milliseconds: 600),
                                  type: PageTransitionType.rightToLeft,
                                  child: Page7(),
                                  inheritTheme: true,
                                  ctx: context),
                            );
                          }
                        });
                      }).catchError((e){
                        print(e);
                      });
                    },
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Dont't have an account? ",style: mediumTextFieldStyle(),),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageTransition(
                                duration: Duration(milliseconds: 600),
                                type: PageTransitionType.leftToRight,
                                child: Signup(),
                                inheritTheme: true,
                                ctx: context),
                          );},
                        child: Text("Create One ",style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue
                        ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 110,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
