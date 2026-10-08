 import 'package:court_click/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

AppBar usersAppBar() {
    return AppBar(backgroundColor: AppColors.background,
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