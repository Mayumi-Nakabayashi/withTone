import 'package:flutter/material.dart';

class FavoriteBotton extends StatefulWidget {
  const FavoriteBotton({
    Key? key,
    this.size = 35,
    this.trueColor = const Color(0xffEA4359),
    this.falseColor = const Color(0xffDFE1D9),
  }) : super(key: key);
  final double size;
  final Color trueColor;
  final Color falseColor;

  @override
  State<FavoriteBotton> createState() => _FavoriteMarkState();
}

class _FavoriteMarkState extends State<FavoriteBotton> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _isFavorite = !_isFavorite;
          });
        },
        child: Icon(
          _isFavorite ? Icons.favorite : Icons.favorite_border,
          size: widget.size,
          color:
              _isFavorite ? const Color(0xffEA4359) : const Color(0xffDFE1D9),
        ),
      ),
    );
  }
}
