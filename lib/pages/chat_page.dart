import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final List<String> _messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: _isBotMessage(index)
                          ? Color.fromARGB(255, 190, 227, 244)
                          : Color.fromRGBO(
                              232, 151, 178, 1), // Use baby pink color here
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      _messages[index],
                      style: TextStyle(
                        color:
                            _isBotMessage(index) ? Colors.black : Colors.white,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      fillColor: const Color.fromARGB(255, 249, 206,
                          220), // Baby pink color for text field background
                      filled: true,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    _sendMessage();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _sendMessage() {
    String message = _messageController.text.trim();
    if (message.isNotEmpty) {
      setState(() {
        _messages.add('User: $message');
        // Simulate chatbot response (replace with actual logic)
        _messages.add('Chatbot: Bot response to "$message"');
      });
      _messageController.clear();
    }
  }

  bool _isBotMessage(int index) {
    // Simple logic to determine if the message at index is from the bot
    return index % 2 == 1;
  }
}
