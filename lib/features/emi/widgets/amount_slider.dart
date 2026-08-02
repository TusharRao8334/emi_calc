import 'package:flutter/material.dart';

class AmountSlider extends StatelessWidget {
  final String title;
  final String value;
  final double sliderValue;
  final double min;
  final double max;
  final int divisions;
  final ValueChanged<double> onChanged;

  const AmountSlider({
    super.key,
    required this.title,
    required this.value,
    required this.sliderValue,
    required this.min,
    required this.max,
    required this.divisions,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleMedium),

            const SizedBox(height: 10),

            Text(
              value,
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),

            Slider(
              value: sliderValue,
              min: min,
              max: max,
              divisions: divisions,
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }
}
