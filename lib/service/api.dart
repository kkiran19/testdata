import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:testdata/model/abstract_data_model_response.dart';
class ApiService{
  final List<AbstractDataResponse> listData=[];
 Future<List<AbstractDataResponse>> getData() async{
    
    final restult=await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    List<dynamic> jsonData =json.decode(restult.body);
    for (var element in jsonData) {
      listData.add(AbstractDataResponse.fromJson(element));
    }
  return listData;


  }
}