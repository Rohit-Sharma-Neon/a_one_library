import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'animated_column.dart';
import 'base_app_bar.dart';
import 'base_no_data.dart';

class CustomisedGreyErrorScreen extends StatelessWidget {
  final FlutterErrorDetails errorDetails;
  const CustomisedGreyErrorScreen({super.key, required this.errorDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(),
      body: Center(
        child: AnimatedColumn(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BaseNoData(
              message: kDebugMode ? errorDetails.summary.toString() : "We encountered an error and we've notified our engineering team about it. Sorry for the inconvenience caused.",
            )
          ],
        ),
      ),
    );
  }
}
