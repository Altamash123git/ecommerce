import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/Appconstants/colors.dart';
import 'package:ecommerce/utils/custom%20widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController=TextEditingController();
  final List<String> imageUrls = [
   "https://i.pinimg.com/736x/68/8d/d3/688dd325dbbdc238f4b70caffe77a5af.jpg"
  ];
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
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Container(

                 height: 120,
                 child: ListView.builder(
                   scrollDirection: Axis.horizontal,
                     itemCount: 10,
                     itemBuilder: (c,i){
                   return Container(
                     padding: const EdgeInsets.all(8.0),
                     //height: 300,
                     child: Column(
                       children: [
                         CircleAvatar(
                           radius: 40,
                             backgroundColor: Colors.green,
                           
                         
                         ),
                         Text("Categories")
                       ],
                     ),
                   );
                 }),
               ),
             ),
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
         /*    GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemBuilder: (_,index){
               return CustomWidget(imgpath: "", title: "", amt: 0,isfavourite: true,);
             })
*/
        
             /* CarouselSlider(items:imageUrls.map((imageUrl) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(color: Colors.amber),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              );
            },
          );
        }).toList(), options: CarouselOptions(
          height: 400.0,
          autoPlay: true,
          enlargeCenterPage: true,
          aspectRatio: 16/9
          
        )),*/
        //Slider(value: value, onChanged: onChanged)
            ],
          ),
        ),
        ),
      ),
    );
  }
}
