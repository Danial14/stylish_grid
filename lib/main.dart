import 'package:flutter/material.dart';
import 'package:stylish_grid/pdf_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Demo"),
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            crossAxisSpacing: 15,
          ),
          itemBuilder: (ctx, position){
            return _GridItem();
          },
          itemCount: 4,
        ),
      ),
    );
  }
}
class _GridItem extends StatefulWidget{
  @override
  State<_GridItem> createState() {
    // TODO: implement createState
    return _GridItemState();
  }
}
class _GridItemState extends State<_GridItem>{
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints){
        return InkWell(
          onTap: (){
            print("IMage tap");
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx){
              return PdfScreen();
            }));
          },
          child: ClipRRect(
            child: GridTile(
                  child: Image.asset("assets/laptop.png",
                    fit: BoxFit.cover,),
                  footer: Container(
                    height: constraints.maxHeight * .2,
                    child: GridTileBar(backgroundColor: Colors.black,
                      title: Text("Laptop"),
                    ),
                  ),
                ),
            borderRadius: BorderRadius.circular(15),

          ),
        );
      },
    );
  }
}