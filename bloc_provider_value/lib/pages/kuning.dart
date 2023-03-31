import 'package:flutter/material.dart';

import 'biru.dart';

class KuningWidget extends StatelessWidget {
  const KuningWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      color: Colors.amber,
      child: BiruWidget(),
    );
  }
}
