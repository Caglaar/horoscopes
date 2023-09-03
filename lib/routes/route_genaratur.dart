
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:horoscope/pages/horoscopes.dart';

class RouteGenaratur {
  static Route<dynamic>? _routeCreate(RouteSettings settings,Widget route)
  {
    if(defaultTargetPlatform == TargetPlatform.iOS)
      return CupertinoPageRoute(builder: (context)=>route,settings: settings);
    else if(defaultTargetPlatform == TargetPlatform.android)
      return MaterialPageRoute(builder: (context)=>route,settings: settings);
    else
      return CupertinoPageRoute(builder: (context)=>route, settings: settings);
  }

  static Route<dynamic>? routerGen(RouteSettings settings)
  {
    switch(settings.name)
    {
      case '/horoscopesPage': return _routeCreate(settings, MyHoroscopesPage());
      default : return MaterialPageRoute(builder: (context)=>Scaffold(
        appBar: AppBar(title: Text("ERROR 404"),),
        body: Center(child: Text("ERROR 404",style: TextStyle(color: Colors.black,fontSize: 40),)),));
    }
  }
}