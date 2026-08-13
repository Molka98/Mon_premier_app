import 'package:flutter/material.dart';
import  'package:mon_premier_app/color_app.dart';

class UserCardWidget extends StatelessWidget {
  final String name;
  final int age;
  final String imageUrl;
 

  const UserCardWidget({
    super.key, 
    required this.name, 
    required this.age, 
    required this.imageUrl,
    });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 500,
        width: 300,
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
          // color:Colors.lightBlue,
          // color: Color(0xFFEED9C4),
          color: beige,

      ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [
            Text("Full name: $name"), 
            Text("Age: $age"),

            //This is an example of assets
            // Image.asset('assets/images/user_image.png',
            //  height:200, 
            //  width: 100),

            Image.network(
              height: 200,
              width: 100,
              imageUrl,
              errorBuilder: ( 
                BuildContext context, 
                Object exception, 
                StackTrace? stackTrace,
                ) {

                return Text("This is an error in image");
              }
            ),

            ElevatedButton(
              onPressed:() {
              print("This button works !");

              },

              child: Text("Change image"),
             
             ),


          ],
        ),
      ),
    ); 
}

 }