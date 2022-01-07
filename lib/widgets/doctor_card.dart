import 'package:auto_size_text/auto_size_text.dart';
import 'package:clinic_reservation_app/models/doctors.dart';
import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  final Doctor doctor;
  const DoctorCard({Key? key, required this.doctor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      margin: const EdgeInsets.only(
        bottom: 20,
      ),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            offset: const Offset(3, 3),
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AutoSizeText(
                doctor.name,
                maxLines: 1,
                style: Theme.of(context).textTheme.headline3,
              ),
              AutoSizeText(
                'Phone: ${doctor.phone}',
                maxLines: 1,
                style: const TextStyle(
                  fontSize: 18,
                  color: Color.fromRGBO(37, 41, 88, 1),
                ),
              ),
              AutoSizeText(
                'Position: ${doctor.position}',
                maxLines: 1,
                style: const TextStyle(
                  fontSize: 18,
                  color: Color.fromRGBO(37, 41, 88, 1),
                ),
              ),
              AutoSizeText(
                'Age: ${doctor.age}',
                maxLines: 1,
                style: const TextStyle(
                  fontSize: 18,
                  color: Color.fromRGBO(37, 41, 88, 1),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      offset: const Offset(2, 2),
                      blurRadius: 3,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset(
                    doctor.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.phone,
                      color: Color.fromRGBO(37, 41, 88, 1),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.email,
                      color: Color.fromRGBO(37, 41, 88, 1),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
