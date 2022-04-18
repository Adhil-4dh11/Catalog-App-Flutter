import 'package:catalog_app/pages/add_to_cart.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../models/catalog.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color(0xFF4A148C)
        ),
        backgroundColor: context.canvasColor,
        title: const Text(
            'Go Back',
            style: TextStyle(
                color: Color(0xFF1A237E),
              fontWeight: FontWeight.bold,
            )),
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        buttonPadding: EdgeInsets.zero,
        children: [
          catalog.price.text.bold.xl4.red900.make(),
          AddToCart(catalog: catalog).wh(100, 50),
        ],
      ).p32(),
      body: SafeArea(
        child: Column(
          children: [
            Hero(
                tag: Key(catalog.id.toString()),
                child: Image.network(catalog.image),
            ).h32(context),
            Expanded(child: VxArc(
              height: 30,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                color: Colors.black,
                width: context.screenWidth,
                child: Column(
                  children: [
                    catalog.name.text.lg.color(const Color(0xFF1A237E),).xl3.extraBold.make().py16(),
                    catalog.desc.text.lg.purple900.bold.make(),
                  ],
                ).p32(),
              ),
            ))
          ],
        )..p16(),
      ),
    );
  }
}