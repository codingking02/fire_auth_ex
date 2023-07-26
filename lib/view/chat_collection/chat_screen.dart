import 'package:fire_auth_ex/view/chat_collection/chat_operation.dart';
import 'package:flutter/material.dart';

class Chat_Ui extends StatefulWidget {
  const Chat_Ui({super.key});

  @override
  State<Chat_Ui> createState() => _Chat_UiState();
}

class _Chat_UiState extends State<Chat_Ui> {
  String content = '';
  String idfrom = '';
  String idto = '';
  String type = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Product"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: "Content",
                    icon: Icon(
                      Icons.assignment,
                      color: Colors.red,
                    ),
                    fillColor: Colors.white,
                    labelStyle: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 2,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    setState(
                      () {
                        content = value;
                      },
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: "IdFrom",
                    icon: Icon(
                      Icons.assignment,
                      color: Colors.red,
                    ),
                    fillColor: Colors.white,
                    labelStyle: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 2,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    setState(
                      () {
                        idfrom = value;
                      },
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: "IdTo",
                    icon: Icon(
                      Icons.assignment,
                      color: Colors.red,
                    ),
                    fillColor: Colors.white,
                    labelStyle: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 2,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    setState(
                      () {
                        idto = value;
                      },
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Type",
                    icon: Icon(
                      Icons.assignment,
                      color: Colors.red,
                    ),
                    fillColor: Colors.white,
                    labelStyle: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 2,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    setState(
                      () {
                        type = value;
                      },
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    await ChatOperation().chat_operations(
                      content: content,
                      idfrom: idfrom,
                      idTo: idto,
                      type: type,
                    );
                  },
                  child: Text("Chat"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
