import 'package:expense_tracker/models/conta.dart';

class ContaRepository {
  List<Conta> listarContas() {
    return [
      Conta(
          id: '1',
          bancoId: 'nubank',
          descricao: 'Conta Principal',
          tipoConta: TipoConta.contaCorrente),
      Conta(
          id: '2',
          bancoId: 'bb',
          descricao: 'Conta Alternativa',
          tipoConta: TipoConta.contaCorrente),
      Conta(
          id: '3',
          bancoId: 'bradesco',
          descricao: 'Conta de Reservas',
          tipoConta: TipoConta.contaPoupanca),
      Conta(
          id: '4',
          bancoId: 'santander',
          descricao: 'Conta de Investimentos',
          tipoConta: TipoConta.contaInvestimento),
    ];
  }
}
