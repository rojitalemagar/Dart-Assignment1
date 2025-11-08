abstract class BankAccount {
  // Private fields
  int _accNumber;
  String _accHolderName;
  double _balance;

  // Transaction history
  final List<String> _transactionHistory = [];

  // Constructor
  BankAccount({
    required int accNumber,
    required String accHolderName,
    required double balance,
  })  : _accNumber = accNumber,
        _accHolderName = accHolderName,
        _balance = balance;

  // Getters and setters
  int get accNumber => _accNumber;
  set accNumber(int value) => _accNumber = value;

  String get accHolderName => _accHolderName;
  set accHolderName(String value) => _accHolderName = value;

  double get balance => _balance;
  set balance(double value) => _balance = value;

  List<String> get transactionHistory => _transactionHistory;

  // Abstract methods
  void withdraw(double amount);
  void deposit(double amount);

  // Add transaction
  void addTransaction(String transaction) {
    _transactionHistory.add(transaction);
  }

  // Display account info
  void displayInfo() {
    print("Account Number: $_accNumber");
    print("Account Holder: $_accHolderName");
    print("Balance: \$$_balance");
  }

  // Display transaction history
  void displayTransactionHistory() {
    if (_transactionHistory.isEmpty) {
      print("No transactions yet.");
    } else {
      print("Transaction History for $_accNumber:");
      for (var t in _transactionHistory) {
        print(t);
      }
    }
  }
}
