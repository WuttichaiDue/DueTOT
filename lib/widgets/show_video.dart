import 'dart:io';
import 'dart:math';

import 'package:chewie/chewie.dart';
import 'package:dio/dio.dart';
import 'package:duetot/utility/my_style.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class ListVideo extends StatefulWidget {
  @override
  _ListVideoState createState() => _ListVideoState();
}

class _ListVideoState extends State<ListVideo> {
  // ! Field
  bool status = false;
  VideoPlayerController videoPlayerController;
  ChewieController chewieController;
  // ! Method

  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
    chewieController.dispose();
  }

  Widget showProcess() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(Colors.redAccent[400]),
          backgroundColor: Colors.yellowAccent[100],
          strokeWidth: 12.0,
        ),
      ],
    );
  }

  Future<void> recordVideo() async {
    await ImagePicker.pickVideo(source: ImageSource.camera).then((object) {
      uploadVideoToServer(object);
      setState(() {
        status = true;
      });
    });
  }

  Future<void> uploadVideoToServer(File file) async {
    String url = 'https://www.androidthai.in.th/tot/saveVideo.php';
    Random random = Random();
    int i = random.nextInt(10000);
    String nameVideo = 'video$i.mp4';

    try {
      Map<String, dynamic> map = Map();
      map['file'] = UploadFileInfo(file, nameVideo);
      FormData formData = FormData.from(map);
      await Dio().post(url, data: formData).then((response) {
        print(response);
        setState(() {
          status = false;
        });
      });
    } catch (e) {}
  }

  Widget modePlayVideo() {
    String url = 'https://www.androidthai.in.th/tot/Video/video867.mp4';
    videoPlayerController = VideoPlayerController.network(url);
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: false,
    );
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      child: Center(
        child: Chewie(
          controller: chewieController,
        ),
      ),
    );
  }

  Widget modeUpVideo() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      child: Stack(
        children: <Widget>[
          Center(
            child: RaisedButton.icon(
              icon: Icon(
                Icons.video_call,
                color: Colors.white,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0),
                  side: BorderSide(color: Colors.redAccent)),
              color: Colors.orangeAccent,
              onPressed: () {
                recordVideo();
              },
              label: Text(
                'Add Video.',
                style: MyStyle().serviceTitletextStyle,
              ),
            ),
          ),
          status ? showProcess() : SizedBox(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: MyStyle().containerDecoration,
      child: Column(
        children: <Widget>[
          modePlayVideo(),
          modeUpVideo(),
        ],
      ),
    );
  }
}
