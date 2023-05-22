import 'package:flutter/material.dart';
import 'package:quizlr/constants/styles.dart';
import 'package:quizlr/model/options.dart';

class OptionItem extends StatefulWidget {
  const OptionItem({super.key, required this.option, required this.isCorrect});

  final Option option;
  final bool isCorrect;

  @override
  State<OptionItem> createState() => _OptionItemState();
}

class _OptionItemState extends State<OptionItem> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
          color: isSelected
              ? widget.isCorrect
                  ? kMintMedium
                  : kRedMedium
              : kTealGray,
        ),
        height: 40,
        width: double.infinity,
        child: Row(
          children: [
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Text(
                widget.option.answer,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const Spacer(),
            if (isSelected) ...[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  widget.isCorrect ? Icons.check_circle : Icons.remove_circle,
                  color: widget.isCorrect ? kMintLight : kRedLight,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
