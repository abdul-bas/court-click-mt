import 'package:court_click/presentation/screens/bloc/home/home_states.dart';
import 'package:flutter/material.dart';

void characterStateHandler(
  HomeState state,
  BuildContext context,
) {
  if (state is CharactersLoading) {
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

  if (state is CharactersError) {
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

  if (state is CharactersLoaded) {
    Navigator.of(context).pop();
  }
}