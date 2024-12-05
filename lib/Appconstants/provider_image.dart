import 'dart:io';

import 'package:flutter/foundation.dart';

//import 'db_helper.dart';
//import 'package:todo/db_helper.dart';

class taskprovider extends ChangeNotifier{
  File? selectedImage;
  File? get SelectedImage=>selectedImage;

  void setImage(File image){
    selectedImage=image;
    notifyListeners();
  }


  }
