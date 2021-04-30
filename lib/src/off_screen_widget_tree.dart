import 'dart:typed_data';

import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'off_screen_render_view.dart';

class OffscreenWidgetTree {
  final OffscreenRenderView? renderView;
  final BuildOwner buildOwner;
  final PipelineOwner pipelineOwner;
  late RenderObjectToWidgetElement<RenderBox> _root;
  OffscreenWidgetTree({this.renderView, FocusManager? focusManager})
      : buildOwner = BuildOwner(focusManager: focusManager),
        pipelineOwner = PipelineOwner() {
    pipelineOwner.rootNode = renderView;

    // renderView.attach(pipelineOwner);
    renderView!.prepareInitialFrame();
  }

  void attachWidget(Widget child) {
    assert(child != null);
    _root = RenderObjectToWidgetAdapter<RenderBox>(
      container: renderView!.repaintBoundary!,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: child,
      ),
      // debugShortDescription: '[root]',
    ).attachToRenderTree(this.buildOwner);
  }

  Future<ui.Image> toImage({Duration? wait, double pixelRatio = 1.0}) async {
    buildOwner.buildScope(_root);

    if (wait != null) {
      await Future.delayed(wait);
    }

    buildOwner.finalizeTree();

    pipelineOwner.flushLayout();
    pipelineOwner.flushCompositingBits();
    pipelineOwner.flushPaint();

    final image =
        await renderView!.repaintBoundary!.toImage(pixelRatio: pixelRatio);
    final ByteData? byteData =
        await image.toByteData(format: ui.ImageByteFormat.png);
    return image;
  }
}
