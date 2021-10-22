import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:list_add_example/my_model.model.dart';
import 'package:list_add_example/second_page.dart';

class FirstPage extends StatefulWidget {
  final MyModel? myModel;
  const FirstPage({Key? key, this.myModel}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  List<MyModel> listModels = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: ListView.builder(
        itemCount: listModels.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(listModels[index].name),
            subtitle: Text(listModels[index].status.toString()),
            trailing: Text('${listModels[index].age}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add',
        child: const Icon(Icons.add),
        onPressed: () async {
          final resp = await Navigator.push(
            context,
            MaterialPageRoute<String>(
              builder: (BuildContext context) => SecondPage(),
              fullscreenDialog: true,
            ),
          );
          if (resp == null) return;
          listModels.add(MyModel.fromJson(json.decode(resp)));
          setState(() {});
        },
      ),
    );
  }
}
