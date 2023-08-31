import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobile/screens/connectBluetooth.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    const List<String> list = <String>[''];
    final selectedSiteLocation = useState(list.first);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home page'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                  color: Color(0xffEF6C00),
                  borderRadius: BorderRadius.circular(5)),
              child: Text(
                'Offline - Data will Sync when reconnected',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 12.0),
                width: double.infinity,
                child: DropdownMenu<String>(
                  leadingIcon: const Icon(Icons.place),
                  hintText: 'Site location',
                  width: screenWidth * 1.0 - 24.0,
                  // trailingIcon: Text(
                  //   'Tap to change',
                  //   style: TextStyle(color: Color(0xFF1E88E5)),
                  // ),
                  initialSelection: list.first,
                  onSelected: (String? value) {
                    selectedSiteLocation.value = value!;
                    print(selectedSiteLocation.value);
                  },
                  dropdownMenuEntries:
                      list.map<DropdownMenuEntry<String>>((String value) {
                    return DropdownMenuEntry<String>(
                        value: value, label: value);
                  }).toList(),
                )),
            Container(
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                  color: Color(0xff2196F3),
                  borderRadius: BorderRadius.circular(5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Sensor ID',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                  ),
                  Text('Status',
                      style: TextStyle(color: Colors.white, fontSize: 16))
                ],
              ),
            ),
            Container(
              height: screenHeight *
                  0.50, // This part always take 50% height of the screen
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 202, 231, 204),
                  borderRadius: BorderRadius.circular(5)),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '110',
                      style: TextStyle(
                          color: Color(0xff1E4620),
                          fontSize: 40,
                          fontWeight: FontWeight.w600),
                    ),
                    Text('PPM',
                        style: TextStyle(
                            color: Color(0xff1E4620),
                            fontSize: 20,
                            fontWeight: FontWeight.w400))
                  ],
                ),
              ),
            ),
            Container(
              width: screenWidth * 1.0,
              height: screenHeight * 0.060,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 1.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ConnectBluetoothPage()),
                    );
                  },
                  child: Text(
                    'START SESSION',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                ),
              ),
            ),
            Container(
              width: screenWidth * 1.0,
              height: screenHeight * 0.060,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 1.0),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'SIGN OUT',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
