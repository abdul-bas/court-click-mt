import 'package:court_click/core/utils/handlers/coming_soon_state_handler.dart';
import 'package:court_click/presentation/bloc/coming_soon/comming_soon_bloc.dart';
import 'package:court_click/presentation/bloc/coming_soon/comming_soon_state.dart';
import 'package:court_click/presentation/controllers/comming_soon_controller.dart';
import 'package:court_click/presentation/controllers/navigation_controller.dart';
import 'package:court_click/presentation/screens/coming_soon_screen/widgets/notification_header.dart';
import 'package:court_click/presentation/screens/home_screen/widgets/bottom_bavigation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class ComingSoonScreen extends StatelessWidget {
  const ComingSoonScreen({
    super.key,
    required this.navigationController,
    required this.comingSoonController,
  });

  final NavigationController navigationController;
  final ComingSoonController comingSoonController;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: Listenable.merge([
        navigationController,
        comingSoonController, 
      ]),
      builder: (context, child) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: Column(
              children: [
                const NotificationHeader(),
                Expanded(
                  child: BlocBuilder<ComingSoonBloc, ComingSoonState>(
                    builder: (context, state) => comingSoonStateHandler(
                      state, // from the bloc, not the controller
                      comingSoonController,
                      context,
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: HomeBottomNav(controller: navigationController),
        );
      },
    );
  }
}