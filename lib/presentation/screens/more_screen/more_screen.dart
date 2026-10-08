import 'package:court_click/core/constants/user_name.dart';
import 'package:court_click/core/constants/user_profile_data.dart';
import 'package:court_click/core/theme/app_colors.dart';
import 'package:court_click/presentation/controllers/navigation_controller.dart';
import 'package:court_click/presentation/screens/home_screen/widgets/bottom_bavigation.dart';
import 'package:court_click/presentation/screens/more_screen/widgets/manage_profiles.dart';
import 'package:court_click/presentation/screens/more_screen/widgets/menu_item.dart';
import 'package:court_click/presentation/screens/more_screen/widgets/my_list.dart';
import 'package:court_click/presentation/screens/more_screen/widgets/tell_friends_widget.dart';
import 'package:flutter/material.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key, required this.navigationController});

  final NavigationController navigationController;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: navigationController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  SizedBox(
                    height: 120,
                    width: double.infinity,
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      scrollDirection: Axis.horizontal,
                      itemCount: userProfileData.length,
                      itemBuilder: (context, index) {
                        final data = userProfileData[index];
                        double size;

                        if (index == 0) {
                          size = 65;
                        } else {
                          size = 55;
                        }
                        if (data.isEmpty) {
                          return Padding(
                            padding: const EdgeInsets.all(5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    border: Border.all(
                                      color: AppColors.textMuted,
                                      width: 1,
                                    ),
                                  ),
                                  width: 55,
                                  child: Icon(Icons.add_rounded),
                                ),
                                SizedBox(height: 28),
                              ],
                            ),
                          );
                        }
                        return Padding(
                          padding: const EdgeInsets.all(5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: size,
                                width: 68,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  image: DecorationImage(
                                    image: AssetImage(data['image'] as String),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                '${data['label']}',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 5),
                  manageProfiles(),
                  const SizedBox(height: 16),
                  tellFriends(),
                  myList(),
                  const SizedBox(height: 4),
                  menuItem('App Settings'),
                  menuItem('Account'),
                  menuItem('Help'),
                menuItem('Sign Out'),
                ],
              ),
            ),
          ),
          bottomNavigationBar: HomeBottomNav(controller: navigationController),
        );
      },
    );
  }

 
  

}
