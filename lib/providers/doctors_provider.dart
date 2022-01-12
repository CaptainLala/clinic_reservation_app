import 'package:clinic_reservation_app/models/doctors.dart';
import 'package:flutter/material.dart';

class DoctorsProvider with ChangeNotifier {
  final List<Doctor> _doctors = [
    Doctor(
      id: 1,
      username: 'sardar.dentist',
      image: 'assets/images/doctor_1.jpg',
      name: 'Dr. Sardar Kamal',
      age: 37,
      phone: '07701324567',
      position: 'Dentist',
    ),
    Doctor(
      id: 2,
      username: 'ahmed.surgeon',
      image: 'assets/images/doctor_2.jpg',
      name: 'Dr. Ahmed Kawa',
      age: 31,
      phone: '07702344567',
      position: 'Surgeon',
    ),
    Doctor(
      id: 3,
      username: 'tara.doctor',
      image: 'assets/images/doctor_3.jpg',
      name: 'Dr. Tara Jamal',
      age: 42,
      phone: '07705431787',
      position: 'Physician',
    ),
  ];
  List<Doctor> get items {
    return [..._doctors];
  }
}
