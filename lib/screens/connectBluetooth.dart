import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ConnectBluetoothPage extends HookWidget {
  const ConnectBluetoothPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<List<BluetoothDevice>> devicesList =
        useState<List<BluetoothDevice>>([]);
    FlutterBlue flutterBlue = FlutterBlue.instance;

    useEffect(() {
      // Start scanning
      flutterBlue.startScan(timeout: Duration(seconds: 4));

      // Listen to scan results
      var subscription = flutterBlue.scanResults.listen((results) {
        // do something with scan results
        for (ScanResult r in results) {
          var foundDevice = r.device;
          // print('foundDevice: ${foundDevice}');
          if (!devicesList.value.contains(foundDevice)) {
            devicesList.value = List<BluetoothDevice>.from(devicesList.value)
              ..add(foundDevice);
          }
        }
      });

      return () {
        flutterBlue.stopScan();
        subscription.cancel();
      };
    }, []);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Bluetooth page'),
          centerTitle: true,
        ),
        body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView(
                shrinkWrap: true,
                children: devicesList.value.map((e) {
                  return ListTile(
                      contentPadding: EdgeInsets.all(10),
                      leading: Icon(Icons.bluetooth),
                      title: Text(
                        e.name ?? 'Unknown Device',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Text(
                        e.id.toString(),
                        style: TextStyle(fontSize: 12),
                      ),
                      trailing: ElevatedButton(
                        onPressed: () {
                          // Implement device selection action here
                        },
                        child: Text('Connect'),
                      ),
                      onTap: () {
                        // Implement device selection action here
                      });
                }).toList())));
  }
}
