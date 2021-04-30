import 'dart:ui';

import 'package:flutter/rendering.dart';

class OffscreenRenderView extends RenderView {
  final RenderRepaintBoundary? repaintBoundary;
  OffscreenRenderView({
    required ViewConfiguration configuration,
    this.repaintBoundary,
  }) : super(
          child: RenderPositionedBox(
            alignment: Alignment.center,
            child: repaintBoundary,
          ),
          configuration: configuration,
          window: window,
        );
  @override
  void compositeFrame() {
    // Don't draw to ui.window
  }
}
