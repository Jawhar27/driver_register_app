  import 'dart:io';

import 'package:driver_register_app/app_colors.dart';
import 'package:driver_register_app/utils/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

Widget imageContainer(
      {XFile? image,
      void Function()? onTap,
      required String title,
      String? errorMsg,
      required BuildContext context,
      double? width}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Container(
            height: getDeviceHeight(context) * 0.15,
            width: width ?? getDeviceWidth(context) * 0.4,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  15.0,
                ),
                border: Border.all(
                  color: AppColors.borderGrey,
                )),
            child: image == null
                ? const Center(child: Text('No image selected'))
                : Image.file(
                    File(image.path),
                    fit: BoxFit.cover,
                  ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Visibility(
            visible:image==null && errorMsg != null,
            child: Text(
              errorMsg??'',
              style: const TextStyle(
                fontSize: 12.0,
                color: AppColors.red,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }