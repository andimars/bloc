import 'package:flutter/material.dart';

import 'data_widget.dart';

class CenterData extends StatelessWidget {
  const CenterData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DataWidget(),
    );
  }
}
