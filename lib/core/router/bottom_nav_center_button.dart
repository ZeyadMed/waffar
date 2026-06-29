import 'package:flutter/material.dart';
import 'package:waffar/core/style/app_colors.dart';

class BottomNavCenterButton extends StatefulWidget {
  final IconData icon;
  final String labelKey;
  final VoidCallback onTap;

  const BottomNavCenterButton({
    super.key,
    required this.icon,
    required this.labelKey,
    required this.onTap,
  });

  @override
  State<BottomNavCenterButton> createState() => _BottomNavCenterButtonState();
}

class _BottomNavCenterButtonState extends State<BottomNavCenterButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Transform.translate(
        offset: const Offset(0, -14),
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTapDown: (_) => setState(() => _isPressed = true),
          onTapUp: (_) => setState(() => _isPressed = false),
          onTapCancel: () => setState(() => _isPressed = false),
          onTap: widget.onTap,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _isPressed ? AppColors.primaryColor : Colors.transparent,
                  border: Border.all(
                    color: _isPressed ? AppColors.primaryColor : Colors.grey.shade400,
                    width: 1.5,
                  ),
                ),
                child: Icon(
                  widget.icon,
                  color: _isPressed ? Colors.white : Colors.grey.shade400,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

