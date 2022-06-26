import 'package:flutter/widgets.dart';
import 'package:word_cloud_poc/components/scatter/rendering/scatter.dart';

/// A widget that positions its children with a [ScatterDelegate]
/// without overlapping them.
///
/// This class is useful when you want to create a cloud of words.
class Scatter extends MultiChildRenderObjectWidget {
  Scatter({
    Key? key,
    ScatterDelegate? delegate,
    this.alignment = Alignment.center,
    this.clipBehavior = Clip.antiAlias,
    this.maxChildIteration = 10000,
    this.fillGaps = false,
    List<Widget> children = const <Widget>[],
  })  : delegate = delegate ?? ArchimedeanSpiralScatterDelegate(),
        super(key: key, children: children);

  /// The delegate that controls the layout of the [Scatter].
  final ScatterDelegate delegate;

  /// Determine how the children will be placed on
  /// the [ScatterDelegate.getPositionForIteration] offset.
  ///
  /// For example if [alignement] is [Alignment.center], all
  /// offsets given by [ScatterDelegate.getPositionForIteration]
  /// will be at center of a child.
  final Alignment alignment;

  /// Whether overflowing children should be clipped. See [Clip].
  ///
  /// Some children in a scatter might overflow its box. When this property is
  /// not [Clip.none], children cannot paint outside of the stack's box.
  final Clip clipBehavior;

  /// The maximum of iterations we can do for one child.
  ///
  /// When it's impossible to place another child, a FlutterError
  /// is thrown when this number of iterations for one child is reached.
  final int maxChildIteration;

  /// Indicates whether gaps should be filled if possible.
  /// Setting this value to `true` is more expansive.
  ///
  /// If `true` the [maxChildIteration] will be multiplied by
  /// the index of the current child.
  ///
  /// Defaults to false.
  final bool fillGaps;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderScatter(
      delegate: delegate,
      alignment: alignment,
      clipBehavior: clipBehavior,
      maxChildIteration: maxChildIteration,
      fillGaps: fillGaps,
    );
  }

  @override
  void updateRenderObject(BuildContext context, RenderScatter renderObject) {
    renderObject
      ..delegate = delegate
      ..alignment = alignment
      ..clipBehavior = clipBehavior
      ..maxChildIteration = maxChildIteration
      ..fillGaps = fillGaps;
  }
}
