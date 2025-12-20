import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskBox extends StatelessWidget{
  const TaskBox({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(12)
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            CupertinoIcons.add
          )
          ],
      ),
    );
  }
}




      // child: const Text('아직 할 일이 없음'),