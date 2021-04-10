import 'package:flutter/material.dart';
import '../resources/resource.dart';

import '../model/model.dart';
import '../controller/userController.dart';
import 'package:flutter_switch/flutter_switch.dart';
import '../my_flutter_app_icons.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../widget/background.dart';
import '../widget/drawer.dart';
import '../widget/empty.dart';
class tomorrowTask extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return tomorrowTaskstate();

  }
}
class tomorrowTaskstate extends State<tomorrowTask>{
  double heightcontainer;
  userTask db=userTask();
  List<Todolist> t;
  void initState() {
    // TODO: implement initState
    super.initState();
    db.showallTommorrowtask().then((value) {
      setState(() {
        t=value;
      });
    });
    db.showUserinfo().then((value) {setState(() {
      name=value;

    });
    });
  }
  double sc=4;
  TextEditingController TXT =TextEditingController();
 bool status =false;
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    heightcontainer=size.height*.06;
    final now=DateTime.now();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        leading: Builder(
          builder: (context) =>Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/ic-7.png',),
                    fit: BoxFit.fill
                )
            ),
            child:GestureDetector(

              onTap: () => Scaffold.of(context).openDrawer(),
            ),),),
        elevation: 0.0,
        backgroundColor: Colors.transparent,) ,
      extendBodyBehindAppBar: true,
        drawer: Draweruser(context,name),
      body:Container(
        child: Column(
          children: [
            back(context,'Tomorrow',1),
            Expanded(child:Container(
              //  color: Colors.red,
             // height: size.height*.50,
              child:  Stack(children: [

                ((t==null)?Center(child:   Theme(data: Theme.of(context).copyWith(accentColor:purple),
                  child:CircularProgressIndicator() ,))
                    : (((!db.tstatus)||((t.length)==0))? emptypic(context)
                    :ListView.builder(
                    itemCount: t.length,
                    itemBuilder: (BuildContext context, int position){
                      return Slidable(
                        child:GestureDetector(
                          child: Container(
                             height: size.height*.09,
                           // color: Colors.purpleAccent,
                            child: Column(
                              children: [
                                Container(
                                  //color:Colors.deepPurpleAccent,
                                 margin:EdgeInsets.only(top: size.height*.046),
                                  child: Row(children: [
                                    Container(

                                      margin:EdgeInsets.only(left: size.width*.06),


                                      child: Container(
                                        height:   size.width*.051,
                                        width: size.width*.051,
                                        decoration: BoxDecoration(
                                          image:DecorationImage(
                                              image: AssetImage('assets/images/ic-9.png')
                                          ),
                                        ),
                                      ),

                                    ),
                                    Expanded(child: Container(
                                      margin:EdgeInsets.only(left: size.width*.023),
                                      child:Text('${t[position].content}',style: TextStyle(fontSize: 19,color: listpurple,


                                      ),) ,))],),),
                                Container(
                                  //color: Colors.deepPurple,
                                    margin: EdgeInsets.only(top: size.height*.009),
                                    child:Align( alignment: Alignment.bottomCenter,

                                        child: Divider(indent: size.width*.07,endIndent: size.width*.07 ,
                                          color: dividercolor,thickness: 1,height: 1,))
                                )
                              ],
                            ),),
                          onTap: (){
                            setState(() {
                              transfer(size,t[position].content,t[position].id,position);


                            });
                          },
                        ),
                        actionPane: SlidableDrawerActionPane(),

                        secondaryActions: [
                          //IconButton(icon: null, onPressed: null),

                          IconSlideAction(
                            foregroundColor:grey,
                            color:lightgray,
                            icon: MyFlutterApp.ic_20,
                            //foregroundColor:Colors.black,
                            onTap: ()async{

                              await db.deleteTask(t[position].id);
                              setState(() {

                                t.removeAt(position);

                              });


                            },
                          )

                        ],);
                    }))),

                ////floatingbutton
                Container(


                  //alignment: Alignment.bottomRight,
                  margin: EdgeInsets.only(right:size.width*.08,top: size.height*.42,left: size.width*.79),
                  child: FloatingActionButton(  child: new Icon(Icons.add,),
                      backgroundColor: fgreen,
                      onPressed: (){
                        setState(() {
                          _showdialog( TXT, size);

                        });
                      }
                  ),)
              ],),),) ,
    ])));
  }
  _showdialog(TextEditingController txt,var size){
    showDialog(context:context,builder: (BuildContext context,) {
      return new AlertDialog(content: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return new Container(
                width: size.width * .83,
                height: size.height * .42,
                //color: Colors.white70,

                child: Center(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: size.height * .05),

                        width: size.width * .66,
                        child: TextField(
                            style: TextStyle(color: Colors.black),
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: bpurple),),
                                fillColor: bpurple,
                                hintText: 'tap something',
                                hintStyle: TextStyle(color: bpurple)),
                            controller: TXT),),
                      Container(
                          margin: EdgeInsets.only(top: size.height * .05),
                          // color: Colors.blue,
                          alignment: Alignment.center,
                          child: Center(child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            //Center Column contents vertically,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                              //today
                              Text('Today', style: TextStyle(color: chint),),
                              ////switch
                              Container(
                                margin: EdgeInsets.only(right: 10, left: 10),
                                child: FlutterSwitch(
                                  activeColor: bpurple,
                                  inactiveColor: purple,
                                  width: 39.0,
                                  height: 19.0,
                                  valueFontSize: 25.0,
                                  toggleSize: 15.0,
                                  value: status,
                                  borderRadius: 30.0,
                                  padding: 2.0,
                                  showOnOff: false,
                                  onToggle: (val) {
                                    setState(() {
                                      status = val;
                                    });
                                  },
                                ),),
                              //ttomorrow
                              Text('Tomorrow', style: TextStyle(color: chint),),

                            ],),)),
                      Container(
                        margin: EdgeInsets.only(top: size.height * .15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              //color:Colors.red,
                              width: size.width * .29,
                              height: size.height * .05,
                              // margin: EdgeInsets.only(right: size.width * .04),
                              child: RaisedButton(
                                  child: Text('Confirm',style: TextStyle(color: Colors.white),),
                                  color: bpurple,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),

                                  ),
                                  onPressed: () async{

                                    if(status){

                                      Todolist r=await db.createTomorrowtask(txt.text);
                                      //print(t);

                                      setState((){
                                        print('ggghhhhhhhhh');
                                        t.add(r);
                                        print(t[0]);
                                        txt.clear();
                                      });

                                    }
                                    else{
                                      await db.createTotask(txt.text);

                                    }

                                    Navigator.pop(context);}
                              ),),
                            Container(
                              //color:Colors.black,
                                width:10,height: 10,
                                margin: EdgeInsets.only(left:2,right: 0,),
                                child:Text('')
                            ),
                            Container(
                              // margin: EdgeInsets.only(right: size.width * .06),
                                width: size.width * .29,
                                height: size.height * .05,
                                child: RaisedButton(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(

                                    borderRadius: BorderRadius.circular(12.0),
                                    side: BorderSide(color: bpurple),
                                  ),
                                  onPressed: () => Navigator.pop(context),
                                  child: Text('Cancel',style: TextStyle(color: bpurple),),
                                )
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ));
          }));
    });}
   transfer(var size,String t,int d,int p){
    showDialog(context:context,builder: (BuildContext context,) {
      return new AlertDialog(content: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return new Container(
                width: size.width * .83,
                height: size.height * .42,
                //color: Colors.white70,

                child: Center(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: size.height * .05),

                        width: size.width * .66,
                        child: Text('$t',
                          style: TextStyle(color:bpurple,fontSize: 17),
                          textAlign: TextAlign.center,
                        ),),
                      Divider(endIndent: size.width*.08,indent: size.width*.08,color: bpurple,),
                      Container(
                          margin: EdgeInsets.only(top: size.height * .05),
                          // color: Colors.blue,
                          alignment: Alignment.center,
                          child: Center(child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            //Center Column contents vertically,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                              //today
                              Text('Today', style: TextStyle(color: chint),),
                              ////switch
                              Container(
                                margin: EdgeInsets.only(right: 10, left: 10),
                                child: FlutterSwitch(
                                  activeColor: bpurple,
                                  inactiveColor: purple,
                                  width: 39.0,
                                  height: 19.0,
                                  valueFontSize: 25.0,
                                  toggleSize: 15.0,
                                  value: status,
                                  borderRadius: 30.0,
                                  padding: 2.0,
                                  showOnOff: false,
                                  onToggle: (val) {
                                    setState(() {
                                      status = val;
                                    });
                                  },
                                ),),
                              //ttomorrow
                              Text('Tomorrow', style: TextStyle(color: chint),),

                            ],),)),
                      Container(
                        margin: EdgeInsets.only(top: size.height * .15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              //color:Colors.red,
                              width: size.width * .29,
                              height: size.height * .05,
                              // margin: EdgeInsets.only(right: size.width * .04),
                              child: RaisedButton(
                                  child: Text('Confirm',style: TextStyle(color: Colors.white),),
                                  color: bpurple,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),

                                  ),
                                  onPressed: () async{
                                    if (!status){
                                      bool r= await db.transfrmtask(d);
                                      print(p);

                                      setState((){
                                        if (r){
                                          //l.removeAt(0);
                                          print(t);
                                          //l.removeAt(p);
                                          Navigator.of(context).pushNamed('/home');}else{
                                          Navigator.pop(context);
                                        }
                                      });


                                    }else{

                                      Navigator.pop(context);}}
                              ),),
                            Container(
                              //color:Colors.black,
                                width:10,height: 10,
                                margin: EdgeInsets.only(left:2,right: 0,),
                                child:Text('')
                            ),
                            Container(
                              // margin: EdgeInsets.only(right: size.width * .06),
                                width: size.width * .29,
                                height: size.height * .05,
                                child: RaisedButton(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(

                                    borderRadius: BorderRadius.circular(12.0),
                                    side: BorderSide(color: bpurple),
                                  ),
                                  onPressed: () => Navigator.pop(context),
                                  child: Text('Cancel',style: TextStyle(color: bpurple),),
                                )
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ));
          }));
    });}
}