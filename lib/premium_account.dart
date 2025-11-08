import 'bank_account.dart';
import 'interest_bearing.dart';

class PremiumAccount extends BankAccount implements InterestBearing {
  final double minBalance = 10000;
  final double interestRate = 5; // percent per month

  PremiumAccount({
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
    if (balance - amount < minBalance) {
      print("Cannot withdraw. Minimum balance requirement of \$$minBalance!");
      return;
    }

    balance -= amount;
    addTransaction("Withdrew: \$${amount.toStringAsFixed(2)}");
    print("Withdrew \$${amount.toStringAsFixed(2)} successfully!");
  }

  @override
  double calculateInterest(double timeInMonths) {
    return (balance * interestRate * timeInMonths) / 100;
  }
}
