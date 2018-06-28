import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
/*
  int current_step=1;
  List<Step> my_steps=[
        new Step(title: new Text("Step 1"),
          content: new Text("Content step 1"),
          isActive: false
        ),
        new Step(title: new Text("Step 2"),
            content: new Text("Content step 2"),
            isActive: true
        )
  ];*/

  TabController tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController=new TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    tabController.dispose();
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(

        title: new Text(widget.title),
      ),
      body: new TabBarView(
        children: <Widget>[new NewPage("First"),new NewPage("Second"),],
        controller: tabController,
        /*child: new Stepper(
            steps:my_steps,
            currentStep: this.current_step,
            type: StepperType.vertical,
        ),*/

      ),
      bottomNavigationBar: new Material(
        color: Colors.redAccent ,
        child: new TabBar(
            controller:tabController,
            tabs: <Widget>[
          new Tab(
            icon: new Icon(Icons.favorite,color: Colors.blue,),
          ),
          new Tab(
            icon: new Icon(Icons.email,color: Colors.blue,),

          )
        ]),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class NewPage extends StatelessWidget {
  final String title;
  NewPage(this.title);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body:new Center(
        child: new Text(title),
      ),
    );
  }
}

 class MyBody extends StatelessWidget {
   AlertDialog alertDialog=new AlertDialog(
     content:new Text("Dialog is up",style: new TextStyle(fontSize:30.0 ),),
     title: new Text("Hello"),
   );
   @override
   Widget build(BuildContext context) {
     return new Container(
       child: new Center(
         child: new RaisedButton(
             child: new Text("Click me", style:
             new TextStyle(color: Colors.white),),
             color: Colors.redAccent,
             /*onPressed: ()=>Scaffold.of(context).showSnackBar(
                 new SnackBar(content: new Text("You clicked me"),
                   duration: new Duration(seconds: 3),
                 )
             )*/
             onPressed: ()=>showDialog(context: context,child: alertDialog),
         ),
       ),
     );
   }
 }
