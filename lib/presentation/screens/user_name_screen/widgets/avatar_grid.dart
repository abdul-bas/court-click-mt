import 'package:court_click/core/constants/user_name.dart';
import 'package:court_click/presentation/widgets/avatar_widgets.dart';
import 'package:flutter/material.dart';

GridView avatarGrid() {
  return GridView.builder(
    physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 25,
      mainAxisSpacing: 25,
      childAspectRatio: 0.87,
    ),

    itemCount: avatarData.length,
    itemBuilder: (context, index) {
      final data = avatarData[index];
      if (data.isEmpty) return Container(width: 0,height: 0,);
      return AvatarWidget(data: data);
    },
  );
}
