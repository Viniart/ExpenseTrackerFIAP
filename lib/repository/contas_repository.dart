import 'package:expense_tracker/models/banco.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/conta.dart';

class ContasRepository {
  Future<List<Conta>> listarContas() async {
    final supabase = Supabase.instance;

    final rows = await supabase.client
        .from('contas')
        .select<List<Map<String, dynamic>>>();

    final contas = rows.map((row) => Conta(
        id: row['id'], bancoId: row['banco'], descricao: row['descricao'], tipoConta: TipoConta.values[row['tipo_conta']])).toList();

    return contas;
  }
}
