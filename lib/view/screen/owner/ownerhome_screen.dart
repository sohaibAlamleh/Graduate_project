import 'dart:async';
import 'dart:io';

import 'package:boat_rent_project/view/screen/auth/drawer/drawer_body.dart';
import 'package:boat_rent_project/view/screen/owner/drawer_owner.dart/Drawer_owner_body.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class OwnerHomeScreen extends StatefulWidget {
  final _drawerKey = GlobalKey<ScaffoldState>();
  OwnerHomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OwnerHomeScreenState createState() => _OwnerHomeScreenState();
}

class _OwnerHomeScreenState extends State<OwnerHomeScreen> {
  void _setImageFileListFromFile(XFile? value) {
    _imageFileList = value == null ? null : <XFile>[value];
  }

  dynamic _pickImageError;

  VideoPlayerController? _controller;
  VideoPlayerController? _toBeDisposed;
  String? _retrieveDataError;
  List<XFile>? _imageFileList;
  XFile? coverImage;
  List<XFile>? selectedImages;

  final ImagePicker _picker = ImagePicker();
  final TextEditingController maxWidthController = TextEditingController();
  final TextEditingController maxHeightController = TextEditingController();
  final TextEditingController qualityController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  Future<void> _onImageButtonPressed(ImageSource source,
      {BuildContext? context, bool isMultiImage = false}) async {
    if (isMultiImage) {
      await _displayPickImageDialog(context!,
          (double? maxWidth, double? maxHeight, int? quality) async {
        try {
          final List<XFile> pickedFileList = await _picker.pickMultiImage(
            maxWidth: maxWidth,
            maxHeight: maxHeight,
            imageQuality: quality,
          );
          setState(() {
            _imageFileList = pickedFileList;
            selectedImages = pickedFileList;
          });
        } catch (e) {
          setState(() {
            _pickImageError = e;
          });
        }
      });
    } else {
      await _displayPickImageDialog(context!,
          (double? maxWidth, double? maxHeight, int? quality) async {
        try {
          final XFile? pickedFile = await _picker.pickImage(
            source: source,
            maxWidth: maxWidth,
            maxHeight: maxHeight,
            imageQuality: quality,
          );
          setState(() {
            _setImageFileListFromFile(pickedFile);
            coverImage = pickedFile;
          });
        } catch (e) {
          setState(() {
            _pickImageError = e;
          });
        }
      });
    }
  }

  @override
  void deactivate() {
    if (_controller != null) {
      _controller!.setVolume(0.0);
      _controller!.pause();
    }
    super.deactivate();
  }

  @override
  void dispose() {
    maxWidthController.dispose();
    maxHeightController.dispose();
    qualityController.dispose();
    super.dispose();
  }

