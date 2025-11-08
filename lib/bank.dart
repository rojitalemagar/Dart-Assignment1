import 'bank_account.dart';
import 'interest_bearing.dart'; 

class Bank {
  final List<BankAccount> _accounts = [];

  void addAccount(BankAccount account) {
    _accounts.add(account);
    print("Account ${account.accNumber} added successfully!");
  }

  // Switched to a safer iteration-based findAccount method
  BankAccount? findAccount(int accNumber) {
    for (var acc in _accounts) {
      if (acc.accNumber == accNumber) return acc;
    }
    return null;
  }
  
  void transfer(int fromAccNum, int toAccNum, double amount) {
    var fromAcc = findAccount(fromAccNum);
    var toAcc = findAccount(toAccNum);

    if (fromAcc == null || toAcc == null) {
      print("One or both accounts not found!");
      return;
    }

    double oldBalance = fromAcc.balance;
    fromAcc.withdraw(amount);

    if (fromAcc.balance < oldBalance) {
      toAcc.deposit(amount);
      print("Transferred \$${amount.toStringAsFixed(2)} from $fromAccNum to $toAccNum successfully!");
    } else {
      print("Transfer failed due to insufficient funds!");
    }
  }

  void generateReport() {
    print("----- Bank Accounts Report -----");
    for (var acc in _accounts) {
      acc.displayInfo();
      print("-------------------------------");
    }
  }

  void applyMonthlyInterest() {
    for (var acc in _accounts) {
      if (acc is InterestBearing) {

        double interest = (acc as InterestBearing).calculateInterest(1);
        acc.deposit(interest);
        print("Applied \$${interest.toStringAsFixed(2)} interest to ${acc.accNumber}");
      }
    }
  }
}