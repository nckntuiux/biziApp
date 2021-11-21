import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:ltx_deliver/assets/styles.dart';
import 'package:ltx_deliver/ltx.dart';
import 'package:ltx_deliver/view/account/address_edit.dart';
import 'package:ltx_deliver/view/item.dart';

//Элемент сетки главного экрана
class ProductItemState extends State<ProductItem> {
  bool inCart = false; //Товаров в корзине
  Product product;

  ProductItemState(this.product);

  void _onAddItemPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ItemPage(product: product)),
    );
  }

  /*DEPRECATED!! Перестраивает кнопки в карточке, оставил на всякий
  Widget _buildButtons() {
    if (!inCart) {
      new Container(
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          child: new FlatButton(
            onPressed: () => _onAddItemPressed(),
            child: SizedBox(
                width: double.infinity,
                child: Text("*Ценовой диапазон*", style: sButton)),
            height: 48,
            color: Colors.grey[200],
          ),
        ),
        margin: EdgeInsets.all(4.0),
      );
    } else {
      new Container(
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          child: new FlatButton(
            onPressed: () => _onAddItemPressed(),
            child: SizedBox(
                width: double.infinity,
                child: Text("*Ценовой диапазон*", style: sButtonLight)),
            height: 48,
            color: brandRGB0[900],
          ),
        ),
        margin: EdgeInsets.all(4.0),
      );
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //TODO: Обработка нажатия на элемент
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ItemPage(product: product,)),
        );
      },
      child: new Wrap(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: new Container(
                width: double.infinity,
                //padding: EdgeInsets.only(right: 15),
                //margin: EdgeInsets.only(right: 15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(16.0))),
                child: Image(
                  fit: BoxFit.fitHeight,
                  image: AssetImage('assets/fake/fake.png'),
                  width: double.infinity,
                ) //TODO: ПОФИКСИТЬ КАРТИНКУ!!!
                ),
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 6.0, bottom: 6.0, right: 6.0),
                padding: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.all(Radius.circular(16.0))),
                child: new Text("12-15 шт/уп"),
              ),
              Container(
                margin: EdgeInsets.only(top: 6.0, bottom: 6.0),
                padding: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.all(Radius.circular(16.0))),
                child: new Text("99 цветов"),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: new Text(
                    product.name,
                    style: sHeading,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: new Text(
                    product.description,
                    //product.description.split("\n")[0],
                    style: sAlt,
                  ),
                ),
              ],
            ),
          ),
          new Container(
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              child: new FlatButton(
                onPressed: () => _onAddItemPressed(),
                child: SizedBox(
                    width: double.infinity,
                    child: Center(
                        child: Text("*Стоимость товара*",
                            style:
                                sButton)) //TODO: Изменить цвет и надпись динамически от выбранных в корзине товаров
                    ),
                height: 48,
                color: Colors.grey[200],
              ),
            ),
            margin: EdgeInsets.all(4.0),
          )
        ],
      ),
    );
  }
}

//Элемент списка главного экрана
class OptionItemState extends State<OptionItem> {
  int inCart = 0;

  Option option;
  Product product;

  OptionItemState(this.option, this.product);

  void _onItemInGridTapped() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ItemPage(product: product)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ItemPage(product: product)),
        );
      },
      child: new Container(
        margin: EdgeInsets.all(8.0),
        child: new Row(
          children: [
            Column(
              children: [
                new Container(
                    width: 81,
                    height: 81,
                    padding: EdgeInsets.only(right: 15, left: 15),
                    //margin: EdgeInsets.only(right: 15),
                    child: Image(
                        fit: BoxFit.fitHeight,
                        image: AssetImage('assets/fake/fake.png'))),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: new Text("В корзине: " + inCart.toString()),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 6.0,
                    ),
                    child: new Text(
                      option.name,
                      style: sHeading,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 6.0,
                    ),
                    child: new Text(
                      option.description,
                      style: sAlt,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


//Элемент списка адресов
class AddressItemState extends State<AddressItem> {
  String btnName = "Сделать основным";

  void _onDefaultPressed() {
    setState(() {
      btnName = "Основной";
    });
  }

  void _onEditPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddressChangePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.03),
          blurRadius: 28.8,
          spreadRadius: 2.0,
        )
      ]),
      child: new Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        margin: EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: new Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Container(
                  child: new AddressTextItem(),
                  width: double.infinity,
                ),
              ),
              new Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      child: new FlatButton(
                        onPressed: _onEditPressed,
                        child: new Text(
                          "Изменить",
                          style: sButton,
                        ),
                        color: Colors.grey[200],
                        height: 48,
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    child: new FlatButton(
                      onPressed: _onDefaultPressed,
                      child: new Text(
                        btnName,
                        style: sButton,
                      ),
                      color: Colors.grey[200],
                      height: 48,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

//Виджеты с
class ProductItem extends StatefulWidget {
  final Product product;

  ProductItem(this.product);

  @override
  createState() => new ProductItemState(product);
}

class OptionItem extends StatefulWidget {
  final Option option;
  final Product product;

  OptionItem(this.option, this.product);

  @override
  createState() => new OptionItemState(option, product);
}

class AddressItem extends StatefulWidget {
  @override
  createState() => new AddressItemState();
}

//DEPRECATED!! Элемент списка корзины
class ListItemCompact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Row(
      children: [
        new Container(
            width: 61,
            height: 61,
            padding: EdgeInsets.only(right: 15),
            //margin: EdgeInsets.only(right: 15),
            child: Image.asset(
              'assets/fake/fake.png',
              width: 61,
              height: 61,
              fit: BoxFit.fitHeight,
            )),
        new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: new Text(
                "2499 ₽ | Полутороспальный (1.5)",
                style: sAlt,
              ),
            ),
            new Row(
              children: [
                new Text(
                  "Сатин Люкс+",
                  style: sHeading,
                ),
                new Text("2 шт.", style: sHeadingCompact),
              ],
            )
          ],
        ),
      ],
    );
  }
}

class AddressTextItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 4.0),
          child: new Text(
            "Офис (Основной адрес)",
            style: sHeading,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: new Text(
              "Кантемировская ул., 47А, корп. 2, стр. 6,\nМосква, Россия\nПолучатель: Первышин Михаил Анатольевич \n+7 (904) 371-48-57"),
        ),
      ],
    );
  }
} //Элемент текстового описания адреса
