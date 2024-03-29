// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:async';
import 'dart:io';

import 'package:bside_todolist/api/apiClient.dart';
import 'package:bside_todolist/common/components/ui/system/colors.dart';
import 'package:bside_todolist/common/provider/user.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';

class ImagePickerExample extends ConsumerStatefulWidget {
  const ImagePickerExample({
    super.key,
    this.title,
    required this.setPickedFile,
  });

  final String? title;
  final void Function(XFile) setPickedFile;

  @override
  ConsumerState<ImagePickerExample> createState() => _ImagePickerStateExample();
}

class _ImagePickerStateExample extends ConsumerState<ImagePickerExample> {
  List<XFile>? _mediaFileList;

  void _setImageFileListFromFile(XFile? value) {
    _mediaFileList = value == null ? null : <XFile>[value];
    print(_mediaFileList);
  }

  dynamic _pickImageError;
  bool isVideo = false;
  String? _retrieveDataError;

  final ImagePicker _picker = new ImagePicker();
  final TextEditingController maxWidthController = TextEditingController();
  final TextEditingController maxHeightController = TextEditingController();
  final TextEditingController qualityController = TextEditingController();

  Future<void> _onImageButtonPressed(
    ImageSource source, {
    required BuildContext context,
  }) async {
    if (context.mounted) {
      try {
        final XFile? pickedFile = await _picker.pickImage(
          source: source,
          imageQuality: 50,
        );

        if (pickedFile == null) return;

        widget.setPickedFile(pickedFile);

        setState(() {
          _setImageFileListFromFile(pickedFile);
          print(pickedFile.path);
        });
      } catch (e) {
        setState(() {
          _pickImageError = e;
        });
      }
    }
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void dispose() {
    maxWidthController.dispose();
    maxHeightController.dispose();
    qualityController.dispose();
    super.dispose();
  }

  Future<void> retrieveLostData() async {
    final LostDataResponse response = await _picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      isVideo = false;
      setState(() {
        if (response.files == null) {
          _setImageFileListFromFile(response.file);
        } else {
          _mediaFileList = response.files;
        }
      });
    } else {
      _retrieveDataError = response.exception!.code;
    }
  }

  @override
  Widget build(BuildContext context) {
    var user = ref.watch(userRiverProvider);
    print(user.value);
    String? profileUrl = user.value?.profileUrl;

    print('build image picker');
    print(user.value.toString());

    return Stack(
      children: [
        Container(
          width: 88,
          height: 88,
          child: (_mediaFileList ?? []).isEmpty
              ? profileUrl == null
                  ? Container(
                      width: 88,
                      height: 88,
                      decoration: BoxDecoration(
                        color: MyColors.cardStroke,
                        borderRadius: BorderRadius.all(
                          Radius.circular(100),
                        ),
                      ),
                    )
                  : CircleAvatar(
                      radius: 44,
                      backgroundImage: NetworkImage(profileUrl!),
                      backgroundColor: MyColors.cardStroke,
                    )
              : CircleAvatar(
                  radius: 44,
                  backgroundImage:
                      Image.file(File(_mediaFileList![0].path)).image,
                  backgroundColor: MyColors.cardStroke,
                ),
        ),
        Positioned(
          right: -17,
          bottom: -6,
          child: InkWell(
            splashColor: Colors.transparent,
            onTap: () {
              _onImageButtonPressed(ImageSource.gallery, context: context);
            },
            child: Container(
              width: 50,
              height: 50,
              child: Center(
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: OvalBorder(
                      side: BorderSide(width: 1, color: Color(0xFFEFEFEF)),
                    ),
                  ),
                  child: Icon(
                    Icons.edit,
                    color: MyColors.gray500,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
