import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthService{
  Dio dio = new Dio();
  
  login(username, password) async {
    try{
      return await dio.post(
        'https://topicos-backend-i.herokuapp.com/authenticate',
        data:  {"username": username, "password": password},
        options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e){
      Fluttertoast.showToast(
        msg: e.response.data['msg'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
        );
    }
  }
  addUser(username, password, email, firstname, lastname) async{
    try{
      return await dio.post(
          'https://topicos-backend-i.herokuapp.com/adduser',
          data:  {"username": username, "password": password, "email": email, "firstname": firstname, "lastname": lastname},
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e){
      Fluttertoast.showToast(
        msg: e.response.data['msg'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
        );
    }
  }
  getinfo(token) async {
    dio.options.headers['Authorization'] = 'Bearer $token';
    return await dio.get('https://topicos-backend-i.herokuapp.com/getinfo');
  }

  changePassword(username, oldpassword, newpassword) async{
    try{
        return await dio.post(
        'https://topicos-backend-i.herokuapp.com/changepassword',
        data:  {"username": username, "oldpassword": oldpassword, "newpassword": newpassword},
        options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e){
      Fluttertoast.showToast(
        msg: e.response.data['msg'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
        );
    }

  }

    changeName(username, firstname, lastname) async{
    try{
        return await dio.post(
        'https://topicos-backend-i.herokuapp.com/changename',
        data:  {"username": username, "firstname": firstname, "lastname": lastname},
        options: Options(
        contentType: Headers.formUrlEncodedContentType)
          
        );
    } on DioError catch (e){
      Fluttertoast.showToast(
        msg: e.response.data['msg'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
        );
    }

  }

  editPerformance(username, categoria, number ) async{
      return await dio.post(
        'https://topicos-backend-i.herokuapp.com/editperformance',
        data:  {"username": username, "categoria": categoria, "number": number.toString()},
        options: Options(
        contentType: Headers.formUrlEncodedContentType)
          
        );
  }

  addSuggest(token, categoria, pregunta, alternativa1, alternativa2, alternativa3, alternativa4 )async{
        dio.options.headers['Authorization'] = 'Bearer $token';
        dio.options.contentType = Headers.formUrlEncodedContentType;
        try{
          return await dio.post('https://topicos-backend-i.herokuapp.com/addsuggest',
          data:{ "categoria":categoria, "pregunta": pregunta, "alternativa1": alternativa1, "alternativa2":alternativa2,
          "alternativa3":alternativa3, "alternativa4":alternativa4 }
          );
        } on DioError catch (e){
            Fluttertoast.showToast(
            msg: e.response.data['msg'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
    }

  }

  curiosity() async {
          return await dio.get('https://topicos-backend-i.herokuapp.com/curiosidad');
  
  }

    news() async {
          return await dio.get('https://topicos-backend-i.herokuapp.com/noticias');
  
  }
}