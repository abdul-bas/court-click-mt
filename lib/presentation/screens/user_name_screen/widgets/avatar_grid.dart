
  import 'package:court_click/core/constants/user_name.dart';
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
                      return Column(
                        children: [
                        
                               Container(
                                  height: 100,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(data['image'] as String),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                          SizedBox(height: 8),
                          Text(
                            '${data['label']}',
                            style: TextStyle(fontSize: 13,fontWeight: FontWeight.w300),
                          ),
                      
                       ],
                      );
                    },
                  );
  }

 