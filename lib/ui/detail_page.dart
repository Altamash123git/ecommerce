import 'package:ecommerce/Appconstants/colors.dart';
import 'package:flutter/material.dart';

import '../utils/decoration.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List<Color> productColors= [Color(0xff901D30),Color(0xff151515),Color(0xff1d4491),Color(0xff90471e),Color(0xffd8d6d7)];
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Container(
        //padding: EdgeInsets.symmetric(horizontal: 14,vertical: 0),
        child: SingleChildScrollView(

          child: Column(
            children: [
              Stack(
          
                children: [
                  Container(
                    height: 400,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCCq3RUiyESsXd16XLpMJsQKvRA6B8RJW2vw&s"),fit: BoxFit.cover),
                      color: AppColors.primaryColor
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              width:40,
                              height: 40,
                              decoration:BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              child: Icon(Icons.arrow_back_ios_new_outlined)),
                          Row(
                            children: [
                              Container(
                                width:40,
                                height: 40,
                                decoration:BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)
                          ),
          
                                  child: Icon(Icons.share_outlined),
                             ),
          
                              SizedBox(width: 20,),
                              Container(
                                  width:40,
                                  height: 40,
                                  decoration:BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20)
                                  ),
                                  child: Icon(Icons.favorite_border)),
          
          
          
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
          
                ],
              ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              //height: 500,
              child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
          
                  Row(//crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Product name",style: mTextStyle22(mFontWeight: FontWeight.bold,),),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Product amt",style: mTextStyle22(mFontWeight: FontWeight.bold,),),
                          SizedBox(
                            height: 5,
                          ),
                          Row(children: [
                            Text("ratings", style: mTextStyle14(mcolor: AppColors.secondary),),
                            Text("(reviews)",style: mTextStyle12(),),
          
                          ],)
          
                        ],
                      ),
                      Text('Seller Name:',style: mTextStyle18())
          
                    ],
                  ),
                  SizedBox(height: 10,),
                  Text("Color",style: mTextStyle18(mFontWeight: FontWeight.bold),),
                  Container(
                    height: 100,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: productColors.length,
                        itemBuilder: (_,index){
                          return Padding(
                            padding:  EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 25,
                              backgroundColor: productColors[index],
                            ),
                          );
          
                        }),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
          
                              onPressed: (){}, child: Text('Description',style: mTextStyle14(),),
                          style: ElevatedButton.styleFrom(backgroundColor: AppColors.secondary,),
                          ),
                        ),
                        SizedBox(width: 5,),
                        Expanded(
                          child: ElevatedButton(
          
                            onPressed: (){}, child: Text('Specifications',style: mTextStyle14(),),
                            style: ElevatedButton.styleFrom(backgroundColor: AppColors.secondary,),
                          ),
                        ),
                        SizedBox(width: 5,),
                        Expanded(
                          child: ElevatedButton(
          
                            onPressed: (){}, child: Text('Reviews',style: mTextStyle14(),),
                            style: ElevatedButton.styleFrom(backgroundColor: AppColors.secondary,),
                          ),
                        ),
                      ],
          
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      child: Container(
                        height: 80,
                        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(
                            width: 1,

                          )
                        ),
                        width: double.infinity,
                    child: Row(
                      children: [
                        Expanded(
                          flex:2,
                          child: Container(

                            decoration:BoxDecoration(
                              borderRadius:BorderRadius.circular(32),
                              border: Border.all(width: 1,color: Colors.white,)
                            ),
                            child:   Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                  Text(
                                    '1',
                                    style: TextStyle(color: Colors.white,fontSize: 20),
                                  ),
                                  Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 12,),
                        Expanded(
                          flex: 3,
                          child: Container(
                            height: 65,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.secondary,
                                ),
                                onPressed: (){}, child: Text("Add to Cart",style: mTextStyle18(mcolor: Colors.white),)),
                          ),
                        )
                      ],
                    )
                  ))
                ],
              ),
            ),
          
            ],
          ),
        ),
      ),
    );

  }
}
