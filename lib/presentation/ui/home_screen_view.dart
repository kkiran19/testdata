import 'package:flutter/material.dart';
import 'package:testdata/model/abstract_data_model_response.dart';
import 'package:testdata/presentation/ui/full_details_view.dart';
import 'package:testdata/presentation/widget/texteditor.dart';
import 'package:testdata/service/api.dart';

class HomeView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
 return HOmeViewState();
  }
}
class HOmeViewState extends State<HomeView>{
  late final List<AbstractDataResponse> listData;
  bool apiDataStatus=false;
  bool nameEditStatus=true;
  @override
  void initState() {
   
    super.initState();
getapiData();
  }
  getapiData()async{
   final result=await ApiService().getData();
   setState(() {
     listData=result;
     apiDataStatus=true;
   });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:apiDataStatus?
      SingleChildScrollView(child:
       Column(children: [
       
        ...listData.map((e) =>InkWell(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FullView(fullData: e,)));
          },
          child:Padding(padding: EdgeInsets.only(right: 5),child:
        SizedBox(
          height: 40,
          child:   Card(child:Center(child:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
         Expanded(child: Row(children: [
          Expanded(child:Text(e.name!)),
          InkWell(
            onTap: (){
           Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TextEditor(e.name!))).then((value) {
            if(value!=null){
 e.name=value;
            
            setState(() {
              
            });
            }
           
           });
            },
            child:  Icon(Icons.edit))

          ],) ),
          Expanded(child: 
          Text(e.email!)),
          InkWell(
            onTap: (){
              listData.remove(e);
              setState(() {
                
              });

            },
            child: Icon(Icons.delete),)
          
        ],)))))))
        
      ],)):
       const Center(child:CircularProgressIndicator()),
    );
  }
  showAlertDiolog(){

  }

}