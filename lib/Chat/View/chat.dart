import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  _MyChatScreenState createState() => _MyChatScreenState();
}

class _MyChatScreenState extends State<ChatPage> {
  final List<String> _messages = []; // List to store messages

  final TextEditingController _textController = TextEditingController();

  void _handleSubmitted(String text) {
    _textController.clear(); // Clear the text field
    setState(() {
      _messages.insert(0, text); // Add the message to the list
    });
  }

  Widget _buildTextComposer() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              controller: _textController,
              onSubmitted: _handleSubmitted,
              decoration:
                  InputDecoration.collapsed(hintText: "What is on your mind?"),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send, color: Colors.orange), // Change the color of the icon to orange
            onPressed: () => _handleSubmitted(_textController.text),
          ),
        ],
      ),
    );
  }

  Widget _buildMessage(String message, bool isMe) {
    final index = _messages.indexOf(message);
    final previousMessage = index < _messages.length - 1 ? _messages[index + 1] : null;
    final isFirst = previousMessage == null || previousMessage != message;
    final color = isMe ? Colors.blue : Colors.grey[300];
    final alignment = isMe ? MainAxisAlignment.end : MainAxisAlignment.start;
    final borderRadius = isMe ? BorderRadius.only(
      topLeft: Radius.circular(16.0),
      bottomLeft: Radius.circular(16.0),
      bottomRight: Radius.circular(16.0),
    ) : BorderRadius.only(
      topRight: Radius.circular(16.0),
      bottomLeft: Radius.circular(16.0),
      bottomRight: Radius.circular(16.0),
    );
    return Row(
      mainAxisAlignment: alignment,
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(isMe ? 64.0 : 16.0, isFirst ? 16.0 : 8.0, isMe ? 16.0 : 64.0, 8.0),
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          decoration: BoxDecoration(
            color: color,
            borderRadius: borderRadius,
          ),
          child: Text(message, style: TextStyle(fontSize: 16.0)),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
        backgroundColor: Colors.amber,
        automaticallyImplyLeading: false, 
      ),
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildMessage(_messages[index], index % 2 == 0);
              },
            ),
          ),
          Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
            ),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }
}