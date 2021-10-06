import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:task_1_zairza/Services/api.dart';
import 'package:task_1_zairza/backend/response.dart';
import 'package:task_1_zairza/modals/appbars.dart';
import 'package:task_1_zairza/modals/itemlist.dart';
import 'package:task_1_zairza/modals/products.dart';

import '2_A.dart';
import '7.dart';

class Page2B extends StatefulWidget{
  const Page2B({Key? key}) : super(key: key);

  @override
  _Page2BState createState() => _Page2BState();
}
class _Page2BState extends State<Page2B>{
  @override
  void initState() {
    super.initState();
    // getData = _api.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:FutureBuilder<Response>(
        future: Api.getProducts(),
        builder: (context, snapshot) {
        if (snapshot.hasData) {
            Response response = snapshot.data!;
            List<Product> products =
            productFromJson(jsonEncode(response.data));
        return Scaffold(
          backgroundColor: Color(0xffE5E5E5),
          appBar: skillappbar(context),
          bottomNavigationBar: DemoBottomAppBar(),
          body: Column(
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
                          print(products);
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
                child: ItemsList(
                  products: products,
                ),

              ),
            ],
          ),

          );
      } else if (snapshot.hasError) {
      return Text(snapshot.error.toString());
      }
      return new CircularProgressIndicator();
    }),
    );
  }
}