
  import 'package:flutter/material.dart';

Padding profileButton() {
    return Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.add_circle,size: 60,)),
                 Text('Add Profile',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w300)) ],
                ),
              );
  }