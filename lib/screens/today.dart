import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../widget/drawer.dart';
import 'package:intl/intl.dart';
import '../resources/resource.dart';
import'../controller/userController.dart';
import '../my_flutter_app_icons.dart';
import '../widget/background.dart';
import'../widget/empty.dart';

import 'package:flutter_switch/flutter_switch.dart';
import '../model/model.dart';
List<Todolist> l;
List<Todolist> k;
class today extends StatefulWidget{
  today({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
  return new todaystate();
  }

}
class todaystate extends State<today>{
  TextEditingController contro=TextEditingController();



  double heightcontainer;
  TextEditingController TxT =TextEditingController();
  bool checkBoxValue=false;
  bool status=false;
 String name='';
  userTask db=userTask();
  double sc=4;
  void initState(){
    super.initState();
    db.showUserinfo().then((value) {setState(() {
      name=value;

    });
    });
    db.showTodaytask().then((value) {
      setState(() {
        l=value;

      });
    });
    db.showCompletedtask().then((value) {
      setState(() {
        k=value;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
 var size=MediaQuery.of(context).size;
 heightcontainer=size.height*.06;

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

    body: Container(
      child: Column(
        children: [
         back(context,'Today',0),

      Center(
        child: Container(
          margin: EdgeInsets.only(top: 7),
          height: size.height*.0558,
          width: size.width*.5917,
          decoration: BoxDecoration(

            image: DecorationImage(

              image:AssetImage((switchindex==0)?'assets/images/ongoing.png':'assets/images/completed.png'),
              //fit: BoxFit.cover
            )
          ),
          child: InkWell(
            splashColor: Colors.transparent,
            highlightColor:Colors.transparent ,
            onTap: (){
              setState(() {
                Future.delayed(const Duration (milliseconds: 150),()=>"2").then((value) {
                  setState(() {
                    if(switchindex==1){
                      switchindex=0;
                    }else{
                    switchindex=1;}
                  });
                });

              });
  }
          ),
        ),
      ),
               Expanded(child:Container(
               //  color: Colors.red,
                 height: size.height*.45,
                child:  Stack(children: [
                  (switchindex==1)?Container(child:(k==null)? Center(child:   Theme(data: Theme.of(context).copyWith(accentColor:purple),
                    child:CircularProgressIndicator() ,)) :
                  (((db.comstaus==false)||((k.length)==0))? emptypic(context)
                 : ListView.builder(
                      itemCount: k.length,
                      itemBuilder: (BuildContext context, int position){
                        return Slidable(
                          child:GestureDetector(
                            child: Container(
                               //height: size.height*.1,
                              //color: Colors.purpleAccent,
                              child: Column(
                                children: [
                                  Container(
                                    //color:Colors.deepPurpleAccent,
                                    margin:EdgeInsets.only(top: size.height*.046),
                                    child: Row(children: [
                                      Container(

                                        margin:EdgeInsets.only(left: size.width*.06),


                                        child: Container(
                                          height:   size.width*.10,
                                          width: size.width*.10,


                                          child: IconButton(
                                            icon:Image.asset('assets/images/ic-10.png'),
                                            onPressed: (){
                                              setState(() {
                                                print(k.length);
                                                db.makeTaskcomplete(k[position].id);
                                                print('done');
                                                setState(() {

                                                  print(switchindex);
                                                  l.add(k[position]);
                                                  k.removeAt(position);

                                                });

                                              });
                                            },
                                          ),),

                                      ),
                                      Expanded(child: Container(
                                        margin:EdgeInsets.only(left: size.width*.023),
                                        child:Text('${k[position].content}',style: TextStyle(fontSize: 19,color: listpurple,

                                          decoration:TextDecoration.lineThrough,
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
                            onDoubleTap: (){

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

                                await db.deleteTask(k[position].id);
                                setState(() {

                                  k.removeAt(position);

                                });


                              },
                            )

                          ],);
                      })))
                      :
                  Container(child: (l==null)? Center(child:   Theme(data: Theme.of(context).copyWith(accentColor:purple),
                    child:CircularProgressIndicator() ,)) :
                  (((db.onstatus==false)||((l.length)==0))?emptypic(context)
                  :ListView.builder(
                      itemCount: l.length,
                      itemBuilder: (BuildContext context, int position){
                        return Slidable(
                          child:GestureDetector(
                            child: Container(
                              //height: size.height*.1,
                              //color: Colors.purpleAccent,
                              child: Column(
                                children: [
                                  Container(
                                    //color:Colors.deepPurpleAccent,
                                    margin:EdgeInsets.only(top: size.height*.046),
                                    child: Row(children: [
                                      Container(

                                        margin:EdgeInsets.only(left: size.width*.06),


                                        child: Container(
                                          height:   size.width*.10,
                                          width: size.width*.10,

                                          child: IconButton(
                                            icon:Image.asset('assets/images/ic-9.png'),
                                            onPressed: (){
                                              setState(() {
                                                print(l.length);
                                                db.makeTaskcomplete(l[position].id);
                                                print('done');
                                                setState(() {

                                                  print(switchindex);
                                                  k.add(l[position]);
                                                  l.removeAt(position);

                                                });

                                              });
                                            },
                                          ),),

                                      ),
                                      Expanded(child: Container(
                                        margin:EdgeInsets.only(left: size.width*.023),
                                        child:Text('${l[position].content}',style: TextStyle(fontSize: 19,color: listpurple,


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
                            ////maketask to tomorrow
                            onDoubleTap: (){
                              transfer(size,l[position].content,l[position].id,position);
                            },
                          ),
                          actionPane: SlidableDrawerActionPane(),

                          secondaryActions: [
                            //IconButton(icon: null, onPressed: null),

                            IconSlideAction(
                              color:lightgray,
                              icon: MyFlutterApp.ic_20,
                              foregroundColor:grey,
                              onTap: ()async{

                                await db.deleteTask(l[position].id);
                                setState(() {

                                  l.removeAt(position);
                                  print(l);
                                  print(l.length);

                                });


                              },
                            )

                          ],);
                      })
                  )),
                   ////floatingbutton
                   Container(


                     //alignment: Alignment.bottomRight,
                     margin: EdgeInsets.only(right:size.width*.08,top: size.height*.35,left: size.width*.79),
                     child: FloatingActionButton(  child: new Icon(Icons.add,),
                         backgroundColor: fgreen,
                         onPressed: (){
                           setState(() {
                             _showdialog( TxT, size);

                           });
                         }
                     ),)
                 ],),),) ,
                //list

              ],
            )


          ,),




  );

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
                            controller: TxT),),
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
                                    await db.createTomorrowtask(txt.text);
                                    }
                                  else{

                                    Todolist r=await db.createTotask(txt.text);

                                     l.add(r);
                                     print(l[0]);
                                     txt.clear();
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
                                   if (status){
                                   bool r= await db.transfrmtask(d);
                                   print(p);

                                   setState((){
                                     if (r){
                                     //l.removeAt(0);
                                         print(l);
                                     //l.removeAt(p);
                                     Navigator.of(context).pushNamed('/tomorrow');}else{
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