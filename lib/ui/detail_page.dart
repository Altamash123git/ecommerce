import 'package:ecommerce/Appconstants/colors.dart';
import 'package:ecommerce/Models/productModel.dart';
import 'package:ecommerce/cart/CartState.dart';
import 'package:ecommerce/cart/cartBloc.dart';
import 'package:ecommerce/cart/cartEvent.dart';
import 'package:ecommerce/ui/nav_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Appconstants/cartPages.dart';
import '../Appconstants/customButton.dart';
import '../utils/CustomAvatar.dart';
import '../utils/decoration.dart';

/*
class DetailPage extends StatefulWidget {
  ProductModel currentProduct;
  DetailPage({required this.currentProduct});
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int qty=1;
  bool isLoading= false;
  List<Color> productColors = [
    Color(0xff901D30),
    Color(0xff151515),
    Color(0xff1d4491),
    Color(0xff90471e),
    Color(0xffd8d6d7),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        image: DecorationImage(
                            image: NetworkImage(
                               widget.currentProduct.imgUrl!,
                            ),
                            fit: BoxFit.contain),
                        color: AppColors.primaryColor),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 8.0),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Icon(Icons.arrow_back_ios_new_outlined)),
                          Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Icon(Icons.share_outlined),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20)),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.currentProduct.name!,
                              style: mTextStyle22(
                                mFontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              widget.currentProduct.price!,
                              style: mTextStyle22(
                                mFontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                  "ratings",
                                  style:
                                      mTextStyle14(mcolor: AppColors.secondary),
                                ),
                                Text(
                                  "(reviews)",
                                  style: mTextStyle12(),
                                ),
                              ],
                            )
                          ],
                        ),
                        Text('Seller Name:Tariqul Islam', style: mTextStyle18())
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Color",
                      style: mTextStyle18(mFontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: 100,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: productColors.length,
                          itemBuilder: (_, index) {
                            return Padding(
                              padding: EdgeInsets.all(8.0),
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
                              onPressed: () {},
                              child: Text(
                                'Description',
                                style: mTextStyle14(),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.secondary,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                'Specifications',
                                style: mTextStyle14(),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.secondary,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                'Reviews',
                                style: mTextStyle14(),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.secondary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        'Lorem ipsum is typically a corrupted version of De finibus bonorum et malorum altered, added, and\nremoved to make it nonsensical and improper Latin. '),

                    Positioned(
                        bottom: 10,
                        child: Container(
                            height: 80,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(40),
                                border: Border.all(
                                  width: 1,
                                )),
                            width: double.infinity,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(32),
                                        border: Border.all(
                                          width: 1,
                                          color: Colors.white,
                                        )),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Center(
                                            child: IconButton(
                                              onPressed: (){
                                                if(qty>1){
                                                  qty--;
                                                  setState(() {});
                                                }

                                              },
                                           icon:   Icon( Icons.remove,size: 20,),
                                              color: Colors.white,
                                              //size: 20,
                                            ),
                                          ),
                                          Text(
                                            '$qty',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                          IconButton(
                                            onPressed: (){
                                              qty++;
                                              setState(() {});
                                            },
                                         icon:   Icon( Icons.add,size: 20,),
                                            color: Colors.white,
                                            //size: 20,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 12,
                                ),

                                Expanded(
                                  flex: 3,
                                  child: BlocListener<CartBloc,CartState>(listener: (context,state){
                                    if(state is CartLoadingState){
                                      isLoading=true;
                                      setState(() {

                                      });
                                    }
                                    if (state is CartErrorState) {
                                      isLoading = false;
                                      setState(() {});
                                      ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text("${state.errorMsg}")));
                                    }

                                    if(state is CartLoadedState){
                                      Navigator.pop(context);
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Product added to cart",style: mTextStyle18(mcolor: Colors.green,mFontWeight: FontWeight.bold),)));
                                    }

                                  },
                                    child:   Container(
                                      height: 65,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: AppColors.secondary,
                                          ),
                                          onPressed: () {
                                            context.read<CartBloc>().add(AddToCartEvent(productId: int.parse(widget.currentProduct.id!), qty: qty));
                                          },
                                          child:
                                          isLoading? Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,

                                            children: [
                                              CircularProgressIndicator(),
                                              Text("Adding to Cart",
                                            style: mTextStyle18(
                                                mcolor: Colors.white),
                                          )
                                            ],
                                          ):
                                          Text(
                                            "Add to Cart",
                                            style: mTextStyle18(
                                                mcolor: Colors.white),
                                          )),
                                    ),
                                  )


                                )
                              ],
                            )))
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
*/
class DetailPage extends StatefulWidget {
  ProductModel currentProduct;

