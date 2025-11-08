// import 'bank_account.dart';
import 'checking_account.dart';
import 'saving_account.dart';
import 'premium_account.dart';
import 'student_account.dart';
import 'bank.dart';

void main() {
  Bank myBank = Bank();

  // Checking Account
  var checking = CheckingAccount(
    accNumber: 101,
    accHolderName: 'Ayusha Thapa',
    balance: 5000,
  );
  myBank.addAccount(checking);

  // Saving Account
  var saving = SavingAccount(
    accNumber: 102,
    accHolderName: 'Ankit Gurung',
    balance: 10000,
  );
  myBank.addAccount(saving);

  // Premium Account
  var premium = PremiumAccount(
    accNumber: 103,
    accHolderName: 'Bibek Shrestha',
    balance: 15000,
  );
  myBank.addAccount(premium);

  // Student Account
  var student = StudentAccount(
    accNumber: 104,
    accHolderName: 'Nirjal Kafle',
    balance: 3000,
  );
  myBank.addAccount(student);

  // Perform operations
  checking.deposit(2000);
  checking.withdraw(8000); // triggers overdraft

  saving.withdraw(1000);
  saving.withdraw(200);
  saving.withdraw(100);
  saving.withdraw(50); // limit exceeded

  premium.withdraw(6000); // below min balance
  premium.deposit(2000);

  student.deposit(2500); // exceeds max balance
  student.withdraw(1000);

  // Transfer money
  myBank.transfer(101, 102, 1000);

  // Apply interest
  myBank.applyMonthlyInterest();

  // Generate report
  myBank.generateReport();

  // Display transaction history
  checking.displayTransactionHistory();
  saving.displayTransactionHistory();
  premium.displayTransactionHistory();
  student.displayTransactionHistory();
}
