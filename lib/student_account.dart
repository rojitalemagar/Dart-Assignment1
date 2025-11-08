import 'bank_account.dart';

class StudentAccount extends BankAccount {
  final double maxBalance = 5000;

  StudentAccount({
    required super.accNumber,
    required super.accHolderName,
    required super.balance,
  });

  @override
  void deposit(double amount) {
    if (balance + amount > maxBalance) {
      print("Cannot deposit. Maximum balance limit of \$$maxBalance reached!");
      return;
    }
    balance += amount;
    addTransaction("Deposited: \$${amount.toStringAsFixed(2)}");
    print("Deposited \$${amount.toStringAsFixed(2)} successfully!");
  }

  @override
  void withdraw(double amount) {
    if (balance - amount < 0) {
      print("Insufficient balance!");
      return;
    }
    balance -= amount;
    addTransaction("Withdrew: \$${amount.toStringAsFixed(2)}");
    print("Withdrew \$${amount.toStringAsFixed(2)} successfully!");
  }
}
