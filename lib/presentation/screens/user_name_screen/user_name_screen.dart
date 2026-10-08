import 'package:court_click/presentation/screens/user_name_screen/widgets/app_bar.dart';
import 'package:court_click/presentation/screens/user_name_screen/widgets/avatar_grid.dart';
import 'package:court_click/presentation/screens/user_name_screen/widgets/profile_button.dart';

import 'package:flutter/material.dart';

class UserNameScreen extends StatefulWidget {
  const UserNameScreen({super.key});

  @override
  State<UserNameScreen> createState() => _UserNameScreenState();
}

class _UserNameScreenState extends State<UserNameScreen> {
    @override
  void initState() {
    super.initState();
   // Future function to navigate to the next page
    Future.delayed(const Duration(seconds: 5), () {
      if (!mounted) return;

      Navigator.pushNamed(context, '/main');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: 0.8,
          child: Scaffold(
            // Users App Bar
            appBar: usersAppBar(),
            body: SafeArea(child: Column(children: [SizedBox(height: 16)])),
          ),
        ),

        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: Center(
              child: SizedBox(
                height: 500,
                width: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Avatar Grid
                    avatarGrid(),
                    
                    //Add  Brofile Button
                    profileButton(), SizedBox(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
