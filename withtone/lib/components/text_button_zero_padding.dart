import 'package:flutter/material.dart';

/// padding が 0 の TextButton
///
/// 基本的に TextButton と同様に利用する.
/// style は指定できない. ( padding 0 にする為にカスタマイズしている為 )
class TextButtonZeroPadding extends StatelessWidget {
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final ValueChanged<bool>? onHover;
  final ValueChanged<bool>? onFocusChange;
  final Clip clipBehavior;
  final FocusNode? focusNode;
  final bool autofocus;
  final MaterialStatesController? statesController;
  final Widget child;

  // padding を消す為の style
  // 参考: https://crieit.net/posts/Flutter-TextButton
  final ButtonStyle _zeroPaddingStyle = ButtonStyle(
    padding: MaterialStateProperty.all(EdgeInsets.zero),
    minimumSize: MaterialStateProperty.all(Size.zero),
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  );

  TextButtonZeroPadding({
    super.key,
    this.onPressed,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.focusNode,
    this.autofocus = false,
    this.clipBehavior = Clip.none,
    this.statesController,
    required this.child,
  });

  @override
  Widget build(context) {
    return TextButton(
      onPressed: onPressed,
      onLongPress: onLongPress,
      onHover: onHover,
      onFocusChange: onFocusChange,
      style: _zeroPaddingStyle,
      focusNode: focusNode,
      autofocus: autofocus,
      clipBehavior: clipBehavior,
      statesController: statesController,
      child: child,
    );
  }
}
