import 'package:court_click/presentation/controllers/comming_soon_controller.dart';
import 'package:court_click/presentation/controllers/home_controllers.dart';
import 'package:court_click/presentation/controllers/navigation_controller.dart';
import 'package:court_click/presentation/controllers/search_controller.dart';
import 'package:court_click/presentation/screens/coming_soon_screen/coming_soon_screen.dart';
import 'package:court_click/presentation/screens/dowload_screen/dowload_screen.dart';
import 'package:court_click/presentation/screens/home_screen/home_screen.dart';
import 'package:court_click/presentation/screens/more_screen/more_screen.dart';
import 'package:court_click/presentation/screens/search_screen/search_screen.dart';
import 'package:flutter/material.dart';

final List<Map<String, dynamic>> navigationItems = [
  {
    'icon': Icons.home_outlined,
    'activeIcon': Icons.home,
    'label': 'Home',
    'navigation':
        (NavigationController controller, HomeController homeController) =>
            HomeScreen(
              navigationController: controller,
              homeController: homeController,
            ),
  },
  {
    'icon': Icons.search,
    'activeIcon': Icons.search,
    'label': 'Search',
    'navigation':
        (NavigationController controller, SearchHandler searchHandler) =>
            SearchScreen(
              navigationController: controller,
              searchHandler: searchHandler,
            ),
  },
  {
    'icon': Icons.video_library_outlined,
    'activeIcon': Icons.video_library,
    'label': 'Coming Soon',
    'badge': 4,
    'navigation': (NavigationController controller,ComingSoonController comingSoonController ) => ComingSoonScreen(navigationController: controller,comingSoonController:comingSoonController ,),
  },
  {
    'icon': Icons.file_download_outlined,
    'activeIcon': Icons.file_download,
    'label': 'Downloads',
    'navigation': (NavigationController controller) => DownloadsScreen(navigationController: controller,),
  },
  {
    'icon': Icons.menu,
    'activeIcon': Icons.menu,
    'label': 'More',
    'navigation': (NavigationController controller) => MoreScreen(navigationController: controller,),
  },
];
