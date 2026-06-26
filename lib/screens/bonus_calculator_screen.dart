import 'package:flutter/material.dart';
import '../models/performance_rating.dart';
import '../theme/app_theme.dart';
import '../widgets/calculate_button.dart';
import '../widgets/rating_dropdown.dart';
import '../widgets/result_card.dart';
import '../widgets/salary_input.dart';

class BonusCalculatorScreen extends StatefulWidget {
  const BonusCalculatorScreen({super.key});

  @override
  State<BonusCalculatorScreen> createState() => _BonusCalculatorScreenState();
}

class _BonusCalculatorScreenState extends State<BonusCalculatorScreen> {
  final _salaryController = TextEditingController();

  double _salary = 0;
  PerformanceRating _rating = PerformanceRating.veryGood;
  bool _showResult = false;
  String? _errorMsg;

  @override
  void dispose() {
    _salaryController.dispose();
    super.dispose();
  }

  void _onCalculate() {
    final val = double.tryParse(_salaryController.text) ?? 0;
    if (val <= 0) {
      setState(() {
        _errorMsg = 'يرجى إدخال راتب صحيح';
        _showResult = false;
      });
      return;
    }
    setState(() {
      _salary = val;
      _showResult = true;
      _errorMsg = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Column(
          children: [
            // ── App Bar ──────────────────────────────────────────────────
            Container(
              alignment: Alignment.centerLeft,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppTheme.primary, AppTheme.primaryLight],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
              ),
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 12,
                right: 20,
                left: 20,
                bottom: 28,
              ),
              child: Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(1),
                      child: Image.asset(
                        'assets/images/logo/logo2.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'حاسبة المكافآت',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Cairo',
                        ),
                      ),
                      Text(
                        'احسب مكافأتك السنوية بسهولة',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                          fontFamily: 'Cairo',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // ── Body ─────────────────────────────────────────────────────
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    SalaryInput(
                      controller: _salaryController,
                      onChanged: (_) {
                        if (_showResult) setState(() => _showResult = false);
                        if (_errorMsg != null) setState(() => _errorMsg = null);
                      },
                    ),
                    const SizedBox(height: 14),
                    RatingDropdown(
                      selected: _rating,
                      onChanged: (r) {
                        setState(() {
                          _rating = r;
                          _showResult = false;
                        });
                      },
                    ),
                    const SizedBox(height: 14),
                    CalculateButton(onPressed: _onCalculate),

                    // Error
                    if (_errorMsg != null) ...[
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFF3F3),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.red.shade200),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.error_outline,
                              color: Colors.red,
                              size: 18,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              _errorMsg!,
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],

                    // Result
                    if (_showResult) ...[
                      const SizedBox(height: 14),
                      ResultCard(salary: _salary, rating: _rating),
                    ],

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
