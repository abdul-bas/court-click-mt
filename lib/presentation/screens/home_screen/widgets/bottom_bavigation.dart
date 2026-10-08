import 'package:court_click/core/theme/app_colors.dart';
import 'package:court_click/presentation/controllers/navigation_controller.dart';
import 'package:flutter/material.dart';

class HomeBottomNav extends StatelessWidget {
  HomeBottomNav({super.key});
  final NavigationController _controller = NavigationController();
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _controller,
      builder: (context, child) {
        return BottomNavigationBar(
          currentIndex: _controller.currentIndex,
          onTap: (value) {
            _controller.toggleIndex(value);
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.surface,
          selectedItemColor: AppColors.textPrimary,
          unselectedItemColor: AppColors.textMuted,
          selectedFontSize: 10,
          unselectedFontSize: 9,
          iconSize: 35,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(
              icon: Badge(
                backgroundColor: AppColors.avatarRed,
                label: Text(
                  '4',
                  style: TextStyle(color: AppColors.textPrimary),
                ),
                child: Icon(Icons.video_library_outlined),
              ),
              activeIcon: Icon(Icons.video_library),
              label: 'Coming Soon',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.file_download_outlined),
              activeIcon: Icon(Icons.file_download),
              label: 'Downloads',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'More'),
          ],
        );
      },
    );
  }
}
