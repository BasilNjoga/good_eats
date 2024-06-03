import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class FoodSlider extends StatefulWidget {
  const FoodSlider({super.key});

  @override
  State<FoodSlider> createState() => _FoodSliderState();
}

class _FoodSliderState extends State<FoodSlider> {
  final controller = CarouselController();
  var imageUrl = [
    "images/pizza.jpg",
    "images/pancakes.jpg",
    "images/wine.png",
  ];
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      carouselController: controller,
      itemCount: imageUrl.length,
      itemBuilder: (context, index, rlIndex) {
        return Padding(
          padding: const EdgeInsets.all(3.0),
          child: Stack(
            children : [ 
              
              Container(
              //width: 300,
              color: Colors.grey.shade300,
              child: Image.asset(imageUrl[index], width: 400, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Row (
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(onPressed: () => controller.nextPage(duration: const Duration(milliseconds: 500)), child: const Icon(Icons.arrow_back_ios,)),
                    ElevatedButton(onPressed: () => controller.previousPage(duration: const Duration(milliseconds: 500)), child: const Icon(Icons.arrow_forward_ios)),
              
                  ],),
              ),
            ),
          ]),
        );
      },
      options: CarouselOptions(
        height: 200,
        autoPlay: true,
        viewportFraction: 1)
      );
  }
}