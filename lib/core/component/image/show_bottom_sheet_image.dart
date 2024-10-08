import 'package:flutter/material.dart';
import 'package:perfection_structure/core/component/text/p_text.dart';
import 'package:perfection_structure/core/constants/app_colors.dart';
import 'package:perfection_structure/core/global/global_enum.dart';

class BottomSheetImage extends StatelessWidget {
  final dynamic controller;

  const BottomSheetImage({required this.controller});

  static void show(BuildContext context, dynamic controller) {
    double width = MediaQuery.of(context).size.width;
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 200,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PText(title:'Please Choose way', size:PSize.large),
                Container(
                  margin: const EdgeInsets.only(
                      left: 4, right: 4, top: 10, bottom: 10),
                  height: 1,
                  width: width,
                  color: AppColors.primaryColor,
                ),
                InkWell(
                  onTap: () async {
                    controller.gallery();
                  },
                  child: Container(
                    width: double.infinity,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.perm_media_outlined,
                        ),
                        SizedBox(width: 5),
                        PText(title:'From Gallery', size:PSize.large),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    controller.camera();
                  },
                  child: Container(
                    width: double.infinity,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.camera,
                        ),
                        SizedBox(width: 5),
                        PText(title:'From Camera', size:PSize.large),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
  // gallery() async {
  //   final imagePicker = ImagePicker();
  //   final image = await imagePicker.pickImage(source: ImageSource.camera);
  //   if (image != null) {
  //     file = File(image.path);
  //     imageName = basename(image.path);
  //     Get.back();
  //   } else {
  //     Get.snackbar('Error', 'no image selected');
  //   }
  //   update();
  // }

  // camera() async {
  //   final imagePicker = ImagePicker();
  //   final image = await imagePicker.pickImage(source: ImageSource.camera);
  //   if (image != null) {
  //     file = File(image.path);
  //     imageName = basename(image.path);
  //     Get.back();
  //   } else {
  //     Get.snackbar('Error', 'no image selected');
  //   }
  //   update();
  // }