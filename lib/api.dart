import 'package:http/http.dart' as http;
import 'dart:convert';

Future loginUser(String email, String password,String tenant) async{
  String url= 'https://app.elektraweb.com/login';
  final response=await http.post(url,
  headers:{"Accept":"Application/json"},
  body:{'tenant':tenant,'email':email,'password':password,}
  );

  var convertedDatatoJson=jsonDecode(response.body);
  return convertedDatatoJson;

}