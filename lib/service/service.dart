import 'package:arjun_portfolio/service/portfolio_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final String collectionName = "portfolios";

  // Create or Update Portfolio
  Future<void> addPortfolio(PortfolioModel portfolio,
      {String? documentId}) async {
    try {
      await _db
          .collection(collectionName)
          .doc(documentId ??
              "4Cb9u87yM89ErJB3ple9") // Use default if not provided
          .set(portfolio.toJson());
    } catch (e) {
      print("Error adding/updating portfolio: $e");
      throw e;
    }
  }

  // Read Portfolio
  Future<List<PortfolioModel>> getPortfolios() async {
    try {
      QuerySnapshot querySnapshot = await _db.collection(collectionName).get();

      return querySnapshot.docs.map((doc) {
        return PortfolioModel.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      print("Failed to fetch portfolios: $e");
      throw e;
    }
  }

  // Update Portfolio
  Future<void> updatePortfolio(
      String documentId, Map<String, dynamic> updatedData) async {
    try {
      await _db.collection(collectionName).doc(documentId).update(updatedData);
    } catch (e) {
      print("Error updating portfolio: $e");
      throw e;
    }
  }
}




// {
//   "personal_info": {
//     "name": "John Doe",
//     "title": "Full-Stack Developer",
//     "about": "",
//     "email": "johndoe@example.com",
//     "phone": "+1234567890",
//     "linkedin": "https://linkedin.com/in/johndoe",
//     "github": "https://github.com/johndoe",
//     "whatsapp": "jjdhhdh",
//     "instagram":"",
//     "x":"",
//     "cv_url": ""
//   },
//   "skills": [
//     {
//       "imageUrl": "",
//       "title": "",
//       "description": "",
//       "web_url": ""
//     }
//   ],
//   "experience": [
//     {
//       "company": "TechCorp",
//       "location": "",
//       "role": "Senior Software Engineer",
//       "start_date": "2021-06-01",
//       "end_date": "Present",
//       "total":"",
//       "url": "",
//       "responsibilities": 
//         "Developed and maintained full-stack applications using React.js and Node.js."
//     }
//   ],
//   "projects": [
//     {
//       "name": "E-Commerce Platform",
//       "image_url": "",
//       "description": "Built a full-fledged e-commerce website with user authentication, cart, and payment integration.",
//       "technologies": ["React.js", "Node.js", "MongoDB", "Stripe API"],
//       "repository": "https://github.com/johndoe/ecommerce"
//     }
//   ]
// }

