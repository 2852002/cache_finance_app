import '../models/finance_model.dart';

class DataService {
  Future<FinanceData> fetchFinanceData() async {
    // Mocked data, replace with actual data fetching logic
    return FinanceData(
      totalCollectedAmount: 50000.0,
      totalCollectedUsers: 100,
      totalPendingAmount: 20000.0,
      totalPendingUsers: 50,
      totalAmount: 70000.0,
      totalUsers: 150,
    );
  }
}
