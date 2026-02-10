import 'package:flutter/material.dart';

class AppErrorWidget extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;

  const AppErrorWidget({
    Key? key,
    required this.message,
    this.onRetry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                color: Colors.redAccent.withOpacity(0.12),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.redAccent.withOpacity(0.35),
                    blurRadius: 16,
                    offset: Offset(0, 6),
                  ),
                ],
                border: Border.all(color: Colors.redAccent, width: 4),
              ),
              child: Center(
                child: Icon(Icons.wifi_off, color: Colors.redAccent, size: 48),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "No Internat Connection",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent[700],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),

            if (onRetry != null) ...[
              SizedBox(height: 28),
              ElevatedButton.icon(
                onPressed: onRetry,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                  shape: StadiumBorder(),
                ),
                icon: Icon(Icons.refresh),
                label: Text('retry', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ],
        ),
      ),
    );
  }
}