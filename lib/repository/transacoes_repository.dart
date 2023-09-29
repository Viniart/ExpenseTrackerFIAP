import 'package:expense_tracker/models/conta.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/categoria.dart';
import '../models/tipo_transacao.dart';
import '../models/transacao.dart';

class TransacoesReepository {
  Future<List<Transacao>> listarTransacoes(
      {TipoTransacao? tipoTransacao}) async {
    final supabase = Supabase.instance;
    final rows = await supabase.client
        .from('transacoes')
        .select<List<Map<String, dynamic>>>('''
            *,
            contas(*),
            categorias(*)

          ''');

    final transacoes = rows.map((row) {
      final categoria = row['categorias'];
      final conta = row['contas'];

      return Transacao(
          id: row['id'],
          descricao: row['descricao'],
          tipoTransacao: TipoTransacao.values[row['tipo_transacao']],
          valor: row['valor'],
          data: DateTime.parse(row['data_transacao']),
          categoria: Categoria(
              id: categoria['id'],
              descricao: categoria['descricao'],
              cor: Color(categoria['cor']),
              icone: IoniconsData(categoria['icone']),
              tipoTransacao: TipoTransacao.values[categoria['tipo_transacao']]),
          conta: Conta(
              id: conta['id'],
              bancoId: conta['banco'],
              descricao: conta['descricao'],
              tipoConta: TipoConta.values[conta['tipo_conta']]));
    }).toList();

    return transacoes;
  }
}
