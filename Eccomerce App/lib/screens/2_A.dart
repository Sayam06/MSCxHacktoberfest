import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:page_transition/page_transition.dart';
import 'package:task_1_zairza/screens/2_B.dart';
import 'package:task_1_zairza/screens/7.dart';
import 'package:task_1_zairza/modals/appbars.dart';
class Page2A extends StatefulWidget{
  const Page2A({Key? key}) : super(key: key);

  @override
  _Page2AState createState() => _Page2AState();
}
class _Page2AState extends State<Page2A>{
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Hive.openBox('details'),
    builder: (BuildContext contex,AsyncSnapshot snapshot) {
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
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                SizedBox(width: 200),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 3,
                    ),
                  ),
                  child: IconButton(
                    iconSize: 10.0,
                    icon: Icon(
                        Icons.grid_on_outlined, color: Colors.black, size: 30),
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
                  ),
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
                    icon: Icon(
                        Icons.list_outlined, color: Colors.black, size: 30),
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
                  ),
                ),
              ],
            ),
            Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 30),
                  itemCount: 10,
                  itemBuilder: (BuildContext ctx, index) {
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
                        padding: EdgeInsets.all(10),
                        child: Wrap(
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 13,
                                  ),
                                ),
                                child: Image(image: AssetImage(
                                    'assets/images/image 1.png'),)
                            ),

                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),

      );

    }
    );


  }
}