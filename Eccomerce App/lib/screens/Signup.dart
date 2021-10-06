import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:task_1_zairza/modals/appbars.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:animated_button/animated_button.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '7.dart';
import 'Signin.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}
bool gsignin=false;

class _SignupState extends State<Signup> {



  final TextEditingController _emailController =TextEditingController();
  final TextEditingController _passwordController =TextEditingController();
  final TextEditingController _conpasswordController =TextEditingController();
  late bool _success=false;

  bool _isloggedin = false;
  GoogleSignInAccount? _userobj;
  GoogleSignIn _googleSignIn = GoogleSignIn();

  String wr=" ";

  String email=" ";

  void _register() async {
    try {
      if(_passwordController.text==_conpasswordController.text) {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
            email: _emailController.text,
            password: _passwordController.text
        );
        setState(() {
          wr="Succesfully Signed Up";
          _success=true;
        });

      }
      else{
        setState(() {
          wr="Password Does Not Match";
          _success=false;
        });

      }

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        setState(() {
          wr='The password provided is too weak.';
          _success=false;
        });

      } else if (e.code == 'email-already-in-use') {
        setState(() {
          wr='The account already exists for that email. Login Now';
          _success=true;
        });

      }
    } catch (e) {
      print(e);
      wr="Invalid Inputs";
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
          //height: MediaQuery.of(context).size.height ,
          //alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24,vertical: 50),
            child: Column(
              mainAxisSize: MainAxisSize.min ,
              children: [
                Text('SkillKart',style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),),
                SizedBox(height: 40,),
                Text('Register',style: TextStyle(
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
                SizedBox(height: 15,),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Confirm Password',style: mdTextFieldStyle(),)
                ),
                SizedBox(height: 15,),
                TextField(
                  controller: _conpasswordController,
                  style: simpleTextFieldStyle(),
                  decoration: textFieldInputDecoration(""),
                ),
                SizedBox(height: 7.5,),
                Align(
                    alignment: Alignment.center,
                    child:_success?Text(wr,style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),)
                :
                Text(wr,style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 12),)),
                SizedBox(height: 7.5,),
                AnimatedButton(
                  onPressed: () {
                    _register();
                  },
                  duration: 10,
                  height: 70,
                  width: 300,
                  shadowDegree: ShadowDegree.dark,
                  color: Color(0xff0D49E2),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 13,),
                AnimatedButton(
                  duration: 10,
                  height: 70,
                  width: 300,
                  color: Color(0xff0D49E2),
                  child: Text(
                    'Sign In With Google',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
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
                SizedBox(height: 13,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Have an account? ",style: TextStyle(
                      fontSize: 20,fontWeight: FontWeight.bold
                    ),),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                              duration: Duration(milliseconds: 600),
                              type: PageTransitionType.rightToLeft,
                              child: Signin(),
                              inheritTheme: true,
                              ctx: context),
                        );},
                        child:
                        AnimatedDefaultTextStyle(
                          duration: Duration(milliseconds: 300),
                          style: _success?TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              color: Colors.blue
                          ):TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              decorationStyle: TextDecorationStyle.dashed,
                              color: Colors.blue
                          ),
                          child: Text("Login Now "),
                        )
                    ),

                  ],
                ),
                SizedBox(height: 110,),

              ],
            ),
          ),
        ),
      ),
    ));
  }
}


