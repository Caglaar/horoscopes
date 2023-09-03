
import 'package:flutter/material.dart';
import './sourcs/strings.dart';
import './pages/horoscopes.dart';
import 'package:horoscope/routes/route_genaratur.dart';
void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.pink),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Horoscope App"),
        ),
        body: ListView.builder(
          itemCount: 12,
          itemBuilder: (BuildContext context, int index) {
            return createCard(index, context);
          }),
        ),
      onGenerateRoute: RouteGenaratur.routerGen,
    );
  }
  
  Widget createCard(int index,BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/horoscopesPage',arguments: index + 1);
      },
      child: Container(
        height: 120,
        child: Card(
          color: Colors.pink[100],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
          child: Center(
            child: ListTile(
              focusColor: Colors.pink[100],
              title: Text("${Strings.BURC_ADLARI[index]}",style: TextStyle(fontSize: 30),),
              subtitle: Text("${Strings.BURC_TARIHLERI[index]}",style: TextStyle(fontSize: 20),),
              leading: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("images/logo/${index + 1}.png"),
              ),
            ),
          )
        ),
      ),
      
    );
  }
}