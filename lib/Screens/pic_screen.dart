import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:image_downloader/image_downloader.dart';

class PicScreen extends StatefulWidget {
  String path;
  num height, width;
  String name;

  PicScreen(
      {super.key,
      required this.path,
      required this.height,
      required this.width,
      required this.name});

  @override
  State<PicScreen> createState() => _PicScreenState();
}

class _PicScreenState extends State<PicScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.white70,
            )),
        title: Text(
          widget.name,
          style: const TextStyle(
              color: Colors.white70, fontSize: 35, fontWeight: FontWeight.w400),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                try {
                  // Saved with this method.
                  var imageId = await ImageDownloader.downloadImage(widget.path,
                      destination: AndroidDestinationType.directoryDownloads
                        ..subDirectory("flutter_image.png"));
                  if (imageId == null) {
                    return;
                  }

                  // Below is a method of obtaining saved image information.
                  var fileName = await ImageDownloader.findName(imageId);
                  var path = await ImageDownloader.findPath(imageId);
                  var size = await ImageDownloader.findByteSize(imageId);
                  var mimeType = await ImageDownloader.findMimeType(imageId);
                } on PlatformException catch (error) {
                  print(error);
                }
              },
              icon: const Icon(
                Icons.download_outlined,
                color: Colors.white70,
                size: 30,
              ))
        ],
      ),
      body: InstaImageViewer(
        child: Image.network(
          widget.path,
          height: widget.height.toDouble(),
          width: widget.width.toDouble(),
        ),
      ),
    );
  }
}
