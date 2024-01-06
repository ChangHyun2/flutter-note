import 'package:flutter/material.dart';

class ProfileFeedback extends StatelessWidget {
  const ProfileFeedback({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Color(0xFFE3F97D),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 17,
              ),
              SizedBox(width: 8),
              Text('별별노트에게 의견을 남겨주세요!'),
            ],
          ),
          Icon(Icons.chevron_right)
        ],
      ),
    );
  }
}
