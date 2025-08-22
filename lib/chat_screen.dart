import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:record/record.dart';
import 'package:path_provider/path_provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];
  final ImagePicker _picker = ImagePicker();
  final Record _audioRecorder = Record();

  bool _isRecording = false;

  void _sendMessage(String text) {
    if (text.isNotEmpty) {
      setState(() {
        _messages.add({"type": "text", "data": text, "sender": "me"});
      });
      _controller.clear();
    }
  }

  Future<void> _pickImage() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      setState(() {
        _messages.add({"type": "image", "data": File(photo.path), "sender": "me"});
      });
    }
  }

  Future<void> _startRecording() async {
    if (await _audioRecorder.hasPermission()) {
      Directory tempDir = await getTemporaryDirectory();
      String path = '${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}.m4a';

      await _audioRecorder.start(path: path);
      setState(() {
        _isRecording = true;
      });
    }
  }

  Future<void> _stopRecording() async {
    final path = await _audioRecorder.stop();
    setState(() {
      _isRecording = false;
      if (path != null) {
        _messages.add({"type": "audio", "data": File(path), "sender": "me"});
      }
    });
  }

  Widget _buildMessage(Map<String, dynamic> message) {
    bool isMe = message['sender'] == "me";

    Widget content;
    if (message['type'] == "text") {
      content = Text(message['data']);
    } else if (message['type'] == "image") {
      content = Image.file(message['data'], width: 150, height: 150, fit: BoxFit.cover);
    } else if (message['type'] == "audio") {
      content = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.play_arrow, color: Colors.white),
          const SizedBox(width: 5),
          const Text("Voice Note", style: TextStyle(color: Colors.white)),
        ],
      );
    } else {
      content = const SizedBox.shrink();
    }

    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isMe ? Colors.red[300] : Colors.blue[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: content,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity! > 0) {
          Navigator.pushReplacementNamed(context, '/inbox_screen');
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            children: [
              const CircleAvatar(
                radius: 18,
                backgroundImage: AssetImage("assets/images/profile_image.png"),
              ),
              const SizedBox(width: 8),
              const Text(
                "Azaan",
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 4),
              const Icon(Icons.verified, color: Colors.blue, size: 18),
            ],
          ),
          actions: [
            IconButton(icon: const Icon(Icons.call, color: Colors.black), onPressed: () {}),
            IconButton(icon: const Icon(Icons.videocam, color: Colors.black), onPressed: () {}),
            IconButton(icon: const Icon(Icons.more_vert, color: Colors.black), onPressed: () {}),
          ],
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              child: const Column(
                children: [
                  Text("Keep it Halal!", style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text("Report any chats that cross the line", style: TextStyle(color: Colors.grey)),
                  SizedBox(height: 4),
                  Text("You matched ❤️", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return _buildMessage(_messages[index]);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  GestureDetector(
                    onLongPress: _startRecording,
                    onLongPressUp: _stopRecording,
                    child: Icon(
                      _isRecording ? Icons.mic_off : Icons.mic,
                      color: _isRecording ? Colors.red : Colors.black54,
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: "Type a message",
                        filled: true,
                        fillColor: Colors.grey[200],
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.camera_alt, color: Colors.black54),
                    onPressed: _pickImage,
                  ),
                  IconButton(
                    icon: const Icon(Icons.send, color: Colors.red),
                    onPressed: () => _sendMessage(_controller.text),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
