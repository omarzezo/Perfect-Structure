import 'package:flutter/material.dart';
import 'package:perfection_structure/core/component/text/p_text.dart';
import 'package:perfection_structure/core/constants/app_colors.dart';
import 'package:perfection_structure/core/global/global_enum.dart';
import 'show_bottom_sheet_image.dart';

class TakeImageLayout extends StatelessWidget {
  final String text;
  final dynamic controller;
  final BuildContext context;
  final double width;
  final double height;

  const TakeImageLayout(
      {required this.text,
      required this.controller,
      required this.context,
      required this.width,
      required this.height});

  @override
  Widget build(BuildContext context) {
    return controller.imageName == ''
        ? GestureDetector(
            onTap: () {
              BottomSheetImage(
                controller: controller,
              );
            },
            child: Container(
              width: width - 20,
              height: height * 0.35,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(width: 3, color: AppColors.primaryColor),
              ),
              child: Column(
                children: [
                  SizedBox(
                      height: height * 0.3,
                      child: const Icon(
                        Icons.add_a_photo,
                        size: 100,
                        color: AppColors.primaryColor,
                      )),
                  PText(title:text, size:PSize.large),
                ],
              ),
            ),
          )
        : Container(
            alignment: Alignment.topRight,
            height: height * 0.35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 2, color: AppColors.primaryColor),
              image: DecorationImage(
                  image: FileImage(controller.file), fit: BoxFit.fill),
            ),
            child: GestureDetector(
              onTap: () {
                controller.clearImage();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Icon(
                      Icons.close,
                      size: 35,
                      color: AppColors.primaryColor,
                    ),
                    Text(
                      'remove',
                      style: const TextStyle(
                          color: AppColors.primaryColor, fontSize: 16),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
