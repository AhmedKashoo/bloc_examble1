import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../Data/Model/api.dart';
import '../Data/Repo/Dio.dart';

class sear extends StatefulWidget {
  const sear({Key? key}) : super(key: key);

  @override
  State<sear> createState() => _searState();
}

class _searState extends State<sear> {
  @override
  void initState() {
    // TODO: implement initState
    d();
  }
  @override
  Widget build(BuildContext context) {
    var T=TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          RawAutocomplete(
            optionsBuilder: (TextEditingValue textEditingValue) {
              if (textEditingValue.text == '') {
                return const Iterable<String>.empty();
              }else{
                List<String> matches = <String>[];
                matches.addAll(apiTest!.cats.map((e) => e.name));

                matches.retainWhere((s){
                  return s.toLowerCase().contains(textEditingValue.text.toLowerCase());
                });
                return matches;
              }
            },

            onSelected: (String selection) {
              print('You just selected $selection');
            },

            fieldViewBuilder: (BuildContext context, TextEditingController textEditingController,
                FocusNode focusNode,
                VoidCallback onFieldSubmitted) {
              return TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder()
                ),
                controller: textEditingController,
                focusNode: focusNode,
                onSubmitted: (String value) {

                },
              );
            },

            optionsViewBuilder: (BuildContext context, void Function(String) onSelected,
                Iterable<String> options) {
              return Material(
                  child:SizedBox(
                      height: 200,
                      child:SingleChildScrollView(
                          child: Column(
                            children: options.map((opt){
                              return InkWell(
                                  onTap: (){
                                    onSelected(opt);
                                  },
                                  child:Container(
                                      padding: EdgeInsets.only(right:60),
                                      child:Card(
                                          child: Container(
                                            width: double.infinity,
                                            padding: EdgeInsets.all(10),
                                            child:Text(opt),
                                          )
                                      )
                                  )
                              );
                            }).toList(),
                          )
                      )
                  )
              );
            },
          ),
          SizedBox(height: 25,),


        ],
      ),
    );
  }
  ApiTest?apiTest;
  void d(){
    DioHelper.getData(url: 'rest.category/categories').then((value) {
      apiTest= ApiTest.fromJson(jsonDecode(value.data));

      print(value.data);
    });
  }
}
