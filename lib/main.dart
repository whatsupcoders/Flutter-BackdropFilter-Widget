import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: new Color(0xff052b49),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(FontAwesomeIcons.arrowLeft), onPressed: () {
          //
        }),
        title: Text("Mount Everest"),
        actions: <Widget>[
          IconButton(icon: Icon(
              FontAwesomeIcons.search), onPressed: () {
            //
          }),
        ],
      ),
      body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            ConstrainedBox(
              constraints: const BoxConstraints.expand(),
              child: Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,

                decoration: new BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: new NetworkImage(
                          "https://images.unsplash.com/photo-1515266591878-f93e32bc5937?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                    )
                ),),
            ), //ConstrainedBox
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: infoCard(context, "Mount Everest"),
                ),
              ],),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: frostedIconButton(
                          IconButton(
                              icon: Icon(FontAwesomeIcons.solidHeart,
                                color: Colors.white,),
                              onPressed: () {}),

                        ),
                      ),
                    ),

                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: frostedIconButton(
                          IconButton(
                              icon: Icon(FontAwesomeIcons.share,
                                color: Colors.white,),
                              onPressed: () {}),

                        ),
                      ),
                    ),

                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: frostedIconButton(
                          IconButton(
                              icon: Icon(FontAwesomeIcons.bookmark,
                                color: Colors.white,),
                              onPressed: () {}),

                        ),
                      ),
                    ),

                  ],
                ),
              ],
            ),


          ]
      ), //Stack
    );
  }

  Widget frostedIconButton(Widget child) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(50.0),
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    shape: BoxShape.circle),
                child: child)));
  }


  Widget frostedEdged(Widget child) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: child));
  }

  Widget infoCard(BuildContext context, String title) {
    return frostedEdged(Container(
        key: ValueKey<String>(title),
        height: MediaQuery
            .of(context)
            .size
            .height / 4,
        width: MediaQuery
            .of(context)
            .size
            .width / 1.2,
        color: Colors.white.withOpacity(0.3),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  "Mount Everest",
                  style: TextStyle(fontSize: 18.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),),

              Text(
                "Mount Everest, known in Nepali as Sagarmatha and in Tibetan as Chomolungma, is Earth's highest mountain above sea level. ",
                style: TextStyle(fontSize: 18.0,color: Colors.white),
              ),

            ],
          ),
        )));
  }

}