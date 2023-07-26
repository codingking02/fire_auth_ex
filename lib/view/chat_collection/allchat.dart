import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_auth_ex/view/chat_collection/chat_screen.dart';
import 'package:flutter/material.dart';

class AllChat extends StatelessWidget {
  const AllChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Chat_Ui();
                  },
                ),
              );
            },
            icon: Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection("chat").snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Content : ${snapshot.data!.docs[index]["content"]}",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "From : ${snapshot.data!.docs[index]["IdFrom"]}",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "To : ${snapshot.data!.docs[index]["IdTo"]}",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Type : ${snapshot.data!.docs[index]["Type"]}",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        const Divider(
                          thickness: 5,
                          color: Colors.black,
                        ),
                      ],
                    );
                  },
                );
              } else {
                return Text("No Chat To Be Shown");
              }
            },
          ),
        ),
      ),
    );
  }
}
