import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final String label;
  final String image;
  final String path;
  const ImageContainer(
      {Key? key, required this.label, required this.image, required this.path})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () {
          Navigator.pushNamed(context, path);
        },
        child: SizedBox(
          height: 150,
          width: 110,
          child: Stack(
            children: [
              Positioned(
                top: 30,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  width: 93,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        offset: const Offset(3, 3),
                        blurRadius: 5,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(
                        height: 35,
                      ),
                      AutoSizeText(
                        label,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        minFontSize: 11,
                        maxFontSize: 13,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 35,
                child: Container(
                  width: 73,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        offset: const Offset(3, 3),
                        blurRadius: 5,
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
      ),
    );
  }
}
