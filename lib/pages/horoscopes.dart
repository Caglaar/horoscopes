import 'package:flutter/material.dart';
import '../sourcs/strings.dart';
import 'package:horoscope/routes/route_genaratur.dart';
import 'package:palette_generator/palette_generator.dart';

class MyHoroscopesPage extends StatefulWidget {
  const MyHoroscopesPage({super.key});

  @override
  State<MyHoroscopesPage> createState() => _MyHoroscopesPageState();
}

class _MyHoroscopesPageState extends State<MyHoroscopesPage> {
  Color appbarColor = Colors.pink;
  final List<String> imagesURL =[
    'images/background/1.png',
    'images/background/2.png',
    'images/background/3.png',
    'images/background/4.png',
    'images/background/5.png',
    'images/background/6.png',
    'images/background/7.png',
    'images/background/8.png',
    'images/background/9.png',
    'images/background/10.png',
    'images/background/11.png',
    'images/background/12.png',
  ];
  late List<Color> colorsBackground = List<Color>.filled(12, Colors.transparent);

  @override
  void initState() {
    super.initState();
    _updateBackgroundColors();
  }
  @override
  
  
  
  @override
  Widget build(BuildContext context) {
    int? index;
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args is int) {
      index = args; 
    }
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: _backgrounColorsFunc(index),
              title: printTitle(index),
              centerTitle: true,
              leading: IconButton(
                icon: Icon(Icons.arrow_back,size: 50,color: Colors.white,), // Geri dönüş tuşunun ikonu
                onPressed: () {
                  Navigator.of(context).pop(); // Geri dönüş tuşuna tıklanınca sayfayı geri git
                },
              ),
              expandedHeight: 300,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset("images/background/${index}.png",fit: BoxFit.cover,),  
                ),
            ),
            SliverList(delegate: SliverChildListDelegate(Body(index))),

          ],
        ),
        ),
    );
  }

  
  
  List<Widget> Body(int? index) 
  {
    if(index != null)
    {
      return [
        Container(
          padding: EdgeInsets.all(20),
          child: Text("${Strings.BURC_GENEL_OZELLIKLERI[index - 1]}",style: TextStyle(fontSize: 25),),
        )
      ];
    }
    else
    {
      return [
        Container(child: Text("404 ERROR",style: TextStyle(fontSize: 300),),),
      ];
    }
    
  }
  
  printTitle(int? index) {
    if(index != null)
    {
      return Text("${Strings.BURC_ADLARI[index - 1]} traits ",style: TextStyle(fontSize: 25),);
    }
    else
    {
      return Text("",style: TextStyle(fontSize: 25),);
    }
  }
  
  void _updateBackgroundColors() async{
    for (var i = 0; i < 12; i++) {
      final PaletteGenerator generator = await PaletteGenerator.fromImageProvider(AssetImage(imagesURL[i]));
      colorsBackground[i] = generator.vibrantColor!.color;
      setState(() {
        
      });
    }
    
  }
  
  Color _backgrounColorsFunc(int? index) {
    if(index != null)
    {
      
      return colorsBackground[index-1];
    }
    else
      return Colors.pink;
  }
}