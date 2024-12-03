import 'package:flutter/material.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Nenhuma tarefa ainda. Adicione uma!',
        style: TextStyle(fontSize: 18, color: Colors.grey),
      ),
    );
  }
}
