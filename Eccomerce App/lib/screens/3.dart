import 'dart:convert';

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:task_1_zairza/modals/appbars.dart';


import '7.dart';
class Page3 extends StatefulWidget{
  const Page3({Key? key}) : super(key: key);

  @override
  _Page3State createState() => _Page3State();
}
class _Page3State extends State<Page3>{
  String date=formatDate(DateTime.now(), [yy, '-', M, '-', d]);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffE5E5E5),
        appBar: orderappbar(context),
        bottomNavigationBar: DemoBottomAppBar(),
        body: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: 30,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Page7(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left:20,bottom: 20,right: 20),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              child: Text(
                                date,
                              ),
                            ),
                          ),
                          SizedBox(height: 8,),
                          Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow:  [
                                  BoxShadow(
                                    color: Colors.white.withOpacity(1),
                                    spreadRadius: 5,
                                    blurRadius: 0,
                                    offset: Offset(0, 1), // changes position of shadow
                                  ),
                                ],
                                border: Border.all(
                                  color: Colors.white,
                                  width: 13,
                                ),
                              ),
                              child: Row(
                                children:<Widget>[
                                  Image(image: AssetImage('assets/images/imagefull.png'),),
                                  Column(
                                    children: [
                                      Padding(padding:EdgeInsets.only(left:10,bottom: 10),
                                          child: Column(
                                            children: [
                                              Text('Laptop',style: TextStyle(fontSize: 28,color:Colors.black),),],)),
                                      Text('Zairza',
                                        style: TextStyle(fontSize: 10,color:Colors.black),
                                        textAlign: TextAlign.left,
                                      ),
                                      SizedBox(height: 30,),
                                      Text("\$3000",style: TextStyle(fontSize: 20,color:Colors.black),)
                                    ],
                                  )


                                ],
                              )

                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        )
    );

  }
}