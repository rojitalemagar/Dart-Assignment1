import 'bank_account.dart';
import 'interest_bearing.dart';

class SavingAccount extends BankAccount implements InterestBearing {
  final double minBalance = 500;
  final double interestRate = 2; // percent per month
  int _withdrawalsThisMonth = 0;
  final int withdrawalLimit = 3;

  SavingAccount({
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
    if (_withdrawalsThisMonth >= withdrawalLimit) {
      print(
          "Withdrawal limit of $withdrawalLimit reached for this month!");
      return;
    }

    if (balance - amount < minBalance) {
      print("Cannot withdraw. Minimum balance requirement of \$$minBalance!");
      return;
    }

    balance -= amount;
    _withdrawalsThisMonth++;
    addTransaction("Withdrew: \$${amount.toStringAsFixed(2)}");
    print("Withdrew \$${amount.toStringAsFixed(2)} successfully!");
  }

  void resetMonthlyWithdrawal() {
    _withdrawalsThisMonth = 0;
  }

  @override
  double calculateInterest(double timeInMonths) {
    return (balance * interestRate * timeInMonths) / 100;
  }
}
