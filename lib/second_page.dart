import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:list_add_example/my_model.model.dart';

class SecondPage extends StatefulWidget {
  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  MyModel myModel = MyModel(name: '', age: 0, status: false);

  bool stateInput = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Name',
                  ),
                  onChanged: (val) {
                    myModel.name = val;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Age',
                  ),
                  onChanged: (val) {
                    myModel.age = int.parse(val);
                  },
                ),
                const Text('State:'),
                Switch(
                  value: myModel.status,
                  onChanged: (val) {
                    myModel.status = val;
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context, myModel.toRawJson());
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
