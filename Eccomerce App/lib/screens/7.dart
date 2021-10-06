import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:task_1_zairza/modals/appbars.dart';
import 'package:task_1_zairza/screens/Signin.dart';

import '../modals/details.dart';



class Page7 extends StatefulWidget{
  const Page7({Key? key}) : super(key: key);

  @override
  _Page7State createState() => _Page7State();
}
class _Page7State extends State<Page7>{
  String email = temp.email1;
  int _itemCount = 1;
  void addDetails(Details detail){
    final detailsBox = Hive.box('details');
    detailsBox.add(detail);
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Hive.openBox('details'),
      builder: (BuildContext contex,AsyncSnapshot snapshot){ 
        return Scaffold(
          backgroundColor: Color(0xffE5E5E5),
          appBar: skill1appbar(context),
          bottomNavigationBar: DemoBottomAppBar(),
          body: Row(
            children: List.generate(1, (index) {
              return Padding(
                padding: EdgeInsets.only(left:20,bottom: 20,right: 20,top: 20),
                child: Row(
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
                        child: Column(
                          children:<Widget>[
                            Image(image: AssetImage('assets/images/imagefull.png'),width: 325,),
                            Column(
                              children: [
                                Padding(padding:EdgeInsets.only(left:10,bottom: 10),
                                    child: Row(
                                      children: [
                                        Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text('Laptop',style: TextStyle(fontSize: 30,color:Colors.black,fontWeight: FontWeight.bold),)),],)),
                                Text('Zairza',
                                  style: TextStyle(fontSize: 15,color:Colors.black,),

                                ),
                                SizedBox(height: 20,),

                                Text("                                                     \$3000",style: TextStyle(fontSize: 20,color:Color(0xff6A6A6A),fontWeight: FontWeight.bold),),
                                SizedBox(height: 45,width: 30,),
                                Row(
                                  children: [
                                    _itemCount!=0? new  IconButton(icon: new Icon(Icons.remove),onPressed: ()=>setState(()=>_itemCount--),):new Container(),
                                    new Text(_itemCount.toString()),
                                    new IconButton(icon: new Icon(Icons.add),onPressed: ()=>setState(()=>_itemCount++)),
                                  ],
                                ),

                                SizedBox(height: 40,width: 30,),
                                AnimatedButton(
                                  color: Color(0xff0D49E2),
                                    width: 300,
                                    child: Text("Add To Cart",style: TextStyle(
                                        fontSize: 23,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold
                                    )
                                    ),
                                    onPressed:(){
                                      final newDetail = Details("Laptop",_itemCount );
                                      addDetails(newDetail);
                                    },
                                  ),

                                SizedBox(height: 10,width: 30,),

                              ],
                            )


                          ],
                        )

                    )




                  ],
                ),
              );

            }
            ),
          ),
      );
        },
    );

  }
}