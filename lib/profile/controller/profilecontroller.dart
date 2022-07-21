import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController
{
  var list = [];
  var name;
  var id;
  var email;
  var contact;
  var current_adress;
  var designation;
  var image;
  var job1;
  var job2;
  var job3;
  var job4;

   String url = "https://antonxdemo.com/antonx_world_backend/api/v1/get_user_info";
   var token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiNWY5MmI4NjVjNjNiMmY2ZmQ3YjhiNzIyZDQxZDg4OGI5NDkzNDU5ZWNlZjI5MTA4MDljMzg5MDg3NGRhZTU1MzMzNGVhZGJiMmRlMzBmMzkiLCJpYXQiOjE2NTgyMTU3MzMuNjAyMTcyLCJuYmYiOjE2NTgyMTU3MzMuNjAyMTc5LCJleHAiOjE2ODk3NTE3MzMuNTk5MTQzLCJzdWIiOiI4Iiwic2NvcGVzIjpbXX0.boodEct_fjZv0X8cwhqEXtD5QSc6izeM5cdHKkVo_VLB9WbC0qUw0eUyXqVBPZgcOOLwDNwbELCL-zoFASjt4lcS8hcjgDsuGF-TC4HRSUn0i_46H5637TrRyXHga-gqRPzsLeg4FBHlftmH0yTBLcZ-1CPpujhGdo4Qa9TH4v39der23J78TJcLevGU6rzIi0pNGhEmeP45Bw0c5VpXaPHcu0ZRQdkbGwOkbV2DYKpyuo1gsiRfABRVh4DcXkl3XrVlWQgxJCT-zqfS6DsrZnmCr0OaslWi6RX4PMgj-tCb4VicpSCMJdjGBvjCszOOJRTtWuRbtEC9uh40KhDs5WU0kIw-z1bCYKr5ZjCNN6IKJzOr-EBgTnEDVdqy3oNGNDfRAoCnTx3r-i4RC9tjLoAzb0Z-bVDinA9Pa5HSToZLKcSXa5u3JlBhTeMFvyMm7fj199NGhnWUcFT13N6e8GhHGUEbJYe3IrygRZ8hqAFj4MAzlKLoO_SsZOnuibnycv4P9Fkupo27FbCj7XK_tHXmupSOUEiQcu3NOK1Swr6coKLK-S-qt2m2Gg6TUU8-ARfB0Q1Wu7EQca01fPFErhCGn4kcFJ7SY1Haq3m9CaPyBOCsS__shUQgSPYcrD2uu-O4nuUFi0VgAKUlTbxYVp2olLBZ_1AGf3Xni02H-MU";
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    updateAppbar();
  }
   @override
   void onReady() {
     // TODO: implement onReady
     super.onReady();
     getApiData();
   }



   updateAppbar() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    update();

  }

// getting data to from server to user.
   getApiData() async
  {

    var response =  await http.get(Uri.parse(url),headers:
    {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
   var data = jsonDecode(response.body);
         name = data["body"]["user_info"]["name"];
         id = data["body"]["user_info"]["id"];
         email = data["body"]["user_info"]["email"];
         contact = data["body"]["user_info"]["contact"];
         current_adress = data["body"]["user_info"]["current_address"];
         designation =  data["body"]["user_info"]["job_type"];
         image = data["body"]["user_info"]["image_url"];
         job1 = data["body"]["user_info"]["company"][0]["designation"];
         job2 = data["body"]["user_info"]["company"][1]["designation"];
         job3 = data["body"]["user_info"]["company"][2]["designation"];
         job4 = data["body"]["user_info"]["company"][3]["designation"];
         print(job1+job2+job3+job4);





      switch(response.statusCode)
      {
        case 200:
          print("server is Ok");
          break;

        case 404:
          print("server data not found");
          break;

        case 503:
          print("Server not Working");
          break;

          default:
            print("Error");
      }


  }



}