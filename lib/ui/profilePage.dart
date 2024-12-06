import 'package:ecommerce/Appconstants/colors.dart';
import 'package:ecommerce/UserData/UserProfileBloc.dart';
import 'package:ecommerce/UserData/UserProfileState.dart';
import 'package:ecommerce/getAllOrderBloc/getALLorderBloc.dart';
import 'package:ecommerce/getAllOrderBloc/getAllOrderState.dart';
import 'package:ecommerce/utils/decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Appconstants/Theme_manager.dart';
import '../Appconstants/provider_image.dart';
import '../Login/logInPage.dart';
import '../UserData/UserProfileEvent.dart';
import '../getAllOrderBloc/getAllOrderEvent.dart';

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'OrderPage.dart';



class profilePage extends StatefulWidget {

  var  username;
  profilePage({ this.username});

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  static  File? imgfile;

  double slidervalue=10.0;
  List<Map<String, dynamic>> allnotes=[];
  List<Map<String, dynamic>> profileitems=[
    {
      "name":"Notification",
      "suffix_icon":Icon(Icons.arrow_forward_ios_outlined),
      "prefix_icon":Icon(Icons.notifications)
    },
    {
      "name":"Security",
      "suffix_icon":Icon(Icons.arrow_forward_ios_outlined),
      "prefix_icon":Icon(Icons.security),
    },

    {
      "name":"Language & Region",
      "suffix_icon":Icon(Icons.arrow_forward_ios_outlined),
      "prefix_icon":Icon(CupertinoIcons.globe),
    },
    {
      "name":"Go Premium",
      "suffix_icon":Icon(Icons.arrow_forward_ios_outlined),
      "prefix_icon":Icon(Icons.check_circle_rounded)
    },
    {
      "name":"Help Center",
      "suffix_icon":Icon(Icons.arrow_forward_ios_outlined),
      "prefix_icon":Icon(Icons.question_mark_rounded),
    },

  ];
  XFile? imgPicked;
  bool isCamera=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<UserProfileBloc>().add(GetUserProfileEvent());
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: SingleChildScrollView(
        child:
        BlocBuilder<UserProfileBloc,UserProfileState>(
          builder: (_,state){
            if(state is UserProfileLoadingState){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if(state is UserProfileErrorState){
              return Center(
                child: Text(state.errorMsg,style: mTextStyle18(mcolor: Colors.red),),
              );
            }
            if(state is UserProfileLoadedState){
              return   Column(
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          SizedBox(width: 15,),
                          InkWell(
                            onTap: (){
                              showModalBottomSheet(
                                //isDismissible: false,
                                //enableDrag: false,
                                  context: context,
                                  builder: (_) {
                                    return ShowModalBottom();
                                  });

                            },
                            child: CircleAvatar(
                                radius: 50,
                                backgroundImage:imgfile !=null? FileImage(imgfile!):null,
                              backgroundColor: Colors.blue,


                            ),
                          ),
                          SizedBox(width: 15,),

                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: [
                          Text(state.data.data!.name!.toUpperCase()),

                          //widget.username !=null?   Text(" ${widget.username}") :Text("user", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22 ),),
                          SizedBox(height: 13,),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.secondary,
                                  maximumSize: Size(200, 40),
                                  minimumSize: Size(150, 40),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),


                                  )
                              ),
                              onPressed: ()async{
                                SharedPreferences prefs=  await SharedPreferences.getInstance();
                                // prefs.setBool('isLoggedIn', false);
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>LogInPage()));
                              }, child: Text("Log out",style: TextStyle(color: Colors.white),)),
                          SizedBox(height: 13,),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.secondary,
                                  maximumSize: Size(150, 40),
                                  minimumSize: Size(150, 40),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),

                                  )
                              ),
            onPressed: () {
            final themeManager = Provider.of<Theme_manager>(context, listen: false);
            themeManager.changeTheme(!themeManager.getThemevalue()); // Toggle theme
            },
             child: Text("Change Theme",style: TextStyle(color: Colors.white),))
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          border: Border.all(
                              width: 2,
                              color: Colors.grey

                          )
                      ),
                      //margin: EdgeInsets.all(20),
                      padding: EdgeInsets.symmetric(horizontal: 19),
                      child:   InkWell(
                        child: ListTile(
                          leading: Icon(Icons.account_circle),
                          title: Text("My orders"),
                          trailing: Icon(Icons.arrow_forward_ios_outlined),
                        ),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>MyOrderPage()));
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                   Container(
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(13),
                           border: Border.all(
                               width: 2,
                               color: Colors.grey

                           )
                       ),
                       //margin: EdgeInsets.all(20),
                       padding: EdgeInsets.symmetric(horizontal: 19),
                     child:ListTile(
                       leading: Icon(Icons.mail),
                       title: Text(state.data.data!.email!,style: mTextStyle18(mFontWeight: FontWeight.w400),),
                     )
                   ),

                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            border: Border.all(
                                width: 2,
                                color: Colors.grey

                            )
                        ),
                       // margin: EdgeInsets.all(20),
                        padding: EdgeInsets.symmetric(horizontal: 19),
                        child:ListTile(
                          leading: Icon(Icons.phone),

                          title: Text(state.data.data!.mobile_number!),
                        )
                    ),

                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            border: Border.all(
                                width: 2,
                                color: Colors.grey

                            )
                        ),
                        //margin: EdgeInsets.all(20),
                        padding: EdgeInsets.symmetric(horizontal: 19),
                        child:ListTile(
                          leading: Icon(Icons.password),
                          title: Text(state.data.data!.password!,style: mTextStyle18(mFontWeight: FontWeight.w400),),
                        )
                    ),

                  ),
                ],
              );
            }
            return Container();
          },


        ),
      ),

    );

  }
  void getimg(bool camera)async{
    if(camera){
      imgPicked= await ImagePicker().pickImage(source: ImageSource.camera);
    }else{
      imgPicked= await ImagePicker().pickImage(source: ImageSource.gallery);
    }
    imgCrooper();
    if(imgPicked!=null) {


      Provider.of<taskprovider>(context,listen: false).setImage(File(imgPicked!.path));
    }
  }
  Widget ShowModalBottom(){
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              isCamera= true;
              getimg(isCamera);
              Navigator.pop(context);
            }, child: Text("Open Camera")),
            ElevatedButton(onPressed: (){
              isCamera=false;
              getimg(isCamera);
              Navigator.pop(context);
            }, child: Text("Open Gallery"))
          ]
      ),
    );
  }
  void imgCrooper()async{
    if(imgPicked!=null){
      CroppedFile? croppedFile= await ImageCropper().cropImage(sourcePath: imgPicked!.path,
          uiSettings: [
            AndroidUiSettings(
                toolbarTitle: "Cropper",
                toolbarColor: Colors.deepOrange,
                toolbarWidgetColor: Colors.white,
                aspectRatioPresets: [
                  CropAspectRatioPreset.original,
                  CropAspectRatioPreset.square,
                ]

            ),
            IOSUiSettings(
                title: "Cropper",
                aspectRatioPresets: [
                  CropAspectRatioPreset.original,
                  CropAspectRatioPreset.square
                ]
            ),
            WebUiSettings(context: context),

          ]);
      if(croppedFile!=null){
        imgfile=File(croppedFile.path);

        setState(() {

        });
      }
    }
  }


}


