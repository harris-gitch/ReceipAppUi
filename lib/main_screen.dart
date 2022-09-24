import 'package:challenge2camp/Deatails.dart';
import 'package:challenge2camp/constant.dart';
import 'package:challenge2camp/receip_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainScreen extends StatefulWidget {


  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List filter=[
    'Entrees',
    'Apps',
    'Meats',
    'Vegan',
    'Salad'
  ];
  final controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 20,
                  right: 20,
                  // bottom: 10
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Image(image: AssetImage('assets/paragraph.png'),),
                    ),
                    IconButton(onPressed: (){},icon: Icon(CupertinoIcons.bell,color: Colors.white,size: 32,))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 40,
                  left: 20,
                  right: 20,

                ),
                child: Text('Hi, Harris',style: TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.w300),),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 10,
                    left: 20,
                    right: 20,
                    bottom: 10
                ),
                child: Text('What do you want to \n cook today',style: TextStyle(fontSize: 32,color: Colors.white,fontWeight: FontWeight.w600),),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20,
                    top: 5),
                child: Container(
                  // alignment: Alignment.centerLeft,

                    height: 50,
                    width: MediaQuery.of(context).size.width-40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Colors.white
                    ),
                    child:  TextFormField(
                        controller: controller,
                        keyboardType: TextInputType.emailAddress,
                        onSaved: (value) {
                          // emailController.text = value!;
                        },
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          prefixIcon: Icon(CupertinoIcons.search,color: Colors.black,),
                          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                          hintText: 'Search for Receipt',
                          enabledBorder: InputBorder.none,
                          focusedBorder:  InputBorder.none,
                        ))
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 25,
                  left: 25,
                  right: 20,

                ),
                child: Text('Most Popular Reciept',style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.w500),),
              ),

              Container(
                  width:double.infinity ,
                  height: 350,
                  child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index)=>BuildItemMeals(receiptList[index],index), separatorBuilder: (context,index)=>SizedBox(width: 20,), itemCount: 2)),

              Padding(
                padding: const EdgeInsets.only(
                    top: 30,
                    left: 20,
                    bottom: 40
                ),
                child: Row(children: [


                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white.withOpacity(0.3),
                      ),
                      height: 70,
                      width: 70,
                      child: IconButton(onPressed: (){}, icon: Icon(FontAwesomeIcons.filter,color: Colors.white,))),
                  SizedBox(width: 10),
                  Container(

                    height: 70,
                    width: MediaQuery.of(context).size.width-100,
                    child: ListView.separated(

                      scrollDirection: Axis.horizontal,
                      itemCount: filter.length,
                      itemBuilder: (context,index){return Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xff1C3955),
                        ),
                        child: Center(child: Text(filter[index],style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w300),)),);},
                      separatorBuilder: (BuildContext context, int index) { return SizedBox(width: 10,); },),
                  ),
                ],),
              ),





            ],),
        ),
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
  Widget BuildItemMeals(ReceiptModel model,index)=>GestureDetector(
    onTap: (){
      navigateAndFinish(context, DetailsScreen(index: index,));
    },
    child: Stack(clipBehavior: Clip.none,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20,
              top: 20),
          child: Container(
            alignment: Alignment.bottomCenter,

            height: 350,
            width: 230,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Color(int.parse(model.Color)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [

                Text(model.name,style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w500),),
                Container(
                  width: 210,
                  child: Divider(
                    thickness: 0.6,
                    color: Colors.white,
                  ),
                ),
                Row(mainAxisSize: MainAxisSize.min,
                  children: [

                    Row(children: [
                      Icon(Icons.watch_later,color:  Colors.white,),
                      SizedBox(width: 5,),
                      Text('30 min ',style: TextStyle(color: Colors.white),)
                    ],),
                    SizedBox(width: 20,),
                    Row(
                      children: [
                        Icon(Icons.person,color:  Colors.white,),
                        SizedBox(width: 5,),
                        Text('2 Servings ',style: TextStyle(color: Colors.white),)
                      ],
                    )
                  ],
                ),
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
                        itemSize: 10,
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
        ),
        Positioned(
          left: 70,
          top: 30,
          child: Container(
              height: 200,
              width: 200,
              child: Image(image: AssetImage(model.img))),
        )
      ],
    ),
  );
}
