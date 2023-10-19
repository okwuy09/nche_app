import 'package:flutter/material.dart';
import 'package:nche/widget/back_nav.dart';
import 'package:nche/widget/colors.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PhotoView extends StatelessWidget {
  final List<String> imageURL;
  const PhotoView({super.key, required this.imageURL});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: AppColor.white,
        surfaceTintColor: AppColor.white,
        automaticallyImplyLeading: false,
        shadowColor: AppColor.white,
        title: const BackNav(),
      ),
      body: Container(
        //height: size.height / 1.5,/
        alignment: Alignment.center,
        child: PhotoViewGallery.builder(
          scrollPhysics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          backgroundDecoration: BoxDecoration(color: AppColor.white),
          builder: (BuildContext context, int index) {
            return PhotoViewGalleryPageOptions(
              imageProvider: NetworkImage(imageURL[index]),
              initialScale: PhotoViewComputedScale.covered * 0.98,
            );
          },
          itemCount: imageURL.length,
          loadingBuilder: (context, event) => Center(
            child: SizedBox(
              width: 20.0,
              height: 20.0,
              child: CircularProgressIndicator(
                value: event == null
                    ? 0
                    : event.cumulativeBytesLoaded / event.expectedTotalBytes!,
              ),
            ),
          ),
          //backgroundDecoration: widget.backgroundDecoration,
          //pageController: widget.pageController,
          //onPageChanged: onPageChanged,
        ),
      ),
    );
  }
}
