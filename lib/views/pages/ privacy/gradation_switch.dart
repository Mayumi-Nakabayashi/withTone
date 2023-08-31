import 'package:flutter/material.dart';

///背景がグラデーションになっているスイッチ
class GradientSwitch extends StatefulWidget {
  GradientSwitch({
    required this.value,
    required this.onChanged,
  });

  ///ON/OFFの値
  final bool value;

  ///ON/OFFの切り替えた時の処理
  final ValueChanged<bool> onChanged;
  @override
  _GradientSwitchState createState() => _GradientSwitchState();
}

class _GradientSwitchState extends State<GradientSwitch> {
  late bool _isOn;

  @override
  void initState() {
    super.initState();
    _isOn = widget.value;
  }

  void _toggleSwitch() {
    setState(() {
      _isOn = !_isOn;
      widget.onChanged(_isOn);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleSwitch,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 60,
        height: 28,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: _isOn
                ? const [Color(0xff29C956), Color(0xff9EFCC4)] //onの時の色
                : [Colors.grey, Colors.grey], //offの時の色
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(17),
        ),
        alignment: _isOn ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }
}
