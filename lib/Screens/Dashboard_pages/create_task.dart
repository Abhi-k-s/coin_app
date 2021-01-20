import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coinapp/Screens/Dashboard_pages/home.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dashboard.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'maps.dart';
import 'package:coinapp/locator.dart';


class Taskcreate extends StatefulWidget {
  @override
  Taskcreate_State createState() => Taskcreate_State();
}

class Taskcreate_State extends State<Taskcreate> {

  bool checkBoxvalue3=false;
  bool checkBoxvalue4=false;
  Color primaryColor = Color.fromRGBO(255, 200, 50, 1);
  GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  //form fields
  bool physicalTask=true;
  bool virtualTask=false;
  String taskTitle;
  String taskDesc;
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  String taskReward;
  DateTime selectedDate = DateTime.now();

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget _buildStartDate(BuildContext context) {
    final DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm');
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(dateFormat.format(startDate)),
        RaisedButton(
          child: Text('Choose start date time',style: TextStyle(fontFamily: 'FanwoodText',),),
          onPressed: () async {
            final selectedDate = await _selectDateTime(context);
            if (selectedDate == null)
            return;
            print(selectedDate);

            final selectedTime = await _selectTime(context);
            if (selectedTime == null)
            return;
            print(selectedTime);
            setState(() {
              this.selectedDate = DateTime(
                selectedDate.year,
                selectedDate.month,
                selectedDate.day,
                selectedTime.hour,
                selectedTime.minute,
              );
              this.startDate= this.selectedDate;
            });
            print(this.startDate.toString());
          })
        ],
    );
  }

  Widget _buildEndDate(BuildContext context) {
    final DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm');
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(dateFormat.format(endDate)),
        RaisedButton(
            child: Text('Choose start date time',style: TextStyle(fontFamily: 'FanwoodText',),),
            onPressed: () async {
              final selectedDate = await _selectDateTime(context);
              if (selectedDate == null)
                return;
              print(selectedDate);

              final selectedTime = await _selectTime(context);
              if (selectedTime == null)
                return;
              print(selectedTime);
              setState(() {
                this.selectedDate = DateTime(
                  selectedDate.year,
                  selectedDate.month,
                  selectedDate.day,
                  selectedTime.hour,
                  selectedTime.minute,
                );
                this.endDate= this.selectedDate;
              });
              print(this.endDate.toString());

            })
      ],
    );
  }

  Future<TimeOfDay> _selectTime(BuildContext context) {
    final now = DateTime.now();

    return showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: now.hour, minute: now.minute),
    );
  }

  Future<DateTime> _selectDateTime(BuildContext context) => showDatePicker(
    context: context,
    initialDate: selectedDate.add(Duration(seconds: 1)),
    firstDate: DateTime.now(),
    lastDate: DateTime(selectedDate.year+2),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: primaryColor,
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


      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            Stack(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(top: 9.0, right: 15.0, left: 15.0),

                      child: Container(
                          width: double.infinity,
                          height: 200,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(20.0)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    offset: Offset(0.0, 3.0),
                                    blurRadius: 15.0)
                              ]),
                          child:
                          Column(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal:5.0,vertical: 10 ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[

                                      Text('Create Tasks',
                                          style: TextStyle(fontFamily: 'FanwoodText',
                                            color:Colors.blue,
                                            fontSize: 30,fontWeight: FontWeight.bold,)
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 30,),
                                Text('Task type',style: TextStyle(fontFamily: 'FanwoodText',),),
                                Padding(
                                  padding:EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Container(
                                              child:Checkbox(
                                                  value:physicalTask,
                                                  onChanged:(bool value)
                                                  {
                                                    setState(()
                                                    {
                                                      physicalTask=!physicalTask;
                                                      virtualTask=!virtualTask;
                                                    });
                                                  }
                                              )
                                          ),
                                          Text('Physical Task',style: TextStyle(fontFamily: 'FanwoodText',),),
                                          Container(
                                              child:Checkbox(
                                                  value:virtualTask,
                                                  onChanged:(bool value)
                                                  {
                                                    setState(()
                                                    {
                                                      virtualTask=!virtualTask;
                                                      physicalTask=!physicalTask;
                                                    });
                                                  }
                                              )
                                          ),
                                          Text('Virtual Task',style: TextStyle(fontFamily: 'FanwoodText',),)
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ])))]),
            Row(

              children: <Widget>[
                Container(
                    margin:EdgeInsets.all(20.0),
                    height:50,
                    width:300,
                    child:TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Enter Task Title',hintStyle:TextStyle(fontFamily: 'FanwoodText',),
                      ),
                      onChanged: (String value) {
                        setState(() {
                          taskTitle = value;
                        });
                      },
                    )
                ),
              ],
            ),

            Row(

              children: <Widget>[
                Container(
                    margin:EdgeInsets.all(20.0),
                    height:50,
                    width:300,
                    child:TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          hintText: 'Enter task description',hintStyle:TextStyle(fontFamily: 'FanwoodText',),
                      ),
                      onChanged: (String value) {
                        setState(() {
                          taskDesc = value;
                        });
                      },
                    )
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildStartDate(context),
                _buildEndDate(context),
              ],
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width:250,
                    height:50,
                    margin:EdgeInsets.all(10),
                    child:TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: 'Enter Task Rewards in Rupees',
                        hintStyle: TextStyle(fontFamily: 'FanwoodText',),
                      ),
                      onChanged: (String value) {
                        setState(() {
                          taskReward = value;
                        });
                      },
                    ),
                  ),
                ]
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Container(

                  padding:EdgeInsets.all(10.0),
                  child:
                      IconButton(
                        padding: EdgeInsets.all(20.0),
                        color:Colors.lightBlue,
                        icon: Icon(Icons.map),
                        iconSize: 30,
                        onPressed:(){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> MapPage()));
                        },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Container(
                  padding:EdgeInsets.all(10.0),
                  child:RaisedButton(
                    padding: EdgeInsets.all(20.0),
                    color:Colors.lightBlue,
                    child: Text('Create Task',style: TextStyle(fontFamily: 'FanwoodText',),),
                    onPressed:(){
                     Firestore.instance
                          .collection("TASKS")
                          .add({
                             "Type":  (physicalTask?"Physical":"Virtual"),
                             "Title": taskTitle,
                             "Desc": taskDesc,
                             "Reward": taskReward,
                             "StartDate": startDate.toString(),
                             "EndDate": endDate.toString()
                      });
                    //  print("Type: "+ (physicalTask?"Physical":"Virtual"));
                    //  print("Title: "+taskTitle);
                    //  print("Desc: "+taskDesc);
                    //  print("Reward: "+taskReward);
                    //  print("StartDate: "+startDate.toString());
                    //  print("EndDate: "+endDate.toString());
                      Navigator.pushNamed(context, Home.route);

                    },
                  ),
                ),
              ],
            ),
            /*Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('Task Status',style: TextStyle(fontFamily: 'FanwoodText',),),
                Container(
                    child:Checkbox(
                        value:checkBoxvalue3,
                        onChanged:(bool value)
                        {
                          setState(()
                          {
                            checkBoxvalue3=value;
                          });
                        }
                    )
                ),
                Text('Active',style: TextStyle(fontFamily: 'FanwoodText',),),
                Container(
                    child:Checkbox(
                        value:checkBoxvalue4,
                        onChanged:(bool value)
                        {
                          setState(()
                          {
                            checkBoxvalue4=value;
                          });
                        }
                   )
                ),
                Text('Completed',style: TextStyle(fontFamily: 'FanwoodText',),
                ),
              ],
            )*/
          ],

        ),
      ),
    );
  }
}

