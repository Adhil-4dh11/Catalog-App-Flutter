import 'package:catalog_app/pages/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color(0xFF4A148C)
        ),
        backgroundColor: Colors.transparent,
        title: 'Cart'.text.color(
            const Color(0xFF1A237E)).fontWeight(FontWeight.bold).make(),
      ),
      body: Column(
        children: [
            CartList().p32().expand(),
          const Divider(),
          const CartTotal(),
        ],
      ),
    );
  }
}

class CartTotal extends StatelessWidget {
  const CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          30.widthBox,
          ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: const Color(0xFFBA68C8),
                    content: 'Buying Not Supported Yet'.text.xl.indigo900.extraBold.make(),
                ),);
              },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    const Color(0xFF3F51B5),
                )),
            child: 'Buy'.text.white.make(),
          ).w32(context),
        ],
      )
    );
  }
}

class CartList extends StatelessWidget {
  final cart = CartModel();

   CartList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty? "Nothing To Show Here ".text.bold.xl3.purple900.makeCentered()
        : ListView.builder(
          itemCount: _cart.items.length,
          itemBuilder: (context, index) =>  ListTile(
          leading: const Icon(Icons.done),
          trailing: IconButton(
              onPressed: () => RemoveMutation(_cart.items[index]),
              icon: const Icon(Icons.remove_circle_outline)
          ),
          title: _cart.items[index].name.text.make(),
        )
    );
  }
}
