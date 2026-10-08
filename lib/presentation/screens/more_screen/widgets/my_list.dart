import 'package:flutter/material.dart';

Widget myList() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.white24)),
      ),
      child: const Row(
        children: [
          Icon(Icons.check, color: Colors.white, size: 26),
          SizedBox(width: 10),
          Text('My List', style: TextStyle(color: Colors.white, fontSize: 13)),
        ],
      ),
    );
  }