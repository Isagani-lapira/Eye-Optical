import 'package:eyeoptic_app/provider/appointmentprovider.dart';
import 'package:eyeoptic_app/services/appointment.dart';
import 'package:eyeoptic_app/theme/colors.dart';
import 'package:eyeoptic_app/utils/string.dart';
import 'package:eyeoptic_app/widget/alertdialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimelineCard extends StatefulWidget {
  final bool isHighlighted;
  final EdgeInsets marginBottom;
  final int index;
  const TimelineCard({
    super.key,
    required this.index,
    this.isHighlighted = false,
    this.marginBottom = const EdgeInsets.only(bottom: 8.0),
  });

  @override
  State<TimelineCard> createState() => _TimelineCardState();
}

class _TimelineCardState extends State<TimelineCard> {
  bool _isDeleteToggled = false;
  @override
  Widget build(BuildContext context) {
    Color primaryColor =
        (widget.isHighlighted) ? Colors.white : AppColor.textColor;
    var provider = Provider.of<AppointmentProvider>(context);
    var model = provider.model[widget.index];

    Map time = provider.getTime(widget.index);
    Future<String?> serviceName = provider.getServiceName(model.serviceID);
    Future<String?> doctorName = provider.getDoctorName(model.assignedDoctor!);
    return Container(
      margin: widget.marginBottom,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Text(time['time'],
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.w600)),
              const SizedBox(height: 8.0),
              Text(time['meridiem'],
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColor.hintColor, fontWeight: FontWeight.w500)),
            ],
          ),
          const SizedBox(width: 8.0),
          Expanded(
            flex: 1,
            child: Stack(
              children: [
                Container(
                  padding: (widget.isHighlighted)
                      ? const EdgeInsets.all(15.0)
                      : const EdgeInsets.symmetric(horizontal: 15.0),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                      color: (widget.isHighlighted)
                          ? AppColor.primaryColor
                          : Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FutureText(
                            futureTxt: serviceName,
                            style: TextStyle(color: primaryColor),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _isDeleteToggled = !_isDeleteToggled;
                              });
                            },
                            child: Icon(
                              Icons.more_vert,
                              color: primaryColor,
                              size: 24.0,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      iconCard(context, Icons.date_range_outlined, primaryColor,
                          label: provider.getDate(widget.index)),
                      iconCard(context, Icons.room_outlined, primaryColor,
                          label: AppString.appName),
                      iconCard(context, Icons.health_and_safety, primaryColor,
                          futureText: doctorName),
                    ],
                  ),
                ),
                Visibility(
                  visible: _isDeleteToggled,
                  child: Positioned(
                    top: 40.0,
                    right: 25.0,
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return PopUpDialog(
                                title: 'Cancellation',
                                message:
                                    'Are you sure you want to cancel your reservation?',
                                onTap: (context) {
                                  AppointmentStore appointmentStore =
                                      AppointmentStore();

                                  appointmentStore.deleteAppointment(model.id!,
                                      onFinished: () {
                                    provider.removeAppointment(widget.index);
                                    Navigator.pop(context);
                                  });
                                },
                                positiveButton: 'Remove',
                              );
                            });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 8.0),
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 226, 226, 226),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0))),
                        child: const Text(
                          'Delete',
                          style: TextStyle(color: AppColor.hintColor),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget iconCard(BuildContext context, IconData icondata, Color color,
      {Future<String?>? futureText, String? label}) {
    TextStyle defaultStyle =
        Theme.of(context).textTheme.bodySmall!.copyWith(color: color);
    return Container(
      margin: const EdgeInsets.only(bottom: 5.0),
      child: Wrap(
        children: [
          Icon(icondata, color: color, size: 20.0),
          const SizedBox(width: 8.0),
          if (futureText == null) ...[
            Text(label!, style: defaultStyle)
          ] else ...[
            FutureText(futureTxt: futureText, style: defaultStyle)
          ],
        ],
      ),
    );
  }
}

class FutureText extends StatelessWidget {
  final Future<String?> futureTxt;
  final TextStyle? style;
  const FutureText({super.key, required this.futureTxt, this.style});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureTxt,
      builder: ((context, snapshot) {
        String text;
        if (snapshot.connectionState == ConnectionState.waiting) {
          text = 'Loading';
        } else if (snapshot.hasError) {
          text = 'Error';
        } else {
          text = snapshot.data ?? 'Not available';
        }
        return Text(text, style: style);
      }),
    );
  }
}
