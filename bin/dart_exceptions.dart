import 'controllers/bank_controller.dart';
import 'exceptions/bank_controller_exceptions.dart';
import 'models/account.dart';

void main() {
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
