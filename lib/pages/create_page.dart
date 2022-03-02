import 'package:flutter/material.dart';
import 'package:scanqr/pages/widgets/custom_qr_image.dart';

class CreatePage extends StatelessWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(100.0), // here the desired height
      //   child: CustomAppBar(),
      // ),
      appBar: AppBar(title: const Text('Create')),
      body: const SafeArea(
          child: CustomQrImage(
        data: "https://pub.dev/packages/qr_flutter",
      )),
    );
  }
}
