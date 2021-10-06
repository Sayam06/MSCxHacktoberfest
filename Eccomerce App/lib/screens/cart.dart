import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:task_1_zairza/modals/appbars.dart';

import '../modals/details.dart';
class Cart extends StatefulWidget{
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}
class _CartState extends State<Cart>{
  final detailsBox = Hive.box('details');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffE5E5E5),
        appBar: cartappbar(context),
        bottomNavigationBar: DemoBottomAppBar(),
        body: Container(
          child: Wrap(
              children:[
                SizedBox(height: 30,width: 10,),
                SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: List.generate(detailsBox.length, (index) {
                        final details=detailsBox.get(index) as Details;
                        return Padding(
                          padding: EdgeInsets.only(left:20,bottom: 20,right: 20),
                          child: Column(
                            children: [
                              SizedBox(height: 5,),
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
                                      width: 10,
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
                                                  Text(details.productID,style: TextStyle(fontSize: 28,color:Colors.black),),],)),
                                          Text('Zairza',
                                            style: TextStyle(fontSize: 10,color:Colors.black),
                                            textAlign: TextAlign.left,
                                          ),
                                          Text("Quantity: "+details.quantity.toString(),style: TextStyle(fontSize: 20,color:Colors.black),),
                                          SizedBox(height: 30,),
                                          Text("\$3000",style: TextStyle(fontSize: 20,color:Colors.black),)
                                        ],
                                      ),


                                    ],
                                  )

                              ),
                            ],
                          ),
                        );

                      }
                      ),
                    ),
                  ),
                ),



              ]
          ),
        )
    );

  }
}