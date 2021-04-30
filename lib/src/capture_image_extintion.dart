import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'dart:ui' as ui;

import 'off_screen_render_view.dart';
import 'off_screen_widget_tree.dart';

extension captureImageOffScreenExtintion on Widget {
  Future<ByteData?> captureImage(
      {required double pixelRatio, required Size size}) async {
    OffscreenRenderView renderView = OffscreenRenderView(
      configuration:
          ViewConfiguration(devicePixelRatio: pixelRatio, size: size),
      repaintBoundary: RenderRepaintBoundary(),
    );
    OffscreenWidgetTree widgetTree = OffscreenWidgetTree(
        renderView: renderView, focusManager: FocusManager.instance);

    widgetTree.attachWidget(this);
    final image = await widgetTree.toImage(pixelRatio: pixelRatio);
    final ByteData? byteData =
        await image.toByteData(format: ui.ImageByteFormat.png);
    return byteData;
  }

  Future<Uint8List> captureImageAsUnit8List(
          {required double pixelRatio, required Size size}) async =>
      (await captureImage(pixelRatio: pixelRatio, size: size))!
          .buffer
          .asUint8List();
}
