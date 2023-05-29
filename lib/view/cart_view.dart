import 'package:flutter/material.dart';
class CartView extends StatelessWidget {
  List<String> names= <String>['aaaaaa','bbbbbb','cccccc','dddddd','eeeeee',];
  List<String> images=<String>[
    'assets/images/Image.png',
    'assets/images/Image.png',
    'assets/images/Image.png',
    'assets/images/Image.png',
    'assets/images/Image.png',];
  List<int> prices=<int>[100,200,300,400,500,];


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
          child: ListView.separated(
            itemBuilder:(context,index){
              return Container(
                height: 140,
                child: Row(
                  children: [
                    Container(
                      width: 140,
                      child: Image.asset(
                        images[index],
                        fit: BoxFit.fill,),
                    ),

                  ],
                ),


              );
            },itemCount: names.length,
            separatorBuilder: (BuildContext context, int index){
              return SizedBox(
                height: 15,
              );
            },

          )
      ),


    );
  }
}
