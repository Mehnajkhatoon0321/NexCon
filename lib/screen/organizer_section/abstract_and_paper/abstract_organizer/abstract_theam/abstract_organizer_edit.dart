import 'package:flutter/material.dart';
class AbstractOrganizerEdit extends StatefulWidget {
  String conferenceName;
  String  abstractSession;
   AbstractOrganizerEdit({required this.conferenceName,required this.abstractSession,super.key});

  @override
  State<AbstractOrganizerEdit> createState() => _AbstractOrganizerEditState();
}

class _AbstractOrganizerEditState extends State<AbstractOrganizerEdit> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
