import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:page_transition/page_transition.dart';
import 'package:task_1_zairza/screens/cart.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Hive.openBox("details"),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final cartBox = Hive.box("details");
          return Stack(
            children: [
              cartBox.length > 0
                  ? Container(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(
                  cartBox.length.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              )
                  : Container(),
              IconButton(
                icon: const Icon(Icons.shopping_cart_rounded,color: Colors.black,),
                onPressed: () {
                  Navigator.push(
                    context,
                    PageTransition(
                        duration: Duration(milliseconds: 600),
                        type: PageTransitionType.rightToLeft,
                        child: Cart(),
                        inheritTheme: true,
                        ctx: context),
                  );
                },
              ),
            ],
          );
        }
        return Container();
      },
    );
  }
}
