
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:task_1_zairza/modals/products.dart';
import 'package:task_1_zairza/screens/2_A.dart';
import 'package:task_1_zairza/screens/2_B.dart';
import 'package:task_1_zairza/screens/7.dart';

import 'appbars.dart';

class ItemCard extends StatelessWidget{
  ItemCard({required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          Row(
            children: [
              SizedBox(height: 70,),
              Text(
                "    View   ",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20,color:Colors.black),
              ),
              SizedBox(width:200),
              Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 3,
                    ),
                  ),
                  child: IconButton(
                    iconSize: 10.0,
                    icon:  Icon(Icons.grid_on_outlined,color: Colors.black,size: 30),
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageTransition(
                            duration: Duration(milliseconds: 6),
                            type: PageTransitionType.rightToLeft,
                            child: Page2A(),
                            inheritTheme: true,
                            ctx: context),
                      );
                    },
                  )
              ),
              Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 3,
                    ),
                  ),
                  child: IconButton(
                    iconSize: 10.0,
                    icon:  Icon(Icons.list_outlined,color: Colors.black,size: 30),
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageTransition(
                            duration: Duration(milliseconds: 6),
                            type: PageTransitionType.rightToLeft,
                            child: Page2B(),
                            inheritTheme: true,
                            ctx: context),
                      );
                    },
                  )
              ),
            ],
          ),
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
                                Image(image: NetworkImage(product.image),),
                                Column(
                                  children: [
                                    Padding(padding:EdgeInsets.only(left:10,bottom: 10),
                                        child: Column(
                                          children: [
                                            Text(product.name,style: TextStyle(fontSize: 28,color:Colors.black),),],)),
                                    Text('Zairza',
                                      style: TextStyle(fontSize: 10,color:Colors.black),
                                      textAlign: TextAlign.left,
                                    ),
                                    SizedBox(height: 30,),
                                    Text("\$product.price",style: TextStyle(fontSize: 20,color:Colors.black),)
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
      );

  }
}