import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseFormLayout extends StatelessWidget {
  final List<Widget> mainContent;
  final Widget? bottomButton;
  final String? errorMessage;
  final String? title;

  const BaseFormLayout({
    Key? key,
    required this.mainContent,
    this.bottomButton,
    this.errorMessage,
    this.title = 'Task.io',
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              children: [
                // Header
                Row(
                  children: [Text(title ?? '')],
                ),
                SizedBox(height: 20),
                // Main content
                ...mainContent,
              ],
            ),
            // Bottom button
            if (bottomButton != null) bottomButton!,
            // Error message
            if (errorMessage != null && errorMessage!.isNotEmpty)
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  errorMessage!,
                  style: TextStyle(color: Colors.red),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
