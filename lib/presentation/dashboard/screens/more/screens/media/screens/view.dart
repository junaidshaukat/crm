import 'package:flutter/material.dart';
import '/core/app_export.dart';

class ViewScreen extends StatefulWidget {
  final MediaData media;
  final String src;
  final String type;
  final int tag;
  const ViewScreen({
    super.key,
    required this.src,
    required this.tag,
    required this.type,
    required this.media,
  });

  @override
  State<ViewScreen> createState() => ViewScreenState();
}

class ViewScreenState extends State<ViewScreen> {
  late double volume = 1.0;
  late VideoPlayerController controller;
  bool isPlaying = false;
  bool isMuted = false;

  @override
  void initState() {
    super.initState();
    if (widget.type == "video") {
      controller = VideoPlayerController.networkUrl(Uri.parse(widget.src));
      FlutterVolumeController.addListener((v) {
        if (v <= 0) {
          setState(() {
            volume = v;
            isMuted = true;
            controller.setVolume(v);
          });
        } else {
          setState(() {
            volume = v;
            isMuted = false;
            controller.setVolume(v);
          });
        }
      });
      init().then((v) async {
        isMuted = widget.media.isMuted ?? false;
        await FlutterVolumeController.setMute(isMuted);
        controller.initialize().then((_) {
          setState(() {
            if (isMuted == true) {
              volume = 0.0;
              controller.setVolume(volume);
            } else {
              volume = 1.0;
              controller.setVolume(volume);
            }
          });
        });
      });
    }
  }

  @override
  void dispose() {
    if (widget.type == "video") {
      FlutterVolumeController.removeListener();
      controller.dispose();
    }
    super.dispose();
  }

  Future init() {
    return FlutterVolumeController.updateShowSystemUI(true).then((value) {
      return FlutterVolumeController.getVolume().then((v) {
        return v;
      }, onError: (err) {
        return 1.0;
      });
    }, onError: (err) {
      return 1.0;
    });
  }

  void setMute() {
    if (isMuted) {
      FlutterVolumeController.setMute(false).then((value) {
        setState(() {
          isMuted = false;
          controller.setVolume(1.0);
        });
      });
    } else {
      FlutterVolumeController.setMute(true).then((value) {
        setState(() {
          isMuted = true;
          controller.setVolume(0.0);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.type == "video") {
      return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: CustomImageView(
              imagePath: 'back'.icon.svg,
              width: 24.h,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: setMute,
                icon: Icon(
                  isMuted ? Icons.volume_off : Icons.volume_up,
                  color: appTheme.whiteA700,
                ),
              )
            ],
          ),
        ),
        body: Hero(
          tag: widget.tag,
          child: Center(
            child: controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: controller.value.aspectRatio,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: <Widget>[
                        VideoPlayer(controller),
                        GestureDetector(
                          onTap: () {
                            if (controller.value.isPlaying) {
                              controller.pause();
                            } else {
                              controller.play();
                            }
                          },
                          child: Container(
                            color: Colors.transparent,
                            child: Center(
                              child: Icon(
                                controller.value.isPlaying
                                    ? Icons.pause
                                    : Icons.play_arrow,
                                color: Colors.white,
                                size: 70.0,
                              ),
                            ),
                          ),
                        ),
                        VideoProgressIndicator(
                          controller,
                          allowScrubbing: true,
                        ),
                      ],
                    ),
                  )
                : const CircularProgressIndicator(),
          ),
        ),
      );
    } else if (widget.type == "image") {
      return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: CustomImageView(
              imagePath: 'back'.icon.svg,
              width: 24.h,
            ),
          ),
        ),
        body: Hero(
          tag: widget.tag,
          child: Center(
            child: Image.network(
              widget.src,
              fit: BoxFit.contain,
            ),
          ),
        ),
      );
    } else {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: SizedBox.shrink(),
      );
    }
  }
}
