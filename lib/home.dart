import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:list/constants/constants_colors.dart';
import 'package:list/screens/onboard/onboard.dart';

    class HomePage extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          backgroundColor: CustomColors.beige,
          body: GestureDetector(
            dragStartBehavior: DragStartBehavior.start,
            onHorizontalDragStart: (value){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Onboard()));
            },
            onHorizontalDragEnd: (value){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Onboard()));

            },
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Onboard()));

            },
            //Can implements many more here according to our needs

            child: Center(
              child: Container(
                height: MediaQuery.of(context).size.width/4,
                child: Column(
                  children: [
                    RichText(
                      text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Welcome to ",
                              style: TextStyle(fontSize: 29, color: CustomColors.black),
                            ),
                            TextSpan(
                              text: "Clear",
                              style: TextStyle(fontSize: 29, fontWeight: FontWeight.bold, color: CustomColors.black),
                            ),
                          ]
                      ),
                    ),
                    Spacer(),
                    RichText(
                      text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Tap or swipe ",
                              style: TextStyle(fontSize: 29,fontWeight: FontWeight.bold, color: CustomColors.black),
                            ),
                            TextSpan(
                              text: "to begin",
                              style: TextStyle(fontSize: 29,  color: CustomColors.black),
                            ),
                          ]
                      ),
                    ),
                  ],
                ),
              )
            ),
          ),
        );

      }
    }
    