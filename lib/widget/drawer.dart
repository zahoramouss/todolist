import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../resources/resource.dart';
import'../controller/userController.dart';

double heightcontainer;
userTask db=userTask();
double sc=4;

  Widget Draweruser(BuildContext context,String n) {

    var size=MediaQuery.of(context).size;
    heightcontainer=size.height*.06;
   return Drawer(child: Container(
       color: purple,
       child: Column(
         children: [
           Container(
             margin: EdgeInsets.only(top:size.height*.09),
             height:size.height*.07 ,
             decoration: BoxDecoration(
                 image: DecorationImage(
                     image: AssetImage('assets/images/ic-13.png')
                 )
             ),
           ),
           Container(
             margin: EdgeInsets.only(top: size.height*.01),
             child: Text('$n',style: TextStyle(fontSize: 19,fontFamily: fbold,color: Colors.white,fontWeight: FontWeight.bold),),),

             Container(
               // width: ,
               margin: EdgeInsets.only(top: size.height*.06),
               height:heightcontainer ,

               child: Row(children: [
                 Container(
                   margin:EdgeInsets.only(left: size.width*.12),
                   child: Image.asset('assets/images/ic-15.png',scale: sc,),
                 ),
                 Container(
                   margin: EdgeInsets.only(left: size.width*.05),

                   child:FlatButton(
                     onPressed: (){
                       Navigator.of(context).pushNamedAndRemoveUntil('/home',(Route<dynamic>route)=>false);


                     },
                   child:Text('Today',style: TextStyle(fontFamily: 'fregular',fontSize: 17,color: Colors.white),),),

                 )],),
           ),


              Container(
               height:heightcontainer ,

               child: Row(children: [
                 Container(
                   margin:EdgeInsets.only(left: size.width*.12),
                   child: Image.asset('assets/images/ic-16.png',scale: sc,),
                 ),
                 Container(
                     margin: EdgeInsets.only(left: size.width*.05),
                       child:FlatButton(
                         onPressed: (){

                           Navigator.of(context).pushNamedAndRemoveUntil('/tomorrow',(Route<dynamic>route)=>false);
                         },
                       child:Text('Tomorrow',style: TextStyle(fontFamily: 'fregular',fontSize: 17,color: Colors.white),),)


                 )],),
             ),

           //logout

               Container(

               margin: EdgeInsets.only(top: size.height*.03),
               height:heightcontainer ,
               child:Row(children: [
                 Container(
                   margin:EdgeInsets.only(left: size.width*.12),
                   child:Image.asset('assets/images/ic-17.png',scale: sc,),
                 ),
                 Container(margin: EdgeInsets.only(left: size.width*.05),
                    child:FlatButton(
                        onPressed: ()async{
                          await db.logout();

                          var y="0";
                          await db.save(y);
                          Future.delayed(const Duration(milliseconds: 800), ()
                          {
                            SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                          } );},
                     child:Text('Logout',style: TextStyle(fontFamily: 'fregular',fontSize: 17,color: Colors.white),))

                 )],),
            ),
         ],
       )),
   );

  }