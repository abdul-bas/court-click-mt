
  import 'package:flutter/material.dart';

Widget shareRow() {
    Widget divider() => Container(width: 1, height: 36, color: Colors.white24);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // WhatsApp
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: const Color(0xFF25D366),
            borderRadius: BorderRadius.circular(6),
          ),
          child: const Icon(Icons.phone, color: Colors.white, size: 20),
        ),
        divider(),
        // Facebook
        Container(
          width: 32,
          height: 32,
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            color: const Color(0xFF3B5998),
            borderRadius: BorderRadius.circular(6),
          ),
          child: const Text(
            'f',
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
              height: 1.1,
            ),
          ),
        ),
        divider(),
        // Gmail
        Container(
          width: 32,
          height: 32,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
          ),
          child: const Text(
            'M',
            style: TextStyle(
              color: Color(0xFFD93025),
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        divider(),
        // More
        const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.more_horiz, color: Colors.white, size: 20),
            Text(
              'More',
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
