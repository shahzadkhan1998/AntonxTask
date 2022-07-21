
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Horilist extends StatelessWidget {
  var list  = [
    {
      "name":"personal"
    },
    {
      "name":"company"
    },
    {
      "name":"badge"
    },
    {
      "name":"Salary"
    },
    {
      "name":"work"
    }
  ];
   Horilist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: Get.width,
      color: Colors.white,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index)
        {
          var personal = list[index]["name"].toString();
          var company = list[index]["name"].toString();
          var badge = list[index]["name"].toString();

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              width: 80,
              decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(20)
              ),
              child:  Text("${list[index]["name"]}",style: const TextStyle(fontSize: 15,
                  fontWeight: FontWeight.w600),),
            ),
          );
        },),
    );
  }
}
