import 'package:eyeoptic_app/model/doctormodel.dart';
import 'package:eyeoptic_app/model/generalmodel.dart';
import 'package:eyeoptic_app/provider/doctortabprovider.dart';
import 'package:eyeoptic_app/services/doctorstore.dart';
import 'package:eyeoptic_app/theme/colors.dart';
import 'package:eyeoptic_app/widget/actiontable.dart';
import 'package:eyeoptic_app/widget/table_widget/cellwidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DoctorStream extends StatelessWidget {
  DoctorStream({super.key});
  final List<String> _headerRow = [
    'Name',
    'Contact number',
    'Registered on',
    'Action',
  ];

  final FireStoreDoctor _storeDoctor = FireStoreDoctor();
  @override
  Widget build(BuildContext context) {
    return Consumer<DoctorTabProvider>(
      builder: (context, value, _) {
        return StreamBuilder(
            stream: _storeDoctor.doctorStream(),
            builder: (context, snapshot) {
              //loading
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: CircularProgressIndicator(
                        color: AppColor.primaryColor));
              }
              var doctors = snapshot.data!.docs;
              List<DoctorModel> doctorModel = [];

              for (var doctor in doctors) {
                doctorModel.add(DoctorModel(
                  id: doctor.id,
                  fname: doctor['fname'],
                  lname: doctor['lname'],
                  address: doctor['address'],
                  contact: doctor['contact'],
                  email: doctor['email'],
                  gender: doctor['gender'],
                  joinedDate: doctor['timestamp'],
                ));
              }
              return Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  headRow(context, _headerRow),
                  if (doctorModel.isNotEmpty)
                    ...doctorModel.map((data) {
                      String fullname = 'Dr. ${data.fname} ${data.lname}';
                      return TableRow(children: [
                        tbCell(context, fullname),
                        tbCell(context, data.contact),
                        tbCell(context,
                            GeneralModel.formattedDate(data.joinedDate)),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ActionTable(
                                  name: 'Edit',
                                  onTap: () {
                                    value.setDoctorSection(
                                        DoctorSection.editSection);
                                  }),
                              const SizedBox(width: 10.0),
                              ActionTable(name: 'Delete', onTap: () {}),
                            ],
                          ),
                        )
                      ]);
                    })
                ],
              );
            });
      },
    );
  }
}
