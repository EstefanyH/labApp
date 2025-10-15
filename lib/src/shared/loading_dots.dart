import 'package:flutter/material.dart';

class LoadingDots extends StatefulWidget {
  final Color activeColor;
  final Color inactiveColor;
  final double size;
  final Duration duration;

  const LoadingDots({
    super.key,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.grey,
    this.size = 12.0,
    this.duration = const Duration(milliseconds: 300),
  });

  @override
  State<LoadingDots> createState() => _LoadingDotsState();
}

class _LoadingDotsState extends State<LoadingDots>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _dotIndex;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(milliseconds: widget.duration.inMilliseconds * 3),
      vsync: this,
    )..repeat();

    _dotIndex = StepTween(begin: 0, end: 2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildDot(int index) {
    bool isActive = _dotIndex.value == index;

    return AnimatedContainer(
      duration: widget.duration,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: widget.size,
      height: widget.size,
      decoration: BoxDecoration(
        color: isActive ? widget.activeColor : widget.inactiveColor,
        shape: BoxShape.circle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _dotIndex,
      builder: (context, child) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(3, _buildDot),
        );
      },
    );
  }
}
