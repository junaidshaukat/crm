import 'package:flutter/material.dart';
import '/core/app_export.dart';

class ViewScreen extends StatefulWidget {
  const ViewScreen({super.key});

  @override
  State<ViewScreen> createState() => ViewScreenState();
}

class ViewScreenState extends State<ViewScreen> {
  late VideoPlayerController controller;
  double volume = 1.0;
  MediaData media = MediaData();
  bool isMuted = false;
  bool initialize = false;
  bool isPlaying = false;
  String? supported;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      media = Get.arguments;
      if (media.mediaType == "video") {
        isMuted = media.isMuted;
        Uri uri = Uri.parse(media.path);
        controller = VideoPlayerController.networkUrl(
          uri,
          videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
        );
        FlutterVolumeController.addListener(volumeListener);
        controller.initialize().then((_) {
          if (isMuted) {
            volume = 0.0;
            controller.setVolume(volume);
          }
          controller.setLooping(true);
          controller.play();
          valueListener();
          setState(() {
            initialize = true;
            isPlaying = true;
          });
        }, onError: (error) {
          console.log(error);
          setState(() {
            initialize = false;
            supported = "video_not_supported".tr;
          });
        });
        controller.addListener(() {
          setState(() {});
        });
      } else {
        setState(() {});
      }
    });
  }

  void valueListener() {
    setState(() {});
  }

  void volumeListener(double v) {
    setState(() {
      volume = v;
      isMuted = v <= 0;
      controller.setVolume(v);
    });
  }

  void toggleMute() {
    FlutterVolumeController.setMute(!isMuted).then((_) {
      setState(() {
        isMuted = !isMuted;
        volume = isMuted ? 0.0 : 1.0;
        controller.setVolume(volume);
      });
    });
  }

  void toggleVideoPlayback() {
    if (isPlaying) {
      controller.pause();
    } else {
      controller.play();
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  Widget controls() {
    if (isPlaying) return const SizedBox.shrink();
    return const Center(
      child: Icon(
        Icons.play_arrow,
        color: Colors.white,
        size: 100.0,
        semanticLabel: 'Play',
      ),
    );
  }

  Widget get child {
    if (media.mediaType == "image") {
      return CustomImageView(
        imagePath: media.path,
        fit: BoxFit.contain,
      );
    }

    if (media.mediaType == "video") {
      if (!initialize && supported == null) {
        return const CircularProgressIndicator();
      }

      if (!initialize && supported != null) {
        return Center(
          child: Text(
            "$supported",
            textAlign: TextAlign.center,
            style: CustomTextStyles.bodyLarge.copyWith(
              color: appTheme.whiteA700,
              fontSize: 28.fSize,
            ),
          ),
        );
      }

      return GestureDetector(
        onTap: toggleVideoPlayback,
        child: AspectRatio(
          aspectRatio: controller.value.aspectRatio,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              VideoPlayer(controller),
              controls(),
            ],
          ),
        ),
      );
    }

    return const CircularProgressIndicator();
  }

  @override
  void dispose() {
    super.dispose();
    if (media.mediaType == "video") {
      controller.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                media.name,
                overflow: TextOverflow.ellipsis,
                style: CustomTextStyles.titleLargeMedium,
              ),
            ),
            SizedBox(width: 8.h),
            if (media.mediaType == "video")
              IconButton(
                onPressed: toggleMute,
                icon: Icon(
                  isMuted ? Icons.volume_off : Icons.volume_up,
                  color: Colors.white,
                ),
              )
          ],
        ),
      ),
      body: Hero(
        tag: "${media.tagNumber}",
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
