import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  const Carousel({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CarouselState();
  }
}

class _CarouselState extends State<Carousel> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'assets/images/book_taxi.jpeg',
      'assets/images/Food_delivery.jpeg',
      'assets/images/Grocery_delivery.jpeg',
    ];

    final List list = [
      {
        'img': 'assets/images/book_taxi.jpeg',
        'title': 'Book Taxi',
        'subTitle':
            'Get a cab for every occasion. Book quickly, pay in app easily get there safety.'
      },
      {
        'img': 'assets/images/Food_delivery.jpeg',
        'title': 'Food Delivery Services',
        'subTitle':
            'Hungry? We have on-Demand Food Delivery Service delivering from local Restaurants nearby.'
      },
      {
        'img': 'assets/images/Grocery_delivery.jpeg',
        'title': 'Exclusive Deals',
        'subTitle':
            'Enjoy special discounts and exclusive deals when you order through our app. Save money on every delicious meal!'
      }
    ];

    final List<Widget> imageSliders = list
        .map(
          (item) => ClipRect(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 30,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(item['img']),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  item['title'],
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  item['subTitle'],
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        )
        .toList();

    return Column(
      children: [
        CarouselSlider(
          items: imageSliders,
          carouselController: _controller,
          options: CarouselOptions(
              height: 300,
              viewportFraction: 1,
              autoPlay: true,
              enlargeCenterPage: false,
              aspectRatio: 16 / 9,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: list.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 7.0,
                height: 7.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
