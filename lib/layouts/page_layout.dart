// Create a wrapper widget
import 'package:flutter/cupertino.dart';

class PageContainer extends StatelessWidget {
  final Widget child;
  
  const PageContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints(maxWidth: 370, maxHeight: 600),
        padding: EdgeInsets.all(16),
        alignment: Alignment.center,
        child: child,
      ),
    );
  }
}
