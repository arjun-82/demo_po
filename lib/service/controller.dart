import 'package:arjun_portfolio/service/portfolio_model.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class PortfolioController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  RxList<PortfolioModel> portfolios = <PortfolioModel>[].obs;
  
  Future<void> fetchPortfolios() async {
    try {
      final snapshot = await _firestore.collection('portfolios').get();
      portfolios.value = snapshot.docs.map((doc) => PortfolioModel.fromJson(doc.data())).toList();
    } catch (e) {
      Get.snackbar('Error', 'Failed to load portfolios: $e');
    }
  }

  Future<void> addPortfolio(PortfolioModel portfolio) async {
    try {
      await _firestore.collection('portfolios').add(portfolio.toJson());
      fetchPortfolios();
      Get.snackbar('Success', 'Portfolio uploaded successfully!');
    } catch (e) {
      Get.snackbar('Error', 'Failed to upload portfolio: $e');
    }
  }

  Future<void> updatePortfolio(String docId, PortfolioModel portfolio) async {
    try {
      await _firestore.collection('portfolios').doc(docId).update(portfolio.toJson());
      fetchPortfolios();
      Get.snackbar('Success', 'Portfolio updated successfully!');
    } catch (e) {
      Get.snackbar('Error', 'Failed to update portfolio: $e');
    }
  }

  Future<void> deletePortfolio(String docId) async {
    try {
      await _firestore.collection('portfolios').doc(docId).delete();
      fetchPortfolios();
      Get.snackbar('Success', 'Portfolio deleted successfully!');
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete portfolio: $e');
    }
  }



  
}
