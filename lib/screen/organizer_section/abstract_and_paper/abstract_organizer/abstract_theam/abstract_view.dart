import 'package:flutter/material.dart';
class AbstractView extends StatefulWidget {
  String id;
   AbstractView({required this.id,super.key});

  @override
  State<AbstractView> createState() => _AbstractViewState();
}

class _AbstractViewState extends State<AbstractView> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