  DetailPage({required this.currentProduct});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int qty = 1;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xEFF5F5F5),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: CustumCircleActar(
                      icon: Icons.arrow_back_ios,
                      backgroundColor: Colors.white,
                      size: 60.0,
                    ),
                  ),
                  Row(
                    children: [
                      CustumCircleActar(
                        icon: Icons.share,
                        size: 60.0,
                        backgroundColor: Colors.white,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      CustumCircleActar(
                        icon: Icons.favorite_border,
                        size: 60.0,
                        backgroundColor: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Center(
              child: Container(
                height: 240,
                width: 200,
                child: Image.network(
                  widget.currentProduct.imgUrl!,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 400,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(31),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.currentProduct.name!,
                        style: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        '\$${widget.currentProduct.price}', // Display the price
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Seller: Tariqual isalm ',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            height: 20,
                            width: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: const Color(0xFFFF660E),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 12,
                                  color: Colors.white,
                                ),
                                Text(
                                  '4.8',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            '(320 Review)',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Color',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 50,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: AppConstants.colorData.length,
                          itemBuilder: (_, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  left: 5.0,
                                  right:
                                  index == AppConstants.colorData.length - 1
                                      ? 5
                                      : 0),
                              child: InkWell(
                                child: getColorToneWidget(
                                  // Use the correct key for product name
                                    AppConstants.colorData[index]
                                    ['color']), // Pass the price
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomButton(
                              width: 100,
                              height: 35,
                              text: 'Description',
                              textStyle: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                              onPressed: () {}),
                          // Text('Description'),
                          Text(
                            'Specifications',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            'Reviews',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                          'Lorem ipsum is typically a corrupted version of De finibus bonorum et malorum altered, added, and removed to make it nonsensical and improper Latin. '),
                      Expanded(child: Container()),
                      getAddCardButton(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getColorToneWidget(Color colorData) {
    return CircleAvatar(
      radius: 20, // Adjust size
      backgroundColor: colorData,
    );
  }

  Widget getCountWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 6.0),
      child: Container(
        width: 150,
        height: 35,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Colors.white)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: IconButton(
                  onPressed: () {
                    if (qty > 1) {
                      qty--;
                      setState(() {});
                    }
                  },
                  icon: Icon(
                    Icons.remove,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
              Text(
                '$qty',
                style: TextStyle(color: Colors.white),
              ),
              IconButton(
                onPressed: () {
                  qty++;
                  setState(() {});
                },
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getAddCardButton() {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        color: Colors.black,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            getCountWidget(),
            SizedBox(
              width: 20,
            ),
            Expanded(
                child:

                BlocListener<CartBloc, CartState>(
                  listener: (context, state) {
                    if (state is CartLoadingState) {
                      isLoading = true;
                      setState(() {});
                    }

                    if (state is CartErrorState) {
                      isLoading = false;
                      setState(() {});
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("${state.errorMsg}")));
                    }

                    if (state is CartLoadedState) {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder:(_)=> NavPage()));
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Product added successfully!!",style: mTextStyle12(mcolor: Colors.green),)));
                    }
                  },
                  child: CustomButton(
                      text: 'Add to Cart',
                      isLoading: isLoading,
                      loadingMsg: "Adding to Cart..",
                      textStyle: TextStyle(fontSize: 14, color: Colors.white),
                      onPressed: () {
                        context.read<CartBloc>().add(AddToCartEvent(
                            productId: int.parse(widget.currentProduct.id!),
                            qty: qty));
                      }),
                ))
          ],
        ),
      ),
    );
  }
}
