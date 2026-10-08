import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  const new({
    super.key,
    required this.data,
  });

  final Map<String, String> data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      
             Container(
                height: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(data['image'] as String),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
        SizedBox(height: 8),
        Text(
          '${data['label']}',
          style: TextStyle(fontSize: 13,fontWeight: FontWeight.w300),
        ),
    
     ],
    );
  }
}