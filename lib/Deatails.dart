import 'package:challenge2camp/constant.dart';
import 'package:challenge2camp/main.dart';
import 'package:challenge2camp/receip_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/link.dart';

class DetailsScreen extends StatelessWidget {
  final int index;

  const DetailsScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 450,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color(int.parse(receiptList[index].Color)),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 40,
                            left: 10,
                            right: 10
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.grey[200],
                              ),
                              child: IconButton(onPressed: (){
                               navigateAndFinish(context, MyHomePage());
                              }, icon: Icon(Icons.arrow_back_ios_outlined),color: Colors.grey[800],),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.grey[200],
                              ),
                              child: IconButton(onPressed: (){
                              }, icon: Icon(Icons.notifications_none),color: Colors.grey[800],),
                            )

                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(
                          right: 160,
                          top: 50,
                          left: 20
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [

                            Text(receiptList[index].name,style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w500),),
                            Container(
                              width: 200,
                              child: Divider(
                                thickness: 0.6,
                                color: Colors.white,
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.watch_later,color:  Colors.white,size: 32),
                                SizedBox(width: 5,),
                                Text('30 min ',style: TextStyle(color: Colors.white),)
                              ],),
                            SizedBox(height: 20,),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.person,color:  Colors.white,size: 32),
                                SizedBox(width: 5,),
                                Text('2 Servings ',style: TextStyle(color: Colors.white),)
                              ],
                            ),
                            SizedBox(height: 20,),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(CupertinoIcons.flame,color:  Colors.white,size: 32,),
                                SizedBox(width: 5,),
                                Text('350 calories ',style: TextStyle(color: Colors.white),)
                              ],
                            ),
                            SizedBox(height: 20,),
                            Padding(
                              padding: const EdgeInsets.only(top: 5,bottom: 30),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  RatingBar.builder(
                                    initialRating: 4.5,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: 20,
                                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Colors.white,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                  Text('347 Reviews ',style: TextStyle(fontSize: 13,color: Colors.white),)
                                ],),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),),
                Positioned(
                  left: 200,
                  top: 120,
                  child: Container(
                      height: 250,
                      width: 250,
                      child: Image(image: AssetImage(receiptList[index].img))),
                )
              ],
            ),
         Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Padding(
               padding: const EdgeInsets.all(15.0),
               child: Text('Ingredients',style: TextStyle(fontSize: 24,color: primary,fontWeight: FontWeight.w500),),
             ),
             SizedBox(
               height: 20,
             ),
             Padding(
               padding: const EdgeInsets.only(left: 20),
               child: Stack(
                 clipBehavior: Clip.none,
                 children: [
                   Container(
                     height: 50,
                     width: MediaQuery.of(context).size.width -30,
                     decoration: BoxDecoration(
                       border: Border.all(
                           width: 3.0,
                         color: Color(int.parse(receiptList[index].Color)),

                       ),
                       borderRadius: BorderRadius.all(
                           Radius.circular(30.0) //                 <--- border radius here
                       ),
                     ),
                     child: Center(child: Text('break down your past ',style: TextStyle(),),),
                   ),
                   Positioned(
                     bottom: 20,
                     child: Stack(
                       children: [
                         Container(
                           height: 50,
                           width: 50,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(50),
                             color: Color(int.parse(receiptList[index].Color)),
                           ),
                           child: Container(),
                         ),
                         Positioned.fill(
                           child: Center(
                             child: Transform.rotate(
                               angle: 18,
                               child: Container(
                                 height: 25,
                                   width: 25,
                                   child: Image.asset('assets/chef.png')),
                             ),
                           ),
                         ),
                       ],
                     ),
                   )
                 ],
               ),
             ),
             SizedBox(
               height: 30,
             ),
             Padding(
               padding: const EdgeInsets.only(left: 20),
               child: Stack(
                 clipBehavior: Clip.none,
                 children: [
                   Container(
                     height: 50,
                     width: MediaQuery.of(context).size.width -30,
                     decoration: BoxDecoration(
                       border: Border.all(
                         width: 3.0,
                         color: Color(int.parse(receiptList[index].Color)),

                       ),
                       borderRadius: BorderRadius.all(
                           Radius.circular(30.0) //                 <--- border radius here
                       ),
                     ),
                     child: Center(child: Text('break down your past ',style: TextStyle(),),),
                   ),
                   Positioned(
                     bottom: 20,
                     child: Stack(
                       children: [
                         Container(
                           height: 50,
                           width: 50,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(50),
                             color: Color(int.parse(receiptList[index].Color)),
                           ),
                           child: Container(),
                         ),
                         Positioned.fill(
                           child: Center(
                             child: Transform.rotate(
                               angle: 18,
                               child: Container(
                                   height: 25,
                                   width: 25,
                                   child: Image.asset('assets/chef.png')),
                             ),
                           ),
                         ),
                       ],
                     ),
                   )
                 ],
               ),
             ),
             SizedBox(
               height: 30,
             ),
             Padding(
               padding: const EdgeInsets.only(left: 20),
               child: Stack(
                 clipBehavior: Clip.none,
                 children: [
                   Container(
                     height: 50,
                     width: MediaQuery.of(context).size.width -30,
                     decoration: BoxDecoration(
                       border: Border.all(
                         width: 3.0,
                         color: Color(int.parse(receiptList[index].Color)),

                       ),
                       borderRadius: BorderRadius.all(
                           Radius.circular(30.0) //                 <--- border radius here
                       ),
                     ),
                     child: Center(child: Text('break down your past ',style: TextStyle(),),),
                   ),
                   Positioned(
                     bottom: 20,
                     child: Stack(
                       children: [
                         Container(
                           height: 50,
                           width: 50,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(50),
                             color: Color(int.parse(receiptList[index].Color)),
                           ),
                           child: Container(),
                         ),
                         Positioned.fill(
                           child: Center(
                             child: Transform.rotate(
                               angle: 18,
                               child: Container(
                                   height: 25,
                                   width: 25,
                                   child: Image.asset('assets/chef.png')),
                             ),
                           ),
                         ),
                       ],
                     ),
                   )
                 ],
               ),
             ),
             SizedBox(
               height: 20,
             ),
             Padding(
               padding: const EdgeInsets.all(15.0),
               child: Text('Directions',style: TextStyle(fontSize: 24,color: primary,fontWeight: FontWeight.w500),),
             ),
             SizedBox(
               height: 30,
             ),
             Padding(
               padding: const EdgeInsets.only(left: 20),
               child: Stack(
                 clipBehavior: Clip.none,
                 children: [
                   Container(
                     height: 50,
                     width: MediaQuery.of(context).size.width -30,
                     decoration: BoxDecoration(
                       border: Border.all(
                         width: 3.0,
                         color: Color(int.parse(receiptList[index].Color)),

                       ),
                       borderRadius: BorderRadius.all(
                           Radius.circular(30.0) //                 <--- border radius here
                       ),
                     ),
                     child: Center(child: Text('put your pasta to boil for 10 min ',style: TextStyle(),),),
                   ),
                   Positioned(
                     bottom: 20,
                     child: Stack(
                       children: [
                         Container(
                           height: 50,
                           width: 50,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(50),
                             color: Color(int.parse(receiptList[index].Color)),
                           ),
                           child: Container(),
                         ),
                         Positioned.fill(
                           child: Center(
                             child: Transform.rotate(
                               angle: 18,
                               child: Container(
                                   height: 25,
                                   width: 25,
                                   child: Center(child: Text('1',style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.w500),))),
                             ),
                           ),
                         ),
                       ],
                     ),
                   )
                 ],
               ),
             ),
             SizedBox(
               height: 30,
             ),
             Padding(
               padding: const EdgeInsets.only(left: 20),
               child: Stack(
                 clipBehavior: Clip.none,
                 children: [
                   Container(
                     height: 50,
                     width: MediaQuery.of(context).size.width -30,
                     decoration: BoxDecoration(
                       border: Border.all(
                         width: 3.0,
                         color: Color(int.parse(receiptList[index].Color)),

                       ),
                       borderRadius: BorderRadius.all(
                           Radius.circular(30.0) //                 <--- border radius here
                       ),
                     ),
                     child: Center(child: Text('put your pasta to boil for 10 min ',style: TextStyle(),),),
                   ),
                   Positioned(
                     bottom: 20,
                     child: Stack(
                       children: [
                         Container(
                           height: 50,
                           width: 50,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(50),
                             color: Color(int.parse(receiptList[index].Color)),
                           ),
                           child: Container(),
                         ),
                         Positioned.fill(
                           child: Center(
                             child: Transform.rotate(
                               angle: 18,
                               child: Container(
                                   height: 25,
                                   width: 25,
                                   child: Center(child: Text('2',style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.w500),))),
                             ),
                           ),
                         ),
                       ],
                     ),
                   )
                 ],
               ),
             ),
             SizedBox(
               height: 30,
             ),
             Padding(
               padding: const EdgeInsets.only(left: 20),
               child: Stack(
                 clipBehavior: Clip.none,
                 children: [
                   Container(
                     height: 50,
                     width: MediaQuery.of(context).size.width -30,
                     decoration: BoxDecoration(
                       border: Border.all(
                         width: 3.0,
                         color: Color(int.parse(receiptList[index].Color)),

                       ),
                       borderRadius: BorderRadius.all(
                           Radius.circular(30.0) //                 <--- border radius here
                       ),
                     ),
                     child: Center(child: Text('put your pasta to boil for 10 min ',style: TextStyle(),),),
                   ),
                   Positioned(
                     bottom: 20,
                     child: Stack(
                       children: [
                         Container(
                           height: 50,
                           width: 50,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(50),
                             color: Color(int.parse(receiptList[index].Color)),
                           ),
                           child: Container(),
                         ),
                         Positioned.fill(
                           child: Center(
                             child: Transform.rotate(
                               angle: 18,
                               child: Container(
                                   height: 25,
                                   width: 25,
                                   child: Center(child: Text('3',style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.w500),))),
                             ),
                           ),
                         ),
                       ],
                     ),
                   )
                 ],
               ),
             ),
             SizedBox(
               height: 30,
             ),

           ],

         ),

          ],
        ),

      ),
         floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          backgroundColor: Color(int.parse(receiptList[index].Color)),
          icon: Icon(
            Icons.play_circle_fill,
            color: Colors.white,
            size: 32,
          ),
          label: Text(
            "Watch Video",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          )
      ),


    );

  }
  void navigateAndFinish(
      context,
      widget,
      ) =>
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ),
            (route) {
          return false;
        },
      );
}

