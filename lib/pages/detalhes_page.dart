import 'package:expense_tracker/components/conta_item.dart';
import 'package:expense_tracker/models/banco.dart';
import 'package:expense_tracker/models/tipo_transacao.dart';
import 'package:expense_tracker/models/transacao.dart';
import 'package:expense_tracker/repository/conta_repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetalhesPage extends StatefulWidget {
  final Transacao transacao;
  const DetalhesPage({super.key, required this.transacao});

  @override
  State<DetalhesPage> createState() => _DetalhesPageState();
}

class _DetalhesPageState extends State<DetalhesPage> {
  var dateFormat = DateFormat('dd/MM/yyyy');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.transacao.descricao),
        backgroundColor: widget.transacao.tipoTransacao == TipoTransacao.despesa
            ? Colors.red
            : Colors.green,
      ),
      body: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: widget.transacao.categoria.cor,
              backgroundImage: AssetImage(
                  'images/${banksMap[widget.transacao.conta.bancoId]?.logo}'),
            ),
            title: Text(widget.transacao.conta.descricao),
            subtitle:
                Text(banksMap[widget.transacao.conta.bancoId]?.nome ?? ''),
          ),
          ListTile(
            title: const Text('Tipo de Lançamento'),
            subtitle: Text(
                widget.transacao.tipoTransacao == TipoTransacao.despesa
                    ? 'Despesa'
                    : 'Receita'),
          ),
          ListTile(
            title: const Text('Valor'),
            subtitle: Text('R\$ ${widget.transacao.valor.toString()}'),
          ),
          ListTile(
            title: const Text('Categoria'),
            subtitle: Text(widget.transacao.categoria.descricao),
          ),
          ListTile(
            title: const Text('Data da Transação'),
            subtitle: Text(dateFormat.format(widget.transacao.data)),
          ),
          ListTile(
            title: const Text('Observação'),
            subtitle: Text(widget.transacao.descricao),
          ),
        ],
      ),
    );
  }
}
