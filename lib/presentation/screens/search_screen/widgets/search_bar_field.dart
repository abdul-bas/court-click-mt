
import 'package:flutter/material.dart';

class SearchBarField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final VoidCallback onClear;

  const SearchBarField({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      margin: const EdgeInsets.fromLTRB(0, 8, 0, 0),
      padding: const EdgeInsets.symmetric(horizontal: 14),
      color: const Color(0xFF3A3A3A),
      child: Row(
        children: [
          const Icon(Icons.search, color: Colors.white70, size: 22),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              style: const TextStyle(color: Colors.white, fontSize: 15),
              cursorColor: Colors.white,
              textInputAction: TextInputAction.search,
              decoration: const InputDecoration(
                hintText: 'Search for a show, movie, genre, e.t.c.',
                hintStyle: TextStyle(color: Colors.white54, fontSize: 14),
                border: InputBorder.none,
                isCollapsed: true,
              ),
            ),
          ),
          controller.text.isEmpty
              ? const Icon(Icons.mic, color: Colors.white70, size: 22)
              : GestureDetector(
                  onTap: onClear,
                  child: const Icon(
                    Icons.close,
                    color: Colors.white70,
                    size: 22,
                  ),
                ),
        ],
      ),
    );
  }
}