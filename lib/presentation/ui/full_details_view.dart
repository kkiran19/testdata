
import 'package:flutter/material.dart';
import 'package:testdata/model/abstract_data_model_response.dart';

class FullView extends StatelessWidget{
  AbstractDataResponse fullData;
  FullView({required this.fullData});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text(fullData.name!),
        Text(fullData.email!),
        Text(fullData.address!.street!)

      ],),
    );
  }
}