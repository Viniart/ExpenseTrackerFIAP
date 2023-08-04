import 'package:expense_tracker/models/banco.dart';
import 'package:expense_tracker/models/conta.dart';
import 'package:flutter/material.dart';

class ContaItem extends StatelessWidget {
  final Conta conta;
  const ContaItem({super.key, required this.conta});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
          backgroundImage:
              AssetImage('images/${banksMap[conta.bancoId]?.logo}')),
      title: Text(
        conta.descricao,
      ),
      subtitle: Text(banksMap[conta.bancoId]?.nome ?? ''),
    );
  }
}
