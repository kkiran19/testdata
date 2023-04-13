import 'package:flutter/material.dart';

class TextEditor extends StatelessWidget{
  String name;
  TextEditor(this.name);
  TextEditingController _controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        TextFormField(
          controller: _controller,
            decoration: InputDecoration(
              hintText: name
            ),
        ),
        ElevatedButton(onPressed: (){
          Navigator.of(context).pop('${_controller.text}');
        }, child: Text('Edit'))
      ],),
    );
  }
  
}