import 'package:court_click/core/utils/handlers/search_state_handlers.dart';
import 'package:court_click/presentation/controllers/navigation_controller.dart';
import 'package:court_click/presentation/controllers/search_controller.dart';
import 'package:court_click/presentation/screens/home_screen/widgets/bottom_bavigation.dart';
import 'package:court_click/presentation/screens/search_screen/widgets/search_bar_field.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    super.key,
    required this.navigationController,
    required this.searchHandler,
  });

  final NavigationController navigationController;
  final SearchHandler searchHandler;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: Listenable.merge([
        widget.navigationController,
        widget.searchHandler,
      ]),
      builder: (context, child) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: Column(
              children: [
                SearchBarField(
                  controller: _controller,
                  onChanged: (value) =>
                      widget.searchHandler.onChanged(value, context),
                  onClear: () =>
                      widget.searchHandler.clear(_controller, context),
                ),
                Expanded(
                  child: searchStateHandler(
                    widget.searchHandler.searchState,
                    context,
                    handler: widget.searchHandler,
                    query: _controller.text.trim(),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: HomeBottomNav(
            controller: widget.navigationController,
          ),
        );
      },
    );
  }
}