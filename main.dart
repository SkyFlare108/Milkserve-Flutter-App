import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:milkserve2021ia/home.dart';
import 'package:url_launcher/url_launcher.dart';

const _url = "https://www.google.com/";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final appTitle = 'MILKSERVE';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}
class MyHomePage extends StatelessWidget {
  final String title;
  MyHomePage({key, this.title}) : super(key: key);


  openUrl() async{
    if(await canLaunch(_url)){
      await launch(_url);
    }else{
      throw 'Could not Launch URL';
    }
    // await canLaunch(_url) ? await launch(_url) :       throw 'Could not Launch $_url';
  }

  //Summary:
  //Opening Screen with Milk bottle Gif. The "GO" Raised Button leads the User into the main Dashboard page which is home.dart





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(210, 170, 204, 1),
      appBar: AppBar(
        centerTitle: true,
        title: Text('MilkServe',
            style: TextStyle(
              fontSize: 30.0,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w500,
            )
        ),
        backgroundColor: Colors.green,
      ),
      drawer: Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
                'MENU',
                style: TextStyle(
                  fontSize: 40.0,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                )
            ),
            decoration: BoxDecoration(
              color: Color.fromRGBO(300, 170, 204, 1),
            ),
          ),
          ListTile(
            title: Text('REVIEW'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Q&A'),
            onTap: () {
              openUrl();
            },
          ),
        ],
        ),
      ),
  body:
      Center(
        child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
            Center(
            child:
            Text("#Organized Service", style: TextStyle(
              fontSize: 20.0,
              fontStyle: FontStyle.italic,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w500,
            ))),
          Expanded(child: Container(child: Image.network('https://cdn.dribbble.com/users/948184/screenshots/4419323/88_milk_pouring_db.gif',),)),
          RaisedButton(
            color: Colors.white,
            child: new Text(
              "GO",
              style: new TextStyle(fontSize: 20.0, color: Colors.black),
            ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                    );
                  },
                ),
        ],
      ),
    )
    );
  }
}