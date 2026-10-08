import 'package:court_click/presentation/controllers/navigation_controller.dart';
import 'package:court_click/presentation/screens/home_screen/widgets/bottom_bavigation.dart';
import 'package:flutter/material.dart';


class DownloadsScreen extends StatelessWidget {
  const DownloadsScreen({super.key, required this.navigationController});

  final NavigationController navigationController;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: navigationController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),

                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Smart Downloads',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                  const SizedBox(height: 40),

               
                  const Text(
                    'Introducing Downloads For You',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),

                 
                  const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                    'Sit quam dui, vivamus bibendum ut. A morbi mi tortor ut '
                    'felis non accumsan accumsan quis. Massa, id ut ipsum '
                    'aliquam enim non posuere pulvinar diam.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 28),

              
                  Center(
                    child: Container(
                      width: 170,
                      height: 170,
                      decoration: const BoxDecoration(
                        color: Color(0xFF4A4A4A),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),

                  
                  SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0071EB),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      child: const Text(
                        'SETUP',
                        style: TextStyle(fontSize: 13, letterSpacing: 1.5),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),

                  
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4A4A4A),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 10,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                      child: const Text(
                        'Find Something to Download',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
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