import 'controllers/bank_controller.dart';
import 'exceptions/bank_controller_exceptions.dart';
import 'models/account.dart';
import 'dart:math';

void testingNullSafety() {
  Account? myAccount;
  Account minhaConta = Account(name: "Marinho", balance: 470, isAuthenticated: true);

  // Simulando uma comunicação externa
  Random rng = Random();
  if (rng.nextInt(10) % 2 == 0) {
    myAccount = Account(name: "Fernando", balance: 270, isAuthenticated: true);
    minhaConta.createdAt = DateTime.now();
  }
  print(myAccount.runtimeType);
  print(myAccount != null ? myAccount.balance :  "Conta nula.");
  print(myAccount?.name);
  print(minhaConta.createdAt);
  if (minhaConta.createdAt != null) {
    print(minhaConta.createdAt!.day);
  }
}

void main() {
  testingNullSafety();

  // Criando o banco
  BankController bankController = BankController();

  // Adicionando contas
  bankController.addAccount(
      id: "Ricarth",
      account: Account(
          name: "Ricarth Lima", balance: 777.96, isAuthenticated: true));

  bankController.addAccount(
      id: "Kako",
      account:
          Account(name: "Caio Couto", balance: 420.5, isAuthenticated: true));

  // Fazendo transferência
  try {
    bool result = bankController.makeTransfer(
        idSender: "Kako", idReceiver: "Ricarth", amount: 400);
    // Observando resultado
    if (result == true) {
      print("Transação concluída com sucesso!");
    }
  } on SenderIdInvalidException catch (e) {
    print(e);
  } on ReceiverIdInvalidException catch (e) {
    print(e);
  } on SenderNotAuthenticatedException catch (e) {
    print(e);
  } on ReceiverNotAuthenticatedException catch (e) {
    print(e);
  } on SenderBalanceLowerThanAmountException catch (e) {
    print(e);
  } on Exception {
    print("Algo deu errado.");
  }
}
