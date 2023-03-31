import 'package:flutter/material.dart';

import 'center_data.dart';

class BiruWidget extends StatelessWidget {
  const BiruWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      color: Colors.blue,
      child: CenterData(),
    );
  }
}
