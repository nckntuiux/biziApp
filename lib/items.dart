import 'package:flutter/material.dart';
import 'package:ltx_deliver/assets/styles.dart';
import 'package:ltx_deliver/view/account/address_edit.dart';

class ListItem extends StatefulWidget {
  @override
  createState() => new ListItemState();
}
class ListItemState extends State<ListItem> {
  
  int inCart = 0;

  void _onAddItemPressed(int addedItems) {
    if (addedItems == 1) {
      setState(() {
        inCart++;
      });
    } else if (addedItems <= -1) {
      setState(() {
        inCart--;
      });
    } else if (addedItems > 1) {
      setState(() {
        _buildButtons();
        inCart += addedItems;
      });
    } else {
      setState(() {
        _buildButtons();
      });
    }
    
  }
  
  Widget _buildButtons() {
    if (inCart == 0) {
      return new Row(
        children: [
          new Container(
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              child: new FlatButton(
                onPressed: () => _onAddItemPressed(1),
                child: Text("В корзину", style: sButton),
                minWidth: 54,
                height: 48,
                color: Colors.grey[200],
              ),
            ),
            margin: EdgeInsets.all(4.0),
          ),
          new Container(
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              child: new FlatButton(
                onPressed: () => _onAddItemPressed(5),
                child: Text("5", style: sButton),
                minWidth: 54,
                height: 48,
                color: Colors.grey[200],
              ),
            ),
            margin: EdgeInsets.all(4.0),
          ),
          new Container(
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              child: new FlatButton(
                onPressed: () => _onAddItemPressed(15),
                child: Text("15", style: sButton),
                minWidth: 54,
                height: 48,
                color: Colors.grey[200],
              ),
            ),
            margin: EdgeInsets.all(4.0),
          ),
        ],
      );
    } else {
      return new Row(
        children: [
          new Container(
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              child: new FlatButton(
                onPressed: () => _onAddItemPressed(1),
                child: Text("+", style: sButton,),
                minWidth: 54,
                height: 48,
                color: Colors.grey[200],
              ),
            ),
            margin: EdgeInsets.only(left: 4.0),
          ),
          new Container(
            child: new Text(inCart.toString(), style: sButton,),
            padding: new EdgeInsets.symmetric(horizontal: 32.0),
            margin: EdgeInsets.only(left: 4.0),
          ),
          new Container(
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              child: new FlatButton(
                onPressed: () => _onAddItemPressed(-1),
                child: Text("-", style: sButton,),
                minWidth: 54,
                height: 48,
                color: Colors.grey[200],
              ),
            ),
            margin: EdgeInsets.only(left: 4.0),
          ),
        ],
      );
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.all(8.0),
      child: new Row(
        children: [
          new Container(
              width: 81,
              height: 81,
              padding: EdgeInsets.only(right: 15),
              //margin: EdgeInsets.only(right: 15),
              child: Image(image: AssetImage('res_fake/fakecontent.jpeg'))),
          new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 6.0,),
                child: new Text("2499 ₽", style: sAlt,),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 6.0,),
                child: new Text("Сатин «Эконом» Евро 2н", style: sHeading,),
              ),
              _buildButtons(),
            ],
          ),
        ],
      ),
    );
  }
  
}

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
            child: Image(image: AssetImage('res_fake/fakecontent.jpeg'))),
        new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            new Text("2499 ₽ | Полутороспальный (1.5)", style: sAlt,),
            new Row(
              children: [
                new Text("Сатин Люкс+", style: sHeading,),
                new Text("2 шт.", style: sHeadingCompact),
              ],
            )
          ],
        ),
      ],
    );
  }
}

class AddressItem extends StatefulWidget {
  @override
  createState() => new AddressItemState();
}
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
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
      child: new Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Column(
            children: [
              new AddressTextItem(),
              new Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      child: new FlatButton(onPressed: _onEditPressed, child: new Text("Изменить", style: sButton,), color: Colors.grey[200], height: 48,),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      child: new FlatButton(onPressed: _onDefaultPressed, child: new Text(btnName, style: sButton,), color: Colors.grey[200], height: 48,),
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

class AddressTextItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        new Text("Офис (Основной адрес)", style: sHeading,),
        new Text("Кантемировская ул., 47А, корп. 2, стр. 6,\nМосква, Россия\nПолучатель: Первышин Михаил Анатольевич \n+7 (904) 371-48-57"),
      ],
    );
  }
}
