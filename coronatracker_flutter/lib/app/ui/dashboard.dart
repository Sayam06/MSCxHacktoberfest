import 'package:coronatracker_usemy/app/repositories/data_repository.dart';
import 'package:coronatracker_usemy/app/repositories/endpoints_data.dart';
import 'package:coronatracker_usemy/app/services/api.dart';
import 'package:coronatracker_usemy/app/ui/endpointcard.dart';
import 'package:coronatracker_usemy/app/ui/last_updated_status_text.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

class Dashoard extends StatefulWidget {
  @override
  _DashoardState createState() => _DashoardState();
}

class _DashoardState extends State<Dashoard> {
  EndpointsData _endpointsData;

  @override
  void initState() {
    super.initState();
    _updateData();
  }

  Future<void> _updateData() async {
    final dataRepository = Provider.of<DataRepository>(context, listen: false);
    final endpointsData = await dataRepository.getAllEndpointData();
    setState(() => _endpointsData = endpointsData);
  }

  @override
  Widget build(BuildContext context) {
    final formatter = LastUpdatedDateFormatter(
        lastUpdated: _endpointsData != null
            ? _endpointsData.values[Endpoint.cases].date
            : null);
    return Scaffold(
      appBar: AppBar(
        title: Text("Coronavirus Tracker"),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: _updateData,
        child: ListView(
          children: <Widget>[
            LastUpdatedStatusText(text: formatter.lastUpdatedStatusText()),
            for (var endpoint in Endpoint.values)
              EndpointCard(
                endpoint: endpoint,
                value: _endpointsData != null
                    ? _endpointsData.values[endpoint].value
                    : null,
              )
          ],
        ),
      ),
    );
  }
}