  Widget _previewImages() {
    final Text? retrieveError = _getRetrieveErrorWidget();
    if (retrieveError != null) {
      return retrieveError;
    }
    if (_imageFileList != null) {
      return Semantics(
        label: 'image_picker_example_picked_images',
        child: ListView.builder(
          key: UniqueKey(),
          itemBuilder: (BuildContext context, int index) {
            // Why network for web?
            // See https://pub.dev/packages/image_picker#getting-ready-for-the-web-platform
            return Semantics(
              label: 'image_picker_example_picked_image',
              child: Image.file(
                File(_imageFileList![index].path),
              ),
            );
          },
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 5),
          itemCount: _imageFileList!.length,
        ),
      );
    } else if (_pickImageError != null) {
      return Text(
        'Pick image error: $_pickImageError',
        textAlign: TextAlign.center,
      );
    } else {
      return const Text(
        'You have not yet picked an image.',
        textAlign: TextAlign.center,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        endDrawer: const DrawerOwnerBody(),

        //endDrawer: const DrawerOwnerBody(),

        appBar: AppBar(
          title: const Text("Add Boat"),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications_active, size: 30)),
            IconButton(
              icon: const Icon(
                Icons.segment,
                size: 30,
              ),
              onPressed: () {
                _scaffoldKey.currentState!.openEndDrawer();
              },
            ),
          ],
        ),
        body: Center(
            child: Container(
          padding: const EdgeInsets.all(15),
          height: double.infinity,
          child: ListView(children: [
            Form(
                key: _formKey,
                child: Column(children: [
                  // Cover Image
                  Container(
                      height: 200,
                      width: double.infinity,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(width: 3.0, color: Colors.white60),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5.0)),
                      ),
                      child: Center(child: _previewImages())), // Name
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(labelText: 'Title'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a Title';
                      }
                      return null;
                    },
                  ), //
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Upload Cover Image",
                            style: TextStyle(
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Colors.black),
                          ),
                          Semantics(
                            label: 'image_picker_example_from_gallery',
                            child: MaterialButton(
                              onPressed: () {
                                _onImageButtonPressed(ImageSource.gallery,
                                    context: context);
                              },
                              child: Container(
                                width: 30,
                                height: 30,
                                color:
                                    Get.isDarkMode ? Colors.red : Colors.blue,
                                child: const Icon(
                                  Icons.upload,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text("Upload multi Images"),
                          MaterialButton(
                            onPressed: () {
                              _onImageButtonPressed(
                                ImageSource.gallery,
                                context: context,
                                isMultiImage: true,
                              );
                            },
                            child: Container(
                              width: 30,
                              height: 30,
                              color: Get.isDarkMode ? Colors.red : Colors.blue,
                              child: const Icon(
                                Icons.upload,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ), // Description
                  TextFormField(
                    controller: _descriptionController,
                    decoration: const InputDecoration(labelText: 'Description'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a description';
                      }
                      return null;
                    },
                  ),
                ])),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MaterialButton(
                  onPressed: () {},
                  color: Get.isDarkMode ? Colors.red : Colors.blue,
                  minWidth: 120,
                  height: 40,
                  child: const Text("Cancel",
                      style: TextStyle(color: Colors.white)),
                ),
                MaterialButton(
                  color: Get.isDarkMode ? Colors.red : Colors.blue,
                  minWidth: 120,
                  height: 40,
                  child:
                      const Text("Post", style: TextStyle(color: Colors.white)),
                  onPressed: () async {
                    try {
                      // Get the image name from the text input
                      final imageName = _nameController.text;
                      // Use the `FirebaseStorage` to upload the image
                      final Reference storageReference =
                          FirebaseStorage.instance.ref().child(imageName);
                      final _CoverImage = File(coverImage!.path);
                      final UploadTask uploadTask =
                          storageReference.putFile(_CoverImage);
                      final snackBar = SnackBar(
                        content: const Text('Uploading'),
                        action: SnackBarAction(
                          label: 'Undo',
                          onPressed: () {
                            // Some code to undo the change.
                          },
                        ),
                      );
                      // Track the progress of the upload
                      final TaskSnapshot storageTaskSnapshot =
                          await uploadTask.whenComplete(() =>
                              // Show a snackbar to confirm the image was uploaded
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar));
                      // Get the URL of the uploaded image
                      final String imageUrl =
                          await storageTaskSnapshot.ref.getDownloadURL();
                    } catch (e) {
                      print(e.toString());
                      print("ERROR");
                    }
                  },
                ),
              ],
            )
          ]),
        )));
  }

  Text? _getRetrieveErrorWidget() {
    if (_retrieveDataError != null) {
      final Text result = Text(_retrieveDataError!);
      _retrieveDataError = null;
      return result;
    }
    return null;
  }

  Future<void> _displayPickImageDialog(
      BuildContext context, OnPickImageCallback onPick) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Add optional parameters'),
            content: Column(
              children: <Widget>[
                TextField(
                  controller: maxWidthController,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                      hintText: 'Enter maxWidth if desired'),
                ),
                TextField(
                  controller: maxHeightController,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                      hintText: 'Enter maxHeight if desired'),
                ),
                TextField(
                  controller: qualityController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      hintText: 'Enter quality if desired'),
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                  child: const Text('PICK'),
                  onPressed: () {
                    final double? width = maxWidthController.text.isNotEmpty
                        ? double.parse(maxWidthController.text)
                        : null;
                    final double? height = maxHeightController.text.isNotEmpty
                        ? double.parse(maxHeightController.text)
                        : null;
                    final int? quality = qualityController.text.isNotEmpty
                        ? int.parse(qualityController.text)
                        : null;
                    onPick(width, height, quality);
                    Navigator.of(context).pop();
                  }),
            ],
          );
        });
  }
}

typedef OnPickImageCallback = void Function(
    double? maxWidth, double? maxHeight, int? quality);
