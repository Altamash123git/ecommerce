import 'package:ecommerce/Appconstants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomWidget extends StatefulWidget {
  double mwidth;
  String imgpath;
  bool isfavourite;
  String title;
  num amt;
  //bool isrecentlyadded;

  double mheight;

  CustomWidget({ required this.imgpath , this.mwidth=200, this.mheight=350,  this.isfavourite=false, required this.title,required this.amt});


  @override
  State<CustomWidget> createState() => _CustomWidgetState();
}

class _CustomWidgetState extends State<CustomWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: widget.mwidth,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(image: NetworkImage(widget.imgpath,),fit: BoxFit.cover)
              ),
            ),
            widget.isfavourite? Align(child: Container(
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(8))
                ),
                child: Icon(Icons.favorite_border,color: Colors.white,size: 60,)),
              alignment: Alignment.topRight,
            ):Container(),
            Positioned(
              bottom: 0,
              right: 100,
              child: Align(
                //alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.title),
                      SizedBox(height: 10,),
                      Text(widget.amt.toString())
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      
      ),
    );
  }
}


/*
class _customWidgetState extends State<customWidget> {
  @override

  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: widget.mwidth,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              image: DecorationImage(image: AssetImage(widget.imgpath),fit: BoxFit.cover)

            ),
          ),
          widget.isnetflix? Image.asset("assets/img/netflix_logo.png", width: 40, height: 40,):Container(),
          widget.isrecentlyadded? Align(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              width: 100,

              child: Text("Recently added", textAlign: TextAlign.center,style: TextStyle(fontSize:12,color: Colors.white, fontWeight: FontWeight.bold),),),
              alignment: Alignment.bottomCenter,

            ):Container(),

        ],
      ),
    );
  }
}*/