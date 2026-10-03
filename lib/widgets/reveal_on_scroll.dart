import 'package:flutter/material.dart';

/// Fades and lifts [child] into place once, the first time it comes within the
/// lower band of the viewport.
///
/// Position is measured against global screen coordinates rather than the
/// scroll view, so it needs no keys and works at any nesting depth. Once the
/// animation completes the scroll listener detaches itself, and nothing is
/// polled or scheduled with timers.
class RevealOnScroll extends StatefulWidget {
  const RevealOnScroll({
    super.key,
    required this.controller,
    required this.child,
    this.offset = 12,
    this.duration = const Duration(milliseconds: 500),
    this.triggerFraction = 0.92,
  });

  final ScrollController controller;
  final Widget child;
  final double offset;
  final Duration duration;

  /// Fraction of the viewport height at which the reveal fires.
  final double triggerFraction;

  @override
  State<RevealOnScroll> createState() => _RevealOnScrollState();
}

class _RevealOnScrollState extends State<RevealOnScroll>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: widget.duration,
  );
  late final Animation<double> _curve = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeOutCubic,
  );

  bool _revealed = false;

  @override
  void initState() {
    super.initState();
    _controller.addStatusListener(_handleStatus);
    widget.controller.addListener(_handleScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _handleScroll();
    });
  }

  @override
  void didUpdateWidget(RevealOnScroll oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      oldWidget.controller.removeListener(_handleScroll);
      widget.controller.addListener(_handleScroll);
      _revealed = false;
      _controller.value = 0;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) _handleScroll();
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (MediaQuery.disableAnimationsOf(context)) {
      _revealed = true;
      _controller.value = 1;
    }
  }

  void _handleStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      widget.controller.removeListener(_handleScroll);
    }
  }

  void _handleScroll() {
    if (_revealed || _controller.isCompleted) return;
    final RenderObject? renderObject = context.findRenderObject();
    if (renderObject is! RenderBox || !renderObject.hasSize) return;
    if (!renderObject.attached) return;

    final double top = renderObject.localToGlobal(Offset.zero).dy;
    final double trigger =
        MediaQuery.sizeOf(context).height * widget.triggerFraction;
    if (top > trigger) return;

    _revealed = true;
    _controller.forward();
  }

  @override
  void dispose() {
    widget.controller.removeListener(_handleScroll);
    _controller
      ..removeStatusListener(_handleStatus)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _curve,
      child: widget.child,
      builder: (BuildContext context, Widget? child) {
        final double t = _curve.value;
        return Opacity(
          opacity: t,
          child: Transform.translate(
            offset: Offset(0, (1 - t) * widget.offset),
            child: child,
          ),
        );
      },
    );
  }
}
