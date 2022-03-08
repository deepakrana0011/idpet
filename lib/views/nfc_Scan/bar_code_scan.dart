import 'package:flutter/material.dart';

class NfcScan extends StatefulWidget {
  const NfcScan({Key? key}) : super(key: key);

  @override
  State<NfcScan> createState() => _NfcScanState();
}

class _NfcScanState extends State<NfcScan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("BarCodeScan"),
      ),
    );
  }

  void settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: Icon(Icons.music_note),
                    title: Text('Music'),
                    onTap: () => {}),
                ListTile(
                  leading: Icon(Icons.videocam),
                  title: Text('Video'),
                  onTap: () => {},
                ),
              ],
            ),
          );
        });
  }
}