class DateTimePickerWidget extends StatefulWidget {
  @override
  _DateTimePickerWidgetState createState() => _DateTimePickerWidgetState();
}

class _DateTimePickerWidgetState extends State<DateTimePickerWidget> {
  DateTime selectedDate = DateTime.now();

  final DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm');

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(dateFormat.format(selectedDate)),
        RaisedButton(
          child: Text('Choose start date time',style: TextStyle(fontFamily: 'FanwoodText',),),
          onPressed: () async {
            final selectedDate = await _selectDateTime(context);
            if (selectedDate == null)
              return;
            print(selectedDate);

            final selectedTime = await _selectTime(context);
            if (selectedTime == null)
              return;
            print(selectedTime);

            setState(() {
              this.selectedDate = DateTime(
                selectedDate.year,
                selectedDate.month,
                selectedDate.day,
                selectedTime.hour,
                selectedTime.minute,
              );
            });
            print( new _DateTimePickerWidgetState1().selectedDate);
          },
        ),
      ],
    );
  }

  Future<TimeOfDay> _selectTime(BuildContext context) {
    final now = DateTime.now();

    return showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: now.hour, minute: now.minute),
    );
  }

  Future<DateTime> _selectDateTime(BuildContext context) => showDatePicker(
    context: context,
    initialDate: DateTime.now().add(Duration(seconds: 1)),
    firstDate: DateTime.now(),
    lastDate: DateTime(2100),
  );
}

class DateTimePickerWidget1 extends StatefulWidget {
  @override
  _DateTimePickerWidgetState1 createState() => _DateTimePickerWidgetState1();
}

class _DateTimePickerWidgetState1 extends State<DateTimePickerWidget1> {
  DateTime selectedDate = DateTime.now();

  final DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm');

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(dateFormat.format(selectedDate)),
        RaisedButton(
          child: Text('Choose end date time',style: TextStyle(fontFamily: 'FanwoodText',),),
          onPressed: () async {
            final selectedDate = await _selectDateTime(context);
            if (selectedDate == null)
              return;
            print(selectedDate);
            final selectedTime = await _selectTime(context);
            if (selectedTime == null) return;
            print(selectedTime);

            setState(() {
              this.selectedDate = DateTime(
                selectedDate.year,
                selectedDate.month,
                selectedDate.day,
                selectedTime.hour,
                selectedTime.minute,
              );
            });
          },
        ),
      ],
    );
  }

  Future<TimeOfDay> _selectTime(BuildContext context) {
    final now = DateTime.now();

    return showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: now.hour, minute: now.minute),
    );
  }

  Future<DateTime> _selectDateTime(BuildContext context) => showDatePicker(
    context: context,
    initialDate: DateTime.now().add(Duration(seconds: 1)),
    firstDate: DateTime.now(),
    lastDate: DateTime(DateTime.now().year+2),
  );
}

