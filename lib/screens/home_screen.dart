import 'package:auto_size_text/auto_size_text.dart';
import 'package:clinic_reservation_app/providers/user_provider.dart';
import 'package:clinic_reservation_app/screens/about_us_screen.dart';
import 'package:clinic_reservation_app/screens/doctors_screen.dart';
import 'package:clinic_reservation_app/screens/location_screen.dart';
import 'package:clinic_reservation_app/screens/monthly_board_screen.dart';
import 'package:clinic_reservation_app/screens/products_screen.dart';
import 'package:clinic_reservation_app/screens/request_appointment_screen.dart';
import 'package:clinic_reservation_app/widgets/category_card.dart';
import 'package:clinic_reservation_app/widgets/header_title.dart';
import 'package:clinic_reservation_app/widgets/image_container.dart';
import 'package:clinic_reservation_app/widgets/side_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);
  Future<dynamic> initRequest(context) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    final List<Future<dynamic>> promise = [
      Provider.of<UserProvider>(context, listen: false)
          .getUser(context, _prefs.getString('token')!)
    ];
    return Future.wait(promise);
  }

  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      drawer: const SideBar(),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
          icon: Icon(
            FontAwesomeIcons.bars,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white10,
        title: AutoSizeText(
          'Salahaddin Clinic',
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
      body: FutureBuilder<dynamic>(
        future: initRequest(context),
        builder: (context, snap) {
          if (snap.hasData) {
            return ListView(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 15,
              ),
              children: [
                AutoSizeText(
                  'Welcome to Salahaddin Clinic, Receive the Best with Us!',
                  style: Theme.of(context).textTheme.headline1,
                ),
                const Divider(
                  thickness: 1,
                ),
                const HeaderTitle(title: 'How Can We Help You?'),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    ImageContainer(
                      path: RequestAppointmentScreen.routeName,
                      label: 'Request Appointment',
                      image: 'assets/images/appointment.png',
                    ),
                    ImageContainer(
                      path: DoctorsScreen.routeName,
                      label: 'See Our Doctors',
                      image: 'assets/images/doctor.png',
                    ),
                  ],
                ),
                const HeaderTitle(title: 'Categories'),
                GridView(
                  padding: const EdgeInsets.only(
                    bottom: 10,
                  ),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height / 2.2),
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                  ),
                  children: const [
                    CategoryCard(
                      path: ProductsScreen.routeName,
                      title: 'Our Products',
                      image: 'assets/images/bottle.png',
                    ),
                    CategoryCard(
                      path: LocationScreen.routeName,
                      title: 'Our Location',
                      image: 'assets/images/location.png',
                    ),
                    CategoryCard(
                      path: AboutUsScreen.routeName,
                      title: 'Contact Us',
                      image: 'assets/images/contact.png',
                    ),
                    CategoryCard(
                      path: MonthlyBoardScreen.routeName,
                      title: 'Monthly Board',
                      image: 'assets/images/money_graph.png',
                    ),
                  ],
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
