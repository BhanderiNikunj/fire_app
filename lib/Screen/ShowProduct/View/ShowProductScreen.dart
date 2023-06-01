import 'package:flutter/material.dart';

class ShowProductScreen extends StatefulWidget {
  const ShowProductScreen({Key? key}) : super(key: key);

  @override
  State<ShowProductScreen> createState() => _ShowProductScreenState();
}

class _ShowProductScreenState extends State<ShowProductScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Image.network(
              "https://t4.ftcdn.net/jpg/02/29/75/83/360_F_229758328_7x8jwCwjtBMmC6rgFzLFhZoEpLobB6L8.jpg",
            ),
          ],
        ),
      ),
    );
  }
}
