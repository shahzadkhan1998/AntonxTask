import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/component/HListview.dart';
import 'package:untitled/profile/controller/profilecontroller.dart';
import 'package:dotted_line/dotted_line.dart';

import '../../component/color.dart';


class Profile extends StatelessWidget {
   Profile({Key? key}) : super(key: key);
  ProfileController pcontroller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Stack(
           children: [
             Container(
               width: MediaQuery.of(context).size.width,
               height: MediaQuery.of(context).size.height*0.2,
               color: Colors.blue,

             ),
             Stack(
               children: [
                 Positioned(
                   top: Get.height*0.13,
                   child: Padding(
                     padding: const EdgeInsets.only(left: 5.0),
                     child: Container(
                       width: Get.width,
                       height: Get.height,
                       decoration: const BoxDecoration(
                         color: Colors.white,
                         borderRadius: BorderRadius.only(topRight: Radius.circular(10),
                             topLeft: Radius.circular(10))
                       ),
                     ),
                   ),
                 ),
                 Positioned(
                   top: Get.height*0.1,
                     left: Get.width*0.09,
                     child: profileimage(context,pcontroller.image),),
                 // making  bADGE FOR PROFILE

               ],
             ),
             // making a badge for profile
             Positioned(
               top: Get.height*0.14,
               left: Get.width*0.30,
               child: Container(
                 width: Get.width*0.280,
                 height: Get.height*0.05,
                 decoration: BoxDecoration(
                     color: Colors.orange,
                     borderRadius: BorderRadius.circular(20)
                 ),
                 child: Row(
                   children: [
                     Container(
                        padding: const EdgeInsets.all(5),
                       child: const Icon(Icons.star,color: Colors.white,),
                     ),
                     Container(
                       child: const Text("Featured",style: TextStyle(color: Colors.white),),
                     ),
                   ],
                 ),
               ),
             ),
            // calling a profile name
             Positioned(
               top: Get.height*0.21,
                 left: Get.height*0.04,
                 child: Proiflename(pcontroller.name,pcontroller.designation),),
             // Calling a EditButton//
             Positioned(
                 top: Get.height*0.20,
                 left: Get.width*0.80,
                 child: EditButton()),
             // calling a class which have horizental List
                Positioned(
                  top: 260,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Horilist(),
                    )),

             //// Caling Define Experience Widget
             Positioned(
               top: 300,
                 left: 15,
                 child: Container(
                   height: 80,

                     width: Get.width,
                     child: DefineExperience(),),),
             const  Positioned(
               top: 380,
                 left: 30,
                 child:  Text("Your Journey at Antonx",
                   style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
             ),
             // calling a Container function
             Positioned
               (
               top: 410,
                 left: 30,
                 child: buildContainer(customcolor.green,"${pcontroller.job1}","June 2018"),),


             // Callling a Dotted Line horizentally here
             const Positioned(
               top: 450,
                 left: 180,
                 child:DottedLine(
                   lineLength: 100,
                 ),
             ),
             const Positioned(
               top: 450,
               left: 280,
               child:DottedLine(
                 direction: Axis.vertical,
                 lineLength: 80,
               ),
             ),
             Positioned(
               top: 480,
                 left: 200,
                 child: buildContainer(customcolor.grey,"${pcontroller.job2}","March 2019"),),

             const Positioned(
               top: 530,
               left: 120,
               child: DottedLine(
                 direction: Axis.horizontal,
                 lineLength: 100,
               ),),
             const Positioned(
               top: 530,
               left: 120,
               child: DottedLine(
                 direction: Axis.vertical,
                 lineLength: 100,
               ),),

             Positioned
               (
                 top: 580,
                 left: 50,
                 child: buildContainer(customcolor.orange,"${pcontroller.job3}","December 2019"),),
             const Positioned(
               top: 620,
               left: 200,
               child: DottedLine(
                 direction: Axis.horizontal,
                 lineLength: 100,
               ),),
             const Positioned(
               top: 620,
               left: 300,
               child: DottedLine(
                 direction: Axis.vertical,
                 lineLength: 100,
               ),),
             Positioned
               (
               top: 680,
               left: 220,
               child: buildContainer(customcolor.blue,"${pcontroller.job4}","April 2020"),),
             const Positioned(
               top: 710,
               left: 120,
               child: DottedLine(
                 direction: Axis.horizontal,
                 lineLength: 100,
               ),),
             const Positioned(
               top: 710,
               left: 120,
               child: DottedLine(
                 direction: Axis.vertical,
                 lineLength: 100,
               ),),
             Positioned
               (
               top: 750,
               left: 50,
               child: buildContainer(customcolor.pink,"Creative Director","Present"),),
           ],

        ),
    );
  }
}
/// profile image
Widget profileimage(context,url)
{
  return Container(
    height:Get.height*0.1,
    width: Get.width*0.2,
    decoration:  BoxDecoration(
      color: Colors.orange,
      borderRadius: BorderRadius.circular(10),
    shape: BoxShape.rectangle,
        border: Border.all(
          width: 5,
          color: Colors.white,

    ),
    ),

    child: Image.network(url),
  );
}
// make A PROFILE NAME SUB NAME AND OTHER
Widget Proiflename(String name,String name1)
{
  return Container(
    child: Column(

      children: [
        Container(
          child:  Text("${name.toString()}",
            style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
        ),
        Container(
          child:  Text("${name1.toString()}",style:
          const TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.w500,)),
        ),

      ],
    )
  );
}

/// Make A EDIT BUTTON
Widget EditButton()
{
  return Container(
    width: 80,
    height: 40,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.blue

    ),
    child: const Center(
      child: Text("Edit",style: TextStyle(color: Colors.white),),
    ),
  );
}

// Def Experience and Salary widget
Widget DefineExperience()
{
  return const ListTile(
    leading: Icon(Icons.date_range,color: Colors.grey,),
    title: Text("2 year and 3 months at Antonx",style: TextStyle(fontWeight: FontWeight.w600),),
    subtitle: Text("You joined Antonx at 1 April in 2020",style: TextStyle(fontSize: 13),),
  );
}
//////// Definee a Widget for Your Journey

Widget buildContainer(Color color,String a,String b)
{
  return Container(
    width: 150,
    height: 80,
    decoration: BoxDecoration(
      color:color,
      borderRadius: BorderRadius.circular(5),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:  [
         Center(child: Text("$a",style: TextStyle(fontWeight: FontWeight.bold),)),
         Center(child: Text("$b")),
      ],
    ),
  );

}
/// now we Build a dotted horizentally Line here.
Widget BuldDashes()
{
  return DottedLine(
    direction: Axis.horizontal,

  );
}
/// now we Build a dotted vertically Line here.
Widget BuldDashes1()
{
  return DottedLine(
    direction: Axis.vertical,

  );
}




