import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
        ],
        backgroundColor: Colors.cyan,
        title: new Text('Book Store'),
        centerTitle: true,
      ),
      body: Booklist(),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Username'),
              accountEmail: Text('Email'),
              decoration: BoxDecoration(
                color: Colors.cyan,
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white30,
                child: new Text(''),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person , size: 30,),
              title: Text('Profile', style: TextStyle(fontWeight: FontWeight.bold , fontSize: 18,),),
              onTap: () {Navigator.of(context).pushReplacementNamed('/Profile');},
            ),
          ],
        ),
      ),
    );
  }
}

class Booklist extends StatefulWidget {
  @override
  _BooklistState createState() => _BooklistState();
}

class _BooklistState extends State<Booklist> {
  Future<List<Book>> _getBook() async {
    var data = await http.get("http://api.myjson.com/bins/jb58f");
    var jsonData = json.decode(data.body);

    List<Book> Books = [];
    for (var B in jsonData) {
      Book book = Book(B["bookname"], B["bookurl"]);
      Books.add(book);
    }
    print(Books.length);

    return Books;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getBook(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return WebviewScaffold(url: snapshot.data[index].linkBook);
                }));
              },
              child: Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: ListTile(
                  title: Text(snapshot.data[index].nameBook , style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold ),),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class Book {
  String nameBook;
  String linkBook;

  Book(this.nameBook, this.linkBook);
}
