import 'package:court_click/presentation/screens/bloc/home/home_states.dart';
import 'package:flutter/material.dart';
 void homeStateHandler(
  HomeState state,
  BuildContext context,
) {
  if (state is NowPlayingLoading) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  if (state is NowPlayingError) {
    Navigator.of(context).pop();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(state.message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  if (state is NowPlayingLoaded) {
    Navigator.of(context).pop();
  }
}