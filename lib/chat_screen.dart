import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:record/record.dart';
import 'package:audioplayers/audioplayers.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> _messages = []; // type + content

  final ImagePicker _picker = ImagePicker();
  final AudioRecorder _recorder = AudioRecorder();
  final AudioPlayer _player = AudioPlayer();

  bool _isRecording = false;

  // send text
  void _sendMessage() {
    if (_controller.text.trim().isNotEmpty) {
      setState(() {
        _messages.add({"type": "text", "data": _controller.text.trim()});
      });
      _controller.clear();
    }
  }

  // pick image
  Future<void> _pickImage(ImageSource source) async {
    final picked = await _picker.pickImage(source: source);
    if (picked != null) {
      setState(() {
        _messages.add({"type": "image", "data": picked.path});
      });
    }
  }

  // start recording
  Future<void> _startRecording() async {
    if (await _recorder.hasPermission()) {
      final path = "${Directory.systemTemp.path}/rec_${DateTime.now().millisecondsSinceEpoch}.m4a";
      await _recorder.start(const RecordConfig(), path: path);
      setState(() {
        _isRecording = true;
      });
    }
  }

  // stop recording
  Future<void> _stopRecording() async {
    final path = await _recorder.stop();
    if (path != null) {
      setState(() {
        _messages.add({"type": "audio", "data": path});
        _isRecording = false;
      });
    }
  }

  Widget _buildMessage(Map<String, dynamic> msg) {
    if (msg["type"] == "text") {
      return Align(
        alignment: Alignment.centerRight,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            msg["data"],
            style: const TextStyle(color: Colors.white),
          ),
        ),
      );
    } else if (msg["type"] == "image") {
      return Align(
        alignment: Alignment.centerLeft,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: Image.file(
            File(msg["data"]),
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
      );
    } else if (msg["type"] == "audio") {
      return Align(
        alignment: Alignment.centerLeft,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.mic, color: Colors.black54),
              const SizedBox(width: 8),
              IconButton(
                icon: const Icon(Icons.play_arrow),
                onPressed: () async {
                  await _player.play(DeviceFileSource(msg["data"]));
                },
              ),
            ],
          ),
        ),
      );
    }
    return const SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat"),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          // chat messages
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return _buildMessage(_messages[index]);
              },
            ),
          ),
          // input area
          SafeArea(
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.camera_alt, color: Colors.orange),
                  onPressed: () => _pickImage(ImageSource.camera),
                ),
                IconButton(
                  icon: const Icon(Icons.image, color: Colors.orange),
                  onPressed: () => _pickImage(ImageSource.gallery),
                ),
                IconButton(
                  icon: Icon(_isRecording ? Icons.stop : Icons.mic,
                      color: Colors.red),
                  onPressed: () {
                    if (_isRecording) {
                      _stopRecording();
                    } else {
                      _startRecording();
                    }
                  },
                ),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: "Type a message",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.orange),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
