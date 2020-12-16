import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mi_comisariato/cons/colors.dart';
import 'package:video_player/video_player.dart';

class BannerSliderController extends GetxController {
  var sliderCurrent = 0.obs;
  var items = [].obs;
  VideoPlayerController videoController;
  String url;
  getElements() {
    switch (url) {
      case "1":
        items
          ..add(ItemBanner(
              url: "www.techslides.com/demos/sample-videos/small.mp4",
              isVideo: true))
          ..add(ItemBanner(
              url:
                  "https://extension.unh.edu/sites/default/files/styles/1x_blog_main/public/field/image/tomato-4241980_1920.jpg?itok=gIHk_sX0&timestamp=1578404553"))
          ..add(ItemBanner(
              url:
                  "https://extension.unh.edu/sites/default/files/styles/1x_blog_main/public/field/image/tomato-4241980_1920.jpg?itok=gIHk_sX0&timestamp=1578404553"));

        break;
      default:
    }
  }

  BannerSliderController({@required this.url});

  @override
  void onInit() {
    getElements();
    super.onInit();
  }
}

class BannerSlider extends StatelessWidget {
  final double sliderHeight;
  BannerSlider({Key key, this.sliderHeight = 200, @required this.c})
      : super(key: key);
  final BannerSliderController c;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Obx(
          () => CarouselSlider(
            options: CarouselOptions(
                height: sliderHeight,
                enableInfiniteScroll: false,
                viewportFraction: 1.0,
                onPageChanged: (index, reason) =>
                    c.sliderCurrent.value = index),
            items: c.items.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  if (i.isVideo) {
                    return Stack(
                      children: [
                        GestureDetector(
                          onTap: () {
                            print("play / pause");
                          },
                          child: VideoP(
                            videoPlayerController: VideoPlayerController.asset(
                                'assets/images/small.mp4'),
                          ),
                        )
                      ],
                    );
                  } else
                    return Center(
                        child: Image.network(i.url,
                            fit: BoxFit.cover, width: 1000));
                },
              );
            }).toList(),
          ),
        ),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: c.items.map((item) {
              int index = c.items.indexOf(item);
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: c.sliderCurrent.value == index
                      ? CustomColors.redMiComisariato.withOpacity(0.9)
                      : CustomColors.lightGrey,
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class ItemBanner {
  String id;
  String url;
  Function callback;
  bool isVideo;
  VideoPlayerController videoController;
  ItemBanner(
      {this.id,
      this.url,
      this.callback,
      this.isVideo = false,
      this.videoController});
}

class VideoP extends StatefulWidget {
  final VideoPlayerController videoPlayerController;

  VideoP({Key key, this.videoPlayerController}) : super(key: key);

  @override
  _VideoPState createState() => _VideoPState();
}

class _VideoPState extends State<VideoP> {
  @override
  void initState() {
    super.initState();
    this.initializePlayer();
  }

  @override
  void dispose() {
    widget.videoPlayerController.dispose();
    super.dispose();
  }

  Future<void> initializePlayer() async {
    await widget.videoPlayerController
      ..initialize().then((_) {
        widget.videoPlayerController.setVolume(0.0);
        widget.videoPlayerController.play();
        widget.videoPlayerController.setLooping(true);
        // Ensure the first frame is shown after the video is initialized
        setState(() {});
      });

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: widget.videoPlayerController != null &&
              widget.videoPlayerController.value.initialized
          ? VideoPlayer(widget.videoPlayerController)
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 20),
                Text('Loading'),
              ],
            ),
    );
  }
}
