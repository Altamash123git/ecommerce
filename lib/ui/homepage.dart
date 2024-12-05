import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/Appconstants/colors.dart';
import 'package:ecommerce/CategoryBloc/CategoryBloc.dart';
import 'package:ecommerce/CategoryBloc/CategoryEvent.dart';
import 'package:ecommerce/CategoryBloc/CategoryState.dart';
import 'package:ecommerce/Models/categoryModel.dart';
import 'package:ecommerce/Prouct_Boc/prodcutbloc.dart';
import 'package:ecommerce/Prouct_Boc/productState.dart';
import 'package:ecommerce/ui/detail_page.dart';
import 'package:ecommerce/utils/custom%20widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Models/productModel.dart';
import '../Prouct_Boc/productEvent.dart';

class HomePage extends StatefulWidget {


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  TextEditingController searchController=TextEditingController();
  final List<String> imageUrls = [
   "https://i.pinimg.com/736x/68/8d/d3/688dd325dbbdc238f4b70caffe77a5af.jpg"
  ];

  @override
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(GetAllProductEvent());
    context.read<CategoryBloc>().add(GetAllCategoryData());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:   SafeArea(
        child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
        
            children: [
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 13.0,vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: AppColors.primaryColor
                  //Colors.grey,
                ),
                child: Icon(Icons.window_outlined,color: Colors.black,size: 30,),
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                ),
                child: Icon(Icons.notification_important,color: Colors.black,size: 30,),
              )
            ],
          ),
        ),
        Padding(
        
        
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
        
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(21),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
        
              children: [
                SizedBox(
                  width: 5
                  ,
                ),
                Icon(Icons.search,size: 30,),
                SizedBox(
                  width: 5,
                ),
                Expanded(
        
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
        
                      hintText: "Search...",
        
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        //borderRadius: BorderRadius.circular(21)
                      )
                    ),
                  ),
                ),
        
               Row(
                 children: [
                   SizedBox(
        
                     child: Text("|",style: TextStyle(
                       fontSize: 30,
                     ),),
                   ),
                   SizedBox(
                     width: 5,
                   ),
        
                   Icon(Icons.sort)
                 ],
               )
              ],
            ),
        
          ),
          
        ),
             SizedBox(
               height: 19,
             ),
             Container(
               padding: EdgeInsets.symmetric(horizontal: 10),
         margin: EdgeInsets.symmetric(horizontal: 7),
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(21),
           image: DecorationImage(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCCq3RUiyESsXd16XLpMJsQKvRA6B8RJW2vw&s",),fit: BoxFit.cover),
        
         ),
         child: Padding(
           padding: const EdgeInsets.all(18.0),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text("Super Sale\nDiscount",style: TextStyle(
                 fontSize: 25,
                 fontWeight: FontWeight.bold,
               ),),
               Row(
                 children: [
                   Text("up to ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                   Text("50%",style: TextStyle(fontSize: 45,fontWeight: FontWeight.w900),),
        
                 ],
               ),
               ElevatedButton(
                   style: ElevatedButton.styleFrom(
                       backgroundColor: Colors.deepOrange
                   ),
                   onPressed: (){}, child: Text("Shop Now")),

        
        
             ],
        
           ),
         ),

             ),
             SizedBox(height: 20,),
          BlocBuilder<CategoryBloc,CategoryState>(builder:(_,state){
            if(state is CategoryLoadedState){
              return    Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(

                  height: 120,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.mdata!.data!.length,

                      itemBuilder: (c,index){
                        CategoryData mcat = state.mdata.data![index];
                        //CategoryModel data=
                        return Container(
                          padding: const EdgeInsets.all(8.0),
                          //height: 300,
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 40,
                                backgroundColor: Colors.green,
                                //backgroundImage: NetworkImage(mcat.),


                              ),
                              Text(mcat.name.toString())
                            ],
                          ),
                        );
                      }),
                ),
              );

            }

            return Container(
              child: Text("hulelele"),
            );
          } ),
             SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Special For You ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.start,),
                    Text("See all",style: TextStyle(color: Colors.blueAccent),)

                  ],
                ),
              ),
              Container(
                child: BlocBuilder<ProductBloc,ProductState>(builder:(_,state){
                  if(state is ProductErrorState){
                    Center(child: Text(state.errorMsg),);
                  }
                  else if(state is ProductLoadingState){
                    Center(child: CircularProgressIndicator(),);
                  }
                 else if(state is ProductLoadedState){
                    return Container(
                      //height: 200,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: GridView.builder(
                          itemCount: state.mData.data!.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),

                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 11,
                            crossAxisSpacing: 11,
                            //mainAxisExtent: 200,

                            childAspectRatio: 1.5 / 2,
                          ), itemBuilder: (c,index){
                        ProductModel cardData = state.mData.data![index];

                        return  InkWell(
                            onTap: (){
                              
                              Navigator.push(context, MaterialPageRoute(builder: (_)=>DetailPage(currentProduct: cardData)));
                            },
                            child: getCategoriesWidget(cardData.imgUrl!, // Use the correct key for image URL
                            cardData.name!, // Use the correct key for product name
                        cardData.price!,));

                            //CustomWidget(imgpath: cardData.imgUrl!, title: cardData.name!, amt: cardData.price!,isfavourite: true,));




                                           }),
                    );
                  }

                  return Container(
                    child: Text("hlo"),
                  );
                }),
              ),

            ],
          ),
        ),
        ),
      ),
    );
  }
  Widget getCategoriesWidget(String imgUrl, String title, String price) {
    return Container(
      height: 100,
      width: 200,
      child: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(21),
              color: const Color(0xFFF5F5F5),
              image: DecorationImage(
                image: NetworkImage(imgUrl), // Use AssetImage for local images
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Overlay with text
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(21),
              gradient: LinearGradient(
                colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          // Top-right container with wishlist icon
          Positioned(
            right: 0,
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(21),
                  bottomLeft: Radius.circular(5),
                ),
                color: const Color(0xFFFF660E),
              ),
              child: Icon(
                Icons.favorite_border,
                color: Colors.white,
                size: 18,
              ),
            ),
          ),
          // Centered text
          Positioned(
            bottom: 8,
            left: 8,
            right: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '\$${price}', // Display the price
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

//getcontainer
}
