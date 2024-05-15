import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:eyeoptic_app/model/appointmentmodel.dart';
import 'package:eyeoptic_app/model/servicemodel.dart';
import 'package:eyeoptic_app/services/appointment.dart';
import 'package:eyeoptic_app/services/auth.dart';
import 'package:eyeoptic_app/theme/colors.dart';
import 'package:eyeoptic_app/utils/const.dart';
import 'package:flutter/material.dart';

class ServiceView extends StatefulWidget {
  final ServiceModel model;
  const ServiceView({super.key, required this.model});

  @override
  State<ServiceView> createState() => _ServiceViewState();
}

class _ServiceViewState extends State<ServiceView> {
  late String _currentTimeSelected;
  final DateTime _initialDate = DateTime.now().add(const Duration(days: 1));
  late String _currentDateSelected;
  late bool _isLoading;
  @override
  void initState() {
    super.initState();
    _currentTimeSelected = '';
    _currentDateSelected = _initialDate.toString();
    _isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    AppointmentStore appointmentStore = AppointmentStore();
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 7;
    final double itemWidth = size.width / 2;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: (!_isLoading)
          ? Container(
              padding:
                  const EdgeInsets.only(left: 30.0, right: 30.0, top: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.model.name, style: theme.headlineSmall),
                  const SizedBox(height: 8.0),
                  Text(widget.model.description),
                  const SizedBox(height: 25.0),
                  Text('Set appointment', style: theme.labelMedium),
                  const SizedBox(height: 8.0),
                  DatePicker(
                    _initialDate,
                    initialSelectedDate: _initialDate,
                    selectionColor: AppColor.primaryColor,
                    height: 100.0,
                    onDateChange: (selectedDate) {
                      _currentDateSelected =
                          formattedDate(selectedDate.toString());
                      setState(() {
                        _currentDateSelected;
                      });
                    },
                  ),
                  const SizedBox(height: 25.0),
                  Text('Available time', style: theme.labelMedium),
                  const SizedBox(height: 8.0),
                  Expanded(
                    flex: 1,
                    child: StreamBuilder(
                        stream: appointmentStore.getAvailableTime(
                            formattedDate(_currentDateSelected)),
                        builder: ((context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(child: kLoader);
                          } else if (snapshot.hasError) {
                            return const Text(
                                "Error occured. Please try again later");
                          } else if (!snapshot.hasData ||
                              snapshot.data!.isEmpty) {
                            return const Text(
                                'No available time slots for this date.');
                          } else {
                            List<String> availableTimeSlots = snapshot.data!;
                            return GridView.count(
                              crossAxisCount: 3,
                              childAspectRatio: (itemWidth / itemHeight),
                              children: availableTimeSlots.map((timeSlot) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _currentTimeSelected = timeSlot;
                                    });
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                        color:
                                            (_currentTimeSelected == timeSlot)
                                                ? AppColor.primaryColor
                                                : null,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                            width: 1,
                                            color: AppColor.borderColor)),
                                    child: Center(
                                        child: Text(
                                      timeSlot,
                                      style: theme.bodyMedium!.copyWith(
                                          color:
                                              (_currentTimeSelected == timeSlot)
                                                  ? Colors.white
                                                  : null),
                                    )),
                                  ),
                                );
                              }).toList(),
                            );
                          }
                        })),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    width: size.width,
                    child: TextButton(
                      onPressed: () {
                        String uid = Auth.auth.currentUser!.uid;
                        String? email = Auth.auth.currentUser!.email;
                        AppointmentModel appointmentModel = AppointmentModel(
                          uID: uid,
                          serviceID: widget.model.id,
                          date: formattedDate(_currentDateSelected),
                          time: _currentTimeSelected,
                        );

                        appointmentStore.addAppointment(
                            appointmentModel, email!,
                            onFinished: () => Navigator.pop(context));
                      },
                      child: Text(
                        'Schedule now!',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            )
          : const Center(child: kLoader),
    );
  }

  String formattedDate(String date) {
    int spaceIndex = date.indexOf(' ');
    if (spaceIndex >= 0) {
      return date.substring(0, spaceIndex);
    }
    return date;
  }
}
