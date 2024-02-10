import 'package:flutter/material.dart';
import 'package:my_app/src/widgets/accordion.dart';

class DetailForm extends StatefulWidget {
  const DetailForm({super.key});

  @override
  State<DetailForm> createState() => _DetailFormState();
}

class _DetailFormState extends State<DetailForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Accordion(
        title: "Add Details",
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Enter name",
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Enter phone number",
                ),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
