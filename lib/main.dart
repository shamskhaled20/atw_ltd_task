import 'package:atw_ltd/view/album_detials.dart';
import 'package:atw_ltd/view/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
       getPages: [
         GetPage(
           name: '/album-details',
           page: () => AlbumDetailsScreen(
             Get.arguments['albumId'],
             Get.arguments['albumTitle'],
           ),
         ),


       ],
     home:  ProfileScreen(),
    );
  }
}