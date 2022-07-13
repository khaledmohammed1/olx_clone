import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../constance.dart';

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({Key? key}) : super(key: key);

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  File? _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print("No Image selected");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget _appbar(String title) {
      return AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: primaryColor,
          ),
          onPressed: () => Get.back(),
        ),
        title: Text(
          title,
          style:
              const TextStyle(color: primaryColor, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      );
    }

    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _appbar("UploadImage"),
          Column(
            children: [
              Stack(
                children: [
                  if (_image != null)
                    Positioned(
                      right: 0,
                      child: IconButton(
                        icon: const Icon(
                          Icons.clear,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _image = null;
                          });
                        },
                      ),
                    ),
                  SizedBox(
                    height: 120,
                    width: MediaQuery.of(context).size.width,
                    child: FittedBox(
                      child: _image == null
                          ? const Icon(
                              CupertinoIcons.photo_fill_on_rectangle_fill,
                              color: primaryColor,
                            )
                          : Image.file(_image!),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: Row(
                  children: [
                    Expanded(
                      child: NeumorphicButton(
                        style: const NeumorphicStyle(color: Colors.green),
                        child: const Text(
                          "Save",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: NeumorphicButton(
                        style: const NeumorphicStyle(color: Colors.red),
                        child: const Text(
                          "Cancel",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12, right: 12),
                      child: NeumorphicButton(
                        onPressed: getImage,
                        style: const NeumorphicStyle(color: primaryColor),
                        child: const Text(
                          "Upload Image",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          )
        ],
      ),
    );
  }
}
