
import 'package:flutter/material.dart';

Widget manageProfiles() {
  return const Center(
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.edit, color: Colors.white, size: 12),
        SizedBox(width: 6),
        Text(
          'Manage Profiles',
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
      ],
    ),
  );
}
