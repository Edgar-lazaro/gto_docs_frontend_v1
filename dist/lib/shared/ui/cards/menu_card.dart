import 'package:flutter/material.dart';

class Lp9cGlFl extends StatelessWidget {
  final String coS9K;
  final IconData rPdL;
  final Color eadD9;
  final VoidCallback rzBTF;

  const Lp9cGlFl({
    super.key,
    required this.coS9K,
    required this.rPdL,
    required this.eadD9,
    required this.rzBTF,
  });

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width >= 600;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: rzBTF,
        borderRadius: BorderRadius.circular(isTablet ? 20 : 16),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [eadD9, eadD9.withValues(alpha: 0.8)],
            ),
            borderRadius: BorderRadius.circular(isTablet ? 20 : 16),
            boxShadow: [
              BoxShadow(
                color: eadD9.withValues(alpha: 0.4),
                blurRadius: isTablet ? 12 : 10,
                offset: Offset(0, isTablet ? 6 : 4),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(isTablet ? 20 : 16),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  rPdL,
                  size: isTablet ? 40 : 32,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: isTablet ? 16 : 12),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: isTablet ? 12 : 8),
                child: Text(
                  coS9K,
                  style: TextStyle(
                    fontSize: isTablet ? 16 : 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
