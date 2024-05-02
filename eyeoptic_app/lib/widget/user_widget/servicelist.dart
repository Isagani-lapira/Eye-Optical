import 'package:eyeoptic_app/model/generalmodel.dart';
import 'package:eyeoptic_app/model/servicemodel.dart';
import 'package:eyeoptic_app/screen/client/user/selectedservice.dart';
import 'package:eyeoptic_app/services/firestore.dart';
import 'package:eyeoptic_app/utils/const.dart';
import 'package:flutter/material.dart';

class ServiceTile extends StatefulWidget {
  const ServiceTile({super.key});

  @override
  State<ServiceTile> createState() => _ServiceTileState();
}

class _ServiceTileState extends State<ServiceTile> {
  final FireStoreService _service = FireStoreService();

  void _getService(context, String serviceName) async {
    ServiceModel? model = await _service.retrieveServiceData(serviceName);

    if (model != null) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => ServiceView(model: model)));
    } else {
      print('wala hindi maretrieve');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.0,
      child: StreamBuilder(
        stream: _service.serviceStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: kLoader);
          }

          if (!snapshot.hasData) {
            return const Center(child: Text('Error occur'));
          }

          final data = snapshot.data!.docs;
          List<ServiceModel> model = data
              .map((data) => ServiceModel(
                  id: data.id,
                  name: data['name'],
                  description: data['description'],
                  iconName: data['icon'],
                  date: GeneralModel.formattedDate(data['date_created'])))
              .toList();
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              String serviceName = model[index].name;
              String iconPath = model[index].iconName;
              return Container(
                width: 96.0,
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () => _getService(context, serviceName),
                  child: Column(
                    children: [
                      Image.asset(
                        'img/service_default_icons/$iconPath',
                        height: 70.0,
                        width: 70.0,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        model[index].name,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: model.length,
          );
        },
      ),
    );
  }
}
