import 'package:flutter/material.dart';

import 'curved_edges.dart';

class ZCurvedEdgesWidget extends StatelessWidget {
  const ZCurvedEdgesWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ZCustomCurvedEdges(),
      child: child,
    );
  }
}
