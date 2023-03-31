import 'package:flutter/material.dart';

import 'kuning.dart';

class MerahWidget extends StatelessWidget {
  const MerahWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 180,
      color: Colors.red,
      child: KuningWidget(),
    );
  }
}
