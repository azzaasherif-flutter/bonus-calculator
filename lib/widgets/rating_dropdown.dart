import 'package:flutter/material.dart';
import '../models/performance_rating.dart';
import '../theme/app_theme.dart';

class RatingDropdown extends StatelessWidget {
  final PerformanceRating selected;
  final ValueChanged<PerformanceRating> onChanged;

  const RatingDropdown({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.cardBg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppTheme.border),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.star_outline, color: AppTheme.primary, size: 18),
              SizedBox(width: 6),
              Text(
                'نسبة التقييم الوظيفي',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            'اختر مستوى أدائك',
            style: TextStyle(
              fontSize: 13,
              color: AppTheme.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 12),
          // Pills
          DropdownMenu<PerformanceRating>(
            initialSelection: selected,
            // width: double.infinity,
            hintText: 'اختر مستوى الأداء',
            textStyle: const TextStyle(fontFamily: 'Cairo', fontSize: 15),
            menuStyle: MenuStyle(
              backgroundColor: WidgetStatePropertyAll(AppTheme.cardBg),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              ),
            ),
            inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: AppTheme.inputBg,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(color: AppTheme.border),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(color: AppTheme.border),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(
                  color: AppTheme.primary,
                  width: 1.5,
                ),
              ),
            ),
            dropdownMenuEntries: PerformanceRating.values.map((rating) {
              return DropdownMenuEntry(value: rating, label: rating.fullLabel);
            }).toList(),
            onSelected: (value) {
              if (value != null) {
                onChanged(value);
              }
            },
          ),
        ],
      ),
    );
  }
}
