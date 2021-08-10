import 'package:flutter/material.dart';

import '../../models/product.dart';

class ProductForm extends StatelessWidget {
  final globalKey = GlobalKey<ScaffoldState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        title: Text('Cadastrando Produto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: TextField(
                controller: _quantityController,
                decoration: InputDecoration(labelText: 'Quantidade'),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: TextField(
                controller: _valueController,
                decoration: InputDecoration(labelText: 'Valor'),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: RaisedButton(
                onPressed: () {
                  final String name = _nameController.text;
                  final int quantity = int.tryParse(_quantityController.text);
                  final double value = double.tryParse(_valueController.text);

                  final newProduct = Product(
                    name: name,
                    quantity: quantity,
                    value: value,
                  );

                  // debugPrint('$newProduct');
                  final snackBar = SnackBar(content: Text('$newProduct'));
                  globalKey.currentState.showSnackBar(snackBar);

                  // Scaffold.of(context).showSnackBar(
                  //   SnackBar(
                  //     content: Text('$newProduct'),
                  //   ),
                  // );
                },
                child: Text('Cadastrar'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
