import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ErrorDialog extends ConsumerWidget {
  const ErrorDialog({super.key, required this.e});
  final dynamic e;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: Text(
        e.toString(),
        style: const TextStyle(fontSize: 16),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('とじる'))
      ],
    );
  }
}
