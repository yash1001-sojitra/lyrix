import 'package:flutter/material.dart';

class LyrixListmodel extends StatefulWidget {
  const LyrixListmodel({super.key});

  @override
  State<LyrixListmodel> createState() => _LyrixListmodelState();
}

class _LyrixListmodelState extends State<LyrixListmodel> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            height: 50,
            color: Colors.red,
            child: Center(child: Text("$index")),
          );
        });
  }
}
