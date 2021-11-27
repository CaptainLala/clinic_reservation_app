import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final String label;
  final String image;
  const ImageContainer({Key? key, required this.label, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: SizedBox(
        height: 140,
        width: 110,
        child: Stack(
          children: [
            Positioned(
              top: 30,
              child: Container(
                width: 90,
                height: 110,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      offset: const Offset(2, 2),
                      blurRadius: 3,
                      spreadRadius: 3,
                    ),
                  ],
                ),
                child: Text(label),
              ),
            ),
            Positioned(
              left: 35,
              child: Container(
                width: 75,
                height: 80,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      offset: const Offset(2, 2),
                      blurRadius: 2,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Center(
                  child: Image.asset(
                    image,
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
