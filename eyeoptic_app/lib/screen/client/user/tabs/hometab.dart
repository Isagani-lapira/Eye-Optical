import 'package:eyeoptic_app/theme/colors.dart';
import 'package:eyeoptic_app/utils/string.dart';
import 'package:eyeoptic_app/widget/user_widget/servicelist.dart';
import 'package:eyeoptic_app/widget/viewablecard.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: size.height * 0.25,
          padding: const EdgeInsets.all(12.0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            color: AppColor.primaryColor,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('img/user_img/dentist_promo.jpg'),
            ),
          ),
          child: Stack(
            children: [
              SizedBox(
                width: size.width * 0.60,
                child: Text(
                  AppString.companySlogan,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8.0),
        Text('Our Services', style: Theme.of(context).textTheme.labelMedium),
        const SizedBox(height: 8.0),
        const ServiceTile(),
        Text('My Appointment', style: Theme.of(context).textTheme.labelMedium),
        const AppointmentList(),
      ],
    );
  }
}
