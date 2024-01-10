import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImageCarouselSlider extends StatelessWidget {
  List<Image> images;

  ImageCarouselSlider({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    print('render carousel');
    print(images);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: images
            .map<Widget>((image) => Container(
                width: MediaQuery.of(context).size.width, child: image))
            .toList(),
      ),
    );
    return CarouselSlider(
      options: CarouselOptions(
        height: 360.0,
      ),
      items: images.map((image) {
        print(image);
        return Builder(
          builder: (BuildContext context) {
            return image;
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(color: Colors.transparent),
              child: image,
            );
          },
        );
      }).toList(),
    );
  }
}
