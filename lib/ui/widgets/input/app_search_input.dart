import 'package:flutter/material.dart';

class AppSearchTextInput extends StatelessWidget {
  final String hintText;
  final VoidCallback? onClear;
  final ValueChanged<String>? onFieldSubmitted;
  final bool showPrefixIcon;
  final bool showNoteText;

  const AppSearchTextInput({
    Key? key,
    required this.hintText,
    this.onClear,
    this.onFieldSubmitted,
    this.showPrefixIcon = true,
    this.showNoteText = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          onFieldSubmitted: onFieldSubmitted,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 15,
            ),
            hintText: hintText,
            prefixIcon: showPrefixIcon ? const Icon(Icons.search) : null,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        if (showNoteText)
          const Padding(
            padding: EdgeInsets.only(top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Note: Press Enter to search',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                  textAlign: TextAlign.end,
                ),
              ],
            ),
          ),
      ],
    );
  }
}
