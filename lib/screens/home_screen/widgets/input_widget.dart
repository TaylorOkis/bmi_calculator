import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputWidget extends StatelessWidget {
  const InputWidget({super.key, required this.textEditingController});

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 37,
        height: 1.2,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(
          RegExp(r"^\d+(\.\d*)?"),
        ),
      ],
      cursorColor: Colors.blue,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      decoration: const InputDecoration(
        hintText: '0',
        border: InputBorder.none,
      ),
    );
  }
}
