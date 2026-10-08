import 'dart:ui';

import 'package:court_click/presentation/screens/more_screen/widgets/share_row.dart';
import 'package:flutter/material.dart';

Widget tellFriends() {
    return Container(
      width: double.infinity,
      color: const Color(0xFF1A1A1A),
      padding: const EdgeInsets.fromLTRB(12, 18, 12, 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.chat_outlined, color: Colors.white, size: 22),
              SizedBox(width: 8),
              Text(
                'Tell friends about Netflix.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sit quam '
            'dui, vivamus bibendum ut. A morbi mi tortor ut felis non accumsan '
            'accumsan quis. Massa,',
            style: TextStyle(color: Colors.white, fontSize: 10, height: 1.4),
          ),
          const SizedBox(height: 14),
          const Text(
            'Terms & Conditions',
            style: TextStyle(
              color: Colors.white,
              fontSize: 9,
              decoration: TextDecoration.underline,
              decorationColor: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(child: Container(height: 30, color: Colors.black)),
              const SizedBox(width: 8),
              SizedBox(
                height: 30,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  child: const Text(
                    'Copy Link',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          shareRow(),
        ],
      ),
    );
  }