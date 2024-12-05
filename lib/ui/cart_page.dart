import 'package:ecommerce/Appconstants/cartPages.dart';
import 'package:ecommerce/Appconstants/colors.dart';
import 'package:ecommerce/Models/view_cart_model.dart';
import 'package:ecommerce/cart/cartBloc.dart';
import 'package:ecommerce/create_order/create_order_bloc.dart';
import 'package:ecommerce/create_order/create_order_state.dart';
import 'package:ecommerce/utils/decoration.dart';
import 'package:ecommerce/view_cart/ViewCartBloc.dart';
import 'package:ecommerce/view_cart/ViewCartEvent.dart';
import 'package:ecommerce/view_cart/ViewCartState.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Appconstants/customButton.dart';
import '../Appconstants/custom_circle_Avatar.dart';
import '../create_order/creater_order_event.dart';

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  num totalBill = 0.0;
  num subtotal = 0.0;
  num totalAfterCGST = 0.0;
  num totalAfterSGST = 0.0;
  double cgst = 0.12;
  double sgst = 0.20;
  num discountPer = 0.20;
  num totalDiscount = 0.0;


  @override
  void initState() {

    super.initState();
    context.read<ViewCartBloc>().add(ViewMyCartEvent());
  }
  final TextEditingController applyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xEFF5F5F5),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustumCircleAvatar(
                    icon: Icons.arrow_back,
                    backgroundColor: Colors.white,
                    size: 32,
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'My Cart',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                // Wrap ListView.builder in Expanded
                child:BlocBuilder<ViewCartBloc,ViewCartState>(builder:(context,state){
                  if(state is ViewCartLoadedState){
                    calculateSubtotal(state.mcart.data!);
                    return  Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: state.mcart.data!.length,
                            itemBuilder: (_, index) {
                             ViewCartDataModel product = state.mcart.data![index];
                              return getCartItemWidget(
                                imgUrl: product.image!,
                                //("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHr2p2HWSYxOJ4S0MiM7vdKrKHY0Lg0B0U8Q&s"),
                                productName: product.name!,
                                braandName: product.product_id.toString(),
                                price: product.price!,
                                quantity: product.quantity!
                              );
                            },
                          ),
                        ),

                        getTotalContainer(),
                        //getBillingContainer()
                      ],
                    );


                  }



                  return Container();
                } )
              ),
              SizedBox(
                height: 20,
              ),

            ],
          ),
        ),
      ),
    );

  }

  Widget getTotalContainer() {
    return BlocListener<CreateOrderBloc, CreateOrderState>(
      listener: (context, state) {
        if (state is CreateOrderSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Order placed successfully!')),
          );
          Navigator.pop(context); // Navigate to another screen if needed
        } else if (state is CreateOrderFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to place order: ${state.errorMsg}')),
          );
        }
      },
      child: BlocBuilder<ViewCartBloc, ViewCartState>(builder: (context,state){

        if(state is ViewCartLoadedState){
          calculateSubtotal(state.mcart.data!);

          return   Container(
            height: 340,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(31),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getTextfieldWidget(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Subtotal',
                        style:
                        TextStyle(fontSize: 18, color: const Color(0xFFA0A0A0)),
                      ),
                      Text(
                        '\$${subtotal.toStringAsFixed(2)}',
                        style: TextStyle(
                            fontSize: 18,
                            color: const Color(0xFF040D18),
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Discount (${discountPer*100}%)',
                        style:
                        TextStyle(fontSize: 18, color: const Color(0xFFA0A0A0)),
                      ),
                      Text(
                        '- \$${totalDiscount.toStringAsFixed(2)}',
                        style: TextStyle(
                            fontSize: 18,
                            color: const Color(0xFF040D18),
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tax(CGST - ${cgst*100}%)',
                        style:
                        TextStyle(fontSize: 18, color: const Color(0xFFA0A0A0)),
                      ),
                      Text(
                        '+ \$${totalAfterCGST.toStringAsFixed(2)}',
                        style: TextStyle(
                            fontSize: 18,
                            color: const Color(0xFF040D18),
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tax(SGST - ${sgst*100}%)',
                        style:
                        TextStyle(fontSize: 18, color: const Color(0xFFA0A0A0)),
                      ),
                      Text(
                        '+ \$${totalAfterSGST.toStringAsFixed(2)}',
                        style: TextStyle(
                            fontSize: 18,
                            color: const Color(0xFF040D18),
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Divider(
                      color:
                      Colors.grey, // You can change the color to suit your design
                      thickness: 2, // Adjust the thickness of the line
                      indent: 0, // Space before the divider starts
                      endIndent: 0, // Space after the divider ends
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style:
                        TextStyle(fontSize: 16, color: const Color(0xFF3A4147)),
                      ),
                      Text(
                        '\$${totalBill}',
                        style: TextStyle(
                            fontSize: 18,
                            color: const Color(0xFF040D18),
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),


                  SizedBox(height: 30),
                  Center(
                    child: CustomButton(
                      width: double.infinity,
                      text: 'Checkout',
                      textStyle: TextStyle(fontSize: 20, color: Colors.white),
                      onPressed: () {
                        final cartState = context.read<ViewCartBloc>().state;
                        if (cartState is ViewCartLoadedState) {
                          final products = cartState.mcart.data!.map((item) {
                            return OrderProduct(
                              productId: item.product_id!,
                              quantity: item.quantity!,
                            );
                          }).toList();

                          context.read<CreateOrderBloc>().add(CreateMyOrder(
                            products: products,
                            status: 1, // Set appropriate status based on your logic
                          ));
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        
        }
        return Container();
      })
      
    
    );
  }
  void calculateSubtotal(List<ViewCartDataModel> cartItems) {
    subtotal = 0.0;
    totalBill=0.0;
    for (var item in cartItems) {
      subtotal += double.parse(item.price!) * item.quantity!;
    }
    ////discount
    totalBill=subtotal-subtotal*discountPer;
    totalDiscount= subtotal*discountPer;

///tax
 totalAfterCGST=totalBill*cgst;
 totalBill+=totalAfterCGST;
 totalAfterSGST= totalBill*sgst;
 totalBill+=totalAfterSGST;

  }
 /* Widget gettotalContainer() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 11),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(31),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getTextfieldWidget(),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Subtotal',
                  style:
                  TextStyle(fontSize: 18, color: const Color(0xFFA0A0A0)),
                ),
                Text(
                  '\$${subtotal.toStringAsFixed(2)}',
                  style: TextStyle(
                      fontSize: 18,
                      color: const Color(0xFF040D18),
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Discount (${discountPer*100}%)',
                  style:
                  TextStyle(fontSize: 18, color: const Color(0xFFA0A0A0)),
                ),
                Text(
                  '- \$${totalDiscount.toStringAsFixed(2)}',
                  style: TextStyle(
                      fontSize: 18,
                      color: const Color(0xFF040D18),
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tax(CGST - ${cgst*100}%)',
                  style:
                  TextStyle(fontSize: 18, color: const Color(0xFFA0A0A0)),
                ),
                Text(
                  '+ \$${totalAfterCGST.toStringAsFixed(2)}',
                  style: TextStyle(
                      fontSize: 18,
                      color: const Color(0xFF040D18),
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tax(SGST - ${sgst*100}%)',
                  style:
                  TextStyle(fontSize: 18, color: const Color(0xFFA0A0A0)),
                ),
                Text(
                  '+ \$${totalAfterSGST.toStringAsFixed(2)}',
                  style: TextStyle(
                      fontSize: 18,
                      color: const Color(0xFF040D18),
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Divider(
                color:
                Colors.grey, // You can change the color to suit your design
                thickness: 2, // Adjust the thickness of the line
                indent: 0, // Space before the divider starts
                endIndent: 0, // Space after the divider ends
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style:
                  TextStyle(fontSize: 16, color: const Color(0xFF3A4147)),
                ),
                Text(
                  '\$${totalBill}',
                  style: TextStyle(
                      fontSize: 18,
                      color: const Color(0xFF040D18),
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: CustomButton(
                width: double.infinity,
                text: 'Checkout',
                textStyle: TextStyle(fontSize: 20, color: Colors.white),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
*/

  Widget getTextfieldWidget() {
    return TextField(
      controller: applyController,
      decoration: InputDecoration(
        hintText: 'Enter Discount Code',
        fillColor: const Color(0xD9F5F5F5),
        filled: true, // Ensures the background color is filled
        border: OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.transparent), // Makes border color transparent
          borderRadius:
          BorderRadius.circular(25), // Adjust the radius of the text field
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.transparent), // Focused border color is transparent
          borderRadius: BorderRadius.circular(
              25), // Same border radius for focused border
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.transparent), // Enabled border color is transparent
          borderRadius: BorderRadius.circular(
              25), // Same border radius for enabled border
        ),
        // Use `suffixIcon` to keep the "Apply" text visible all the time
        suffixIcon: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            'Apply',
            style: TextStyle(fontSize: 20, color: Colors.orange),
          ),
        ),
      ),
    );
  }

  Widget getCartItemWidget({
    required String imgUrl,
    required String productName,
    required String braandName,
    required String price,
    required int quantity
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(8.0),
      height: 130,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          getcardcontainer(imgUrl),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      productName,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.delete_outline,
                          color: Colors.red),
                    ),
                  ],
                ),
                Text(
                  braandName,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$$price',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    getCountWidget(quantity),
                  ],
                ),
              ],
            ),
          ),
          // Quantity Controls and Delete Icon
        ],
      ),
    );
  }

  Widget getCountWidget(int quantity) {
    return Padding(
      padding: const EdgeInsets.only(left: 6.0),
      child: Container(
        width: 100,
        height: 35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: const Color(0xEFF5F5F5),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Icon(
                  Icons.remove,
                  color: Colors.black,
                  size: 16,
                ),
              ),
              Text(
                '$quantity',
                style: TextStyle(color: Colors.black),
              ),
              Icon(
                Icons.add,
                color: Colors.black,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getcardcontainer(String imgUrl) {
    return Container(
      height: 100,
      width: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xEFF5F5F5),
      ),
      child: Center(
        child: Image.network(
          imgUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget getBillingContainer() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 11),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(31),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getTextfieldWidget(),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Subtotal',
                  style:
                  TextStyle(fontSize: 18, color: const Color(0xFFA0A0A0)),
                ),
                Text(
                  '\$${subtotal.toStringAsFixed(2)}',
                  style: TextStyle(
                      fontSize: 18,
                      color: const Color(0xFF040D18),
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Discount (${discountPer*100}%)',
                  style:
                  TextStyle(fontSize: 18, color: const Color(0xFFA0A0A0)),
                ),
                Text(
                  '- \$${totalDiscount.toStringAsFixed(2)}',
                  style: TextStyle(
                      fontSize: 18,
                      color: const Color(0xFF040D18),
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tax(CGST - ${cgst*100}%)',
                  style:
                  TextStyle(fontSize: 18, color: const Color(0xFFA0A0A0)),
                ),
                Text(
                  '+ \$${totalAfterCGST.toStringAsFixed(2)}',
                  style: TextStyle(
                      fontSize: 18,
                      color: const Color(0xFF040D18),
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tax(SGST - ${sgst*100}%)',
                  style:
                  TextStyle(fontSize: 18, color: const Color(0xFFA0A0A0)),
                ),
                Text(
                  '+ \$${totalAfterSGST.toStringAsFixed(2)}',
                  style: TextStyle(
                      fontSize: 18,
                      color: const Color(0xFF040D18),
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Divider(
                color:
                Colors.grey, // You can change the color to suit your design
                thickness: 2, // Adjust the thickness of the line
                indent: 0, // Space before the divider starts
                endIndent: 0, // Space after the divider ends
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style:
                  TextStyle(fontSize: 16, color: const Color(0xFF3A4147)),
                ),
                Text(
                  '\$${totalBill}',
                  style: TextStyle(
                      fontSize: 18,
                      color: const Color(0xFF040D18),
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: BlocListener<CreateOrderBloc,CreateOrderState>(
                listener: (c,state){
                  if(state is CreateOrderSuccessState ){
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Order Placed Successfully!!")));
                  }
                }
                ,
                child: CustomButton(
                  width: double.infinity,
                  text: 'Checkout',
                  textStyle: TextStyle(fontSize: 20, color: Colors.white),
                  onPressed: () {
                    final cartState = context.read<ViewCartBloc>().state;
                    if (cartState is ViewCartLoadedState) {
                      final products = cartState.mcart.data!.map((item) {
                        return OrderProduct(
                          productId: item.product_id!,
                          quantity: item.quantity!,
                        );
                      }).toList();

                      context.read<CreateOrderBloc>().add(CreateMyOrder(
                        products: products,
                        status: 1, // Set appropriate status based on your logic
                      ));
                    }

                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

