 import 'package:flutter/material.dart';

AppBar usersAppBar() {
    return AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            leading: SizedBox(),
            title: Container(
              height: 40,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/logos/logo.png'),
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
              ),
            ],
          );
  }