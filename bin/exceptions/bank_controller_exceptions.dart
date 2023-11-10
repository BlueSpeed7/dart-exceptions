class SenderIdInvalidException implements Exception {
  static const String report = "SenderIdInvalidException";
  String idSender;

  SenderIdInvalidException({required this.idSender});

  @override
  String toString() {
    return "$report\nO ID $idSender do remetente não é um ID válido.";
  }
}

class ReceiverIdInvalidException implements Exception {
  static const String report = "ReceiverIdInvalidException";
  String idReceiver;

  ReceiverIdInvalidException({required this.idReceiver});

  @override
  String toString() {
    return "$report\nO ID $idReceiver do destinatário não é um ID válido.";
  }
}

class SenderNotAuthenticatedException implements Exception {
  static const String report = "SenderNotAuthenticatedException";
  String idSender;

  SenderNotAuthenticatedException({required this.idSender});

  @override
  String toString() {
    return "$report\nO usuário remetente de ID $idSender não está autenticado.";
  }
}

class ReceiverNotAuthenticatedException implements Exception {
  static const String report = "ReceiverNotAuthenticatedException";
  String idReceiver;

  ReceiverNotAuthenticatedException({required this.idReceiver});

  @override
  String toString() {
    return "$report\nO usuário destinatário de ID $idReceiver não está autenticado.";
  }
}

class SenderBalanceLowerThanAmountException implements Exception {
  static const String report = "SenderBalanceLowerThanAmountException";
  String idSender;
  double senderBalance, amount;

  SenderBalanceLowerThanAmountException({
    required this.idSender,
    required this.senderBalance,
    required this.amount,
  });

  @override
  String toString() {
    return "$report\nO usuário de ID $idSender tentou enviar $amount porém o saldo da sua conta é $senderBalance.";
  }
}
