import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert' ;
import 'model/product.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

 @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Json Serialization'),
      ),
      body: FutureBuilder<ProductResponse>(
        future: getProduct(),
        builder: (context, snapshot){

          if(snapshot.connectionState == ConnectionState.done){
            return Container(
              child: ListView.builder(
                itemCount: snapshot.data.products.length,
                itemBuilder: (context, position){
                  return Ink(
                    color: Colors.white,
                    child: new Column(
                      children: <Widget>[
                        Divider(height: 5.0,),
                        ListTile(
                          title: Text('${snapshot.data.products[position].name}'),
                          subtitle: Text('${snapshot.data.products[position].price}'),

                        )

                      ],
                    ),

                  );

                },

              ),
            );
          }else {
            return Text('loading....');
            // load progress indicator
          }

        },
      )
    );
  }
}

Future<ProductResponse> getProduct() async {
  String apiUrl = 'http://142.93.241.14:3000/api/product?category=earrings';
  http.Response response = await http.get(apiUrl);
  final jsondata = json.decode(response.body);
  return ProductResponse.fromJson(jsondata);
}


