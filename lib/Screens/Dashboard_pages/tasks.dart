import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:folding_cell/folding_cell.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'create_task.dart';
import 'Dashboard.dart';

class Tasks extends StatefulWidget {
  @override  _TasksState createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  TextEditingController editingController = TextEditingController();
  TabController controller;
  List<String> listItems = [];

  CollectionReference collectionReference = Firestore.instance.collection("TASKS");
  var items = List<String>();
  Color primaryColor = Color.fromRGBO(255, 200, 50, 1);

  /*void getTasks() async {
    await collectionReference
        .orderBy("StartDate")
        .getDocuments()
        .then((value) {
      value.documents.forEach((element) {
        listItems.add(element.data.toString());
        print("hello: "+element.data.toString());
      });
    });
    print("hello: ");
    print(listItems.toString());

  }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: primaryColor,
        title: Text('Tasks',textAlign: TextAlign.center,style: TextStyle(fontFamily: 'FanwoodText',fontSize: 30,),),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.black,),
        ),
        actions: <Widget>[
          IconButton(
            alignment: Alignment(100, 4),
            icon: Image.asset('assets/logo.png'),
            onPressed: (){},

          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              header(),
              Column(
                children: <Widget>[
                  SizedBox(height: 10.0),
                  Padding(
                    padding: EdgeInsets.only(left: 12.0, right: 12.0),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(30.0),
                      child: TextField(
                          decoration:
                          InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.search, color: primaryColor, size: 25.0),
                              contentPadding:
                              EdgeInsets.only(left: 10.0, top: 12.0),
                              hintText: 'Search',
                              hintStyle: TextStyle(color: Colors.grey,fontFamily: 'FanwoodText',)
                          ),

                          onChanged: (value) {
                            filterSearchResults(value);
                            controller:editingController;
                          }
                      ),
                    ),
                  ),
                ],

              ),
            ],
          ),
          new Expanded(
          child: StreamBuilder (
            stream: Firestore.instance.collection("TASKS").snapshots(),
            builder: (context, snapshot) {
                if(!snapshot.hasData) return const Text("Loading...");
                return ListView.builder (
                itemCount: snapshot.data.documents.length,
                itemBuilder: (BuildContext context, int Index) => _buildCell(context, snapshot.data.documents[Index]),
                );
            }),
          )
        ],
      ),
      floatingActionButton:FloatingActionButton(
        child:Icon(Icons.add) ,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Taskcreate()));
        },),

    );
  }

  void filterSearchResults(String query) {
    List dummySearchList = List<String>();
    dummySearchList.addAll(listItems);
    if (query.isNotEmpty) {
      List<String> dummyListData = List<String>();
      dummySearchList.forEach((item) {
        if (item.contains(query)) {
          dummyListData.add(item);        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });      return;    }
    else {
      setState(() {
        items.clear();
        items.addAll(listItems);
      });
    }
  }
  Widget header(){
    return new Container(
        height: 100.0,
        width: MediaQuery.of(context).size.width,
        color: primaryColor,
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

           // Text('Tasks',style: TextStyle( color: Colors.white,fontSize: 25.0,fontWeight: FontWeight.bold),),
            SizedBox(height: 60.0),

          ],
        )
    );
  }

  Widget _buildCell(BuildContext context, DocumentSnapshot documentSnapshot) {
    return ListTile(
      title: Padding(
      padding: EdgeInsets.only(left: 12.0,top: 5.0, right: 12.0),
      child: Material(
        color: primaryColor,
        elevation: 5.0,
        borderRadius: BorderRadius.circular(10.0),
        child: SimpleFoldingCell(
          frontWidget:
          Container(
            color: primaryColor,
            alignment: Alignment.center,
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(5.0),
                  width: MediaQuery.of(context).size.width / 8,
                  height: MediaQuery.of(context).size.width / 8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35.0),
                      border: Border.all(color: Colors.white,style: BorderStyle.solid, width: 2.0),
                      image: DecorationImage(image: AssetImage('assets/logo.png')
                      )
                  ),
                ),
                Expanded(
                  child: Container(
                  padding: EdgeInsets.only(left: 20.0, top: 3.0),
                  width: MediaQuery.of(context).size.width / 1.5,
                  height: 180,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                      Text(documentSnapshot['Title'],style: TextStyle( fontFamily: 'FanwoodText',fontSize: 16.0,color: Colors.white,fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      Text('Type: '+documentSnapshot['Type'],textAlign: TextAlign.left,style: TextStyle(fontSize: 14.0,color: Colors.white,fontWeight: FontWeight.bold,fontFamily: 'FanwoodText'),),

                      Row(
                          children: <Widget>[
                            Text('Start Time: '+documentSnapshot['StartDate'],
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14.0,color: Colors.white,fontWeight: FontWeight.bold,fontFamily: 'FanwoodText'),
                            ),
                          ]),
                     /* Row(
                        children: <Widget>[
                          Text('End Time:'+documentSnapshot['EndDate'],
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 14.0,color: Colors.white,fontWeight: FontWeight.bold,fontFamily: 'FanwoodText'),
                          ),
                        ],
                      ),*/
                      Row(
                          children: <Widget>[
                            Column(
                                children: <Widget>[
                                  Text('Location:',textAlign: TextAlign.left,style: TextStyle(fontSize: 15.0,fontFamily: 'FanwoodText',color: Colors.white,fontWeight: FontWeight.bold),),
                                ] ),
                            SizedBox(width: 20,),
                            Column(
                                children: <Widget>[
                                  Text('Reward: ' + documentSnapshot['Reward'],textAlign: TextAlign.center,style: TextStyle(fontSize: 15.0,fontFamily: 'FanwoodText',color: Colors.white,fontWeight: FontWeight.bold),),
                                ] ),
                          ]),
                    ],
                  ),
                ),
                ),
              ],
            ),
          ),
          innerTopWidget:
          Container(
            color: Colors.amberAccent,
            alignment: Alignment.center,
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(5.0),
                  width: MediaQuery.of(context).size.width / 6,
                  height: MediaQuery.of(context).size.width / 6,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(35.0), border: Border.all(color: Colors.white,style: BorderStyle.solid,width: 2.0),
                      image: DecorationImage(image: AssetImage('assets/logo.png')
                      )
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20.0, top: 5.0),
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(documentSnapshot['Title'],style: TextStyle(fontSize: 16.0,color: Colors.white,fontWeight: FontWeight.bold),),
                      Text('Time here',textAlign: TextAlign.left,style: TextStyle(fontFamily: 'FanwoodText',fontSize: 12.0,color: Colors.white,fontWeight: FontWeight.bold),                      ),
                      Text('Description here'+documentSnapshot['Desc'],textAlign: TextAlign.left,style: TextStyle(fontFamily: 'FanwoodText',fontSize: 12.0,color: Colors.white,fontWeight: FontWeight.bold),                      ),
                      Text('Type here'+documentSnapshot['Type'],textAlign: TextAlign.left,style: TextStyle(fontFamily: 'FanwoodText',fontSize: 12.0,color: Colors.white,fontWeight: FontWeight.bold),),
                      Text('loc here',textAlign: TextAlign.left,style: TextStyle(fontFamily: 'FanwoodText',fontSize: 20.0,color: Colors.white,fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
              ],
            ),
          ),
          innerBottomWidget:
          Container(
            color: Color(0xFFDBACDB),
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 0),
              child:
              FlatButton(onPressed: () {
                final snackBar = SnackBar(content: Text('Item clicked', ),duration: Duration(milliseconds: 500),);
                Scaffold.of(context).showSnackBar(snackBar);              },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    Text(documentSnapshot['Title'],textAlign: TextAlign.left,style: TextStyle(fontSize: 12.0,color: Colors.white,fontWeight: FontWeight.bold),),

                  ],
                ),
                textColor: Colors.black,
                padding: EdgeInsets.all(5.0),
                splashColor: Colors.white.withOpacity(0.5),
              ),            ),          ),
          cellSize: Size(MediaQuery.of(context).size.width, 90),
          padding: EdgeInsets.all(5),
        ),
      ),
    )
    );
  }
}



