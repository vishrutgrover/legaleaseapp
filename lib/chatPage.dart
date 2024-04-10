import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './navBar.dart';
import 'package:open_file/open_file.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  bool isLoading = false;
  final TextEditingController _message = TextEditingController();
  final List<Map<String, String>> _messages = [
    {"entity": "assistant", "message": "How may I help you today?"}
  ];

  Future<void> sendMessage(String messg) async {
    String url = "http://34.125.81.196:3000/chat";
    if (messg.isNotEmpty) {
      var requestBody = {"query": messg, "filename": "sample"};
      setState(() {
        isLoading = true;
      });
      try {
        var response = await http.post(
          Uri.parse(url),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(requestBody),
        );
        if (response.statusCode == 200) {
          // Response successful
          var documentDirectory =
              await getApplicationDocumentsDirectory(); // getting the document path of the device (phone)
          var filePath =
              '${documentDirectory.path}/generated_document.pdf'; // path where the document will be saved.
          var file = File(filePath); // created a file object.
          await file.writeAsBytes(response.bodyBytes);
          OpenFile.open(filePath);
        } else {
          print("Server error: ${response.statusCode}");
        }
      } catch (e) {
        print("An error occurred while downloading or opening the file: $e");
      } finally {
        if (mounted) {
          setState(() {
            isLoading = false;
          });
        }
      }
    } else {
      print("Message is empty.");
    }
  }

  void addMessages(String entity, String message) {
    setState(() {
      _messages.add({"entity": entity, "message": message});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      backgroundColor: Color.fromARGB(255, 170, 174, 255),
      body: SingleChildScrollView(
        reverse: true,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Builder(
                    builder: (context) {
                      return IconButton(
                          onPressed: () => Scaffold.of(context).openDrawer(),
                          icon: const Icon(
                            Icons.more_horiz,
                            size: 38,
                            color: Color(0xFFE9EAFF),
                          ));
                    },
                  )
                ],
              ),
              Expanded(
                // Chat Area container
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: Color(0xFFE9EAFF)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Chatroom
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        height: MediaQuery.sizeOf(context).height * 0.7,
                        child: ListView.builder(
                          itemCount: _messages.length,
                          itemBuilder: (context, index) {
                            return Align(
                              alignment:
                                  _messages[index]['entity'] == "assistant"
                                      ? Alignment.centerLeft
                                      : Alignment.centerRight,
                              child: Container(
                                padding: const EdgeInsets.all(15),
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 167, 171, 255),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.white30, blurRadius: 5),
                                    ],
                                    border: Border.all(
                                        width: 1.6, color: Colors.black87),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15))),
                                child: Text(
                                  _messages[index]['message']!,
                                  style: const TextStyle(
                                      fontSize: 16.5, color: Colors.black),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      // Message Input
                      SizedBox(
                          width: MediaQuery.sizeOf(context).width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 300,
                                height: 65,
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  controller: _message,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    filled: true,
                                    fillColor: Color.fromARGB(255, 119, 126, 255),
                                    hintText: "Ask LegalAI",
                                    hintStyle: const TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                  maxLines: null,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              IconButton(
                                  onPressed: () {
                                    sendMessage(_message.text);
                                    addMessages("user", _message.text);
                                    _message.clear();
                                  },
                                  icon: const Icon(
                                    Icons.send,
                                    color: Color.fromARGB(255, 119, 126, 255),
                                    size: 40,
                                  )),
                            ],
                          ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
