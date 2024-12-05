import 'dart:convert';
import 'dart:io';

//import 'package:api_bloc/api_exceptions.dart';
import 'package:ecommerce/Appconstants/keysConstant.dart';
import 'package:http/http.dart' as httpclient;
import 'package:shared_preferences/shared_preferences.dart';

import 'api_exception.dart';




class ApiHelper{

  Future<dynamic> getApi({required String url,bool isHeeaderrequired=true})async{
    var uri= Uri.parse(url);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString(AppKeyConstants.TokenKey) ?? "";


    try{
      var res= await httpclient.get(uri,headers:isHeeaderrequired ? {"authorization":" Bearer $token"}:null);
      print(" this is ${res.statusCode}");
      return returnJsonResponse(res);
    } on SocketException catch(e){
      throw(FetchDataException(errorMsg: "no internet"));
    }



  }
  Future<dynamic> PostApi({required String url,bool isHeaderrequired=true,
  Map<String,dynamic>? mBodyParams,
  })async{

    var uri= Uri.parse(url);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString(AppKeyConstants.TokenKey) ?? "";

    print(url);

    try{
      var res= await httpclient.post(uri,headers: isHeaderrequired?{"authorization":"Bearer $token"}
      :null,
        body: mBodyParams !=null? jsonEncode(mBodyParams):null,
      );

      return returnJsonResponse(res);
    } on SocketException catch(e){
      throw(FetchDataException(errorMsg: "no internet"));
    }



  }
  dynamic returnJsonResponse(httpclient.Response response){
    switch (response.statusCode){
      case 200:
        {
          var mdata = jsonDecode(response.body);
          return mdata;
        }
      case 400:
        throw BadRequestException(errorMsg: response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(errorMsg: response.body.toString());
      case 500:
      default :
        throw  FetchDataException(errorMsg: "error occured while communication with server with statuscode: ${response.statusCode}");
    }

  }
}

