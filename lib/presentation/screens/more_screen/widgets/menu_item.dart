
  import 'package:flutter/material.dart';

Widget menuItem(String title) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 14, 12, 14),
        child: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 13),
        ),
      ),
    );
  }