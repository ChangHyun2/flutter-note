import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';

class PhotoScreen extends StatefulWidget {
  const PhotoScreen({
    super.key,
    required this.camera,
  });

  final CameraDescription camera;

  @override
  State<PhotoScreen> createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  var isLoadingCamera = true;
  var _image = null;
  var _selectedMode = [true, false];

  Future<String> getFilePath(String fileName) async {
    Directory appDocumentsDirectory =
        await getApplicationDocumentsDirectory(); // 1
    String appDocumentsPath = appDocumentsDirectory.path; // 2
    String filePath = '$appDocumentsPath/$fileName'; // 3

    return filePath;
  }

  getImages() async {
    String appDir =
        '/var/mobile/Containers/Data/Application/3FCC9B22-0A61-4018-B332-DC704A362019/Documents/camera/pictures';
  }

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.

    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
      enableAudio: false,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _selectedMode[0]
            ? Column(
                children: [
                  FutureBuilder<void>(
                    future: _initializeControllerFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return CameraPreview(_controller);
                      } else {
                        // Otherwise, display a loading indicator.
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                  FloatingActionButton(
                    // Provide an onPressed callback.
                    onPressed: () async {
                      // Take the Picture in a try / catch block. If anything goes wrong,
                      // catch the error.
                      try {
                        // Ensure that the camera is initialized.

                        var cameraPermission = await Permission.camera.status;

                        if (!cameraPermission.isGranted) {
                          print('not granted');
                          final result = await Permission.photos.request();

                          if (result.isPermanentlyDenied) {
                            await openAppSettings();
                          }
                        }

                        await _initializeControllerFuture;
                        var photoPermission = await Permission.photos.status;
                        print(photoPermission);
                        if (!photoPermission.isGranted) {
                          print('not granted');
                          final result = await Permission.photos.request();

                          if (result.isPermanentlyDenied) {
                            await openAppSettings();
                          }
                        }

                        // Attempt to take a picture and then get the location
                        // where the image file is saved.
                        final image = await _controller.takePicture();

                        print(image.path);
                        print(image.name);
                        print(image.mimeType);
                        final result = await ImageGallerySaver.saveImage(
                            await image.readAsBytes());
                        print(result);
                        setState(() {
                          _image = image;
                        });
                        if (!mounted) return;
                      } catch (e) {
                        // If an error occurs, log the error to the console.
                        print(e);
                      }
                    },
                    child: const Icon(Icons.camera_alt),
                  ),
                ],
              )
            : Expanded(
                child: CustomScrollView(
                  primary: false,
                  slivers: <Widget>[
                    SliverPadding(
                      padding: const EdgeInsets.all(20),
                      sliver: SliverGrid.count(
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 3,
                        children: <Widget>[
                          Image.file(File(
                              '/var/mobile/Containers/Data/Application/3FCC9B22-0A61-4018-B332-DC704A362019/Documents/camera/pictures/CAP_2B16BD07-CCBE-4235-ADFF-7757F56ECA4B.jpg')),
                          Container(
                            padding: const EdgeInsets.all(8),
                            color: Colors.green[200],
                            child: const Text('Heed not the rabble'),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            color: Colors.green[300],
                            child: const Text('Sound of screams but the'),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            color: Colors.green[400],
                            child: const Text('Who scream'),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            color: Colors.green[500],
                            child: const Text('Revolution is coming...'),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            color: Colors.green[600],
                            child: const Text('Revolution, they...'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
        Container(
          child: Column(
            children: [
              _selectedMode[0] ? Text('작성할 문제를 촬영해 주세요.') : Text(''),
              ToggleButtons(
                children: [
                  Text('촬영'),
                  Text('갤러리'),
                ],
                isSelected: _selectedMode,
                onPressed: (int index) {
                  setState(() {
                    // The button that is tapped is set to true, and the others to false.
                    for (int i = 0; i < _selectedMode.length; i++) {
                      _selectedMode[i] = i == index;
                    }
                  });
                },
              )
            ],
          ),
        )
      ],
    );
  }
}
