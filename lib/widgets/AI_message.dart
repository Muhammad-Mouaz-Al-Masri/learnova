import 'package:flutter/material.dart';

class AIMessage extends StatelessWidget {
  AIMessage({super.key, required this.id, required this.message});
  int id;
  String message;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(message),
      color: id == 1 ? Colors.blue : Colors.purple,
    );
  }
}
