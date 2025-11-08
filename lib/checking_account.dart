import 'bank_account.dart';

class CheckingAccount extends BankAccount {
  final double overDraftFee = 35;

  CheckingAccount({
    required super.accNumber,
    required super.accHolderName,
    required super.balance,
  });

  @override
  void deposit(double amount) {
    balance += amount;
    addTransaction("Deposited: \$${amount.toStringAsFixed(2)}");
    print("Deposited \$${amount.toStringAsFixed(2)} successfully!");
  }

  @override
  void withdraw(double amount) {
    if (balance - amount < 0) {
      balance -= (amount + overDraftFee);
      addTransaction(
          "Withdrew: \$${amount.toStringAsFixed(2)} with overdraft fee \$${overDraftFee.toStringAsFixed(2)}");
      print(
          "Balance went below 0! \$${overDraftFee.toStringAsFixed(2)} overdraft fee applied.");
    } else {
      balance -= amount;
      addTransaction("Withdrew: \$${amount.toStringAsFixed(2)}");
      print("Withdrew \$${amount.toStringAsFixed(2)} successfully!");
    }
  }
}
