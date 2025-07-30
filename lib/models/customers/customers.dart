class CustomerModel {
  String userId;
  String customerId; // Unique ID for the customer
  String customerName;
  String phoneNo;
  String email;
  String idCardNumber;
  String productName;
  String plan;
  String advancePayment;
  String monthlyInstallmentFee;
  String customerLocation;
  String customerPostalAddress;
  List<Product> products;
  List<Evidence> evidence;

  CustomerModel({
    required this.userId,
    required this.customerId,
    required this.customerName,
    required this.phoneNo,
    required this.email,
    required this.idCardNumber,
    required this.productName,
    required this.plan,
    required this.advancePayment,
    required this.monthlyInstallmentFee,
    required this.customerLocation,
    required this.customerPostalAddress,
    required this.products,
    required this.evidence,
  });

  // Convert the object to a map
  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'customerId': customerId,
      'customerName': customerName,
      'phoneNo': phoneNo,
      'email': email,
      'idCardNumber': idCardNumber,
      'productName': productName,
      'plan': plan,
      'advancePayment': advancePayment,
      'monthlyInstallmentFee': monthlyInstallmentFee,
      'customerLocation': customerLocation,
      'customerPostalAddress': customerPostalAddress,
      'products': products.map((product) => product.toMap()).toList(),
      'evidence': evidence.map((e) => e.toMap()).toList(),
    };
  }

  // Create an object from a map
  factory CustomerModel.fromMap(Map<String, dynamic> map, String customerId) {
    return CustomerModel(
      userId: map['userId'],
      customerId: customerId,
      customerName: map['customerName'],
      phoneNo: map['phoneNo'],
      email: map['email'],
      idCardNumber: map['idCardNumber'],
      productName: map['productName'],
      plan: map['plan'],
      advancePayment: map['advancePayment'],
      monthlyInstallmentFee: map['monthlyInstallmentFee'],
      customerLocation: map['customerLocation'],
      customerPostalAddress: map['customerPostalAddress'],
      products: List<Product>.from(map['products'].map((x) => Product.fromMap(x))),
      evidence: List<Evidence>.from(map['evidence'].map((x) => Evidence.fromMap(x))),
    );
  }
}
class Product {
  String productId; // Unique ID for each product
  String productName;
  String productWarranty;
  double totalPrice;
  double installmentFee;

  Product({
    required this.productId,
    required this.productName,
    required this.productWarranty,
    required this.totalPrice,
    required this.installmentFee,
  });

  // Convert the object to a map
  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'productName': productName,
      'productWarranty': productWarranty,
      'totalPrice': totalPrice,
      'installmentFee': installmentFee,
    };
  }

  // Create an object from a map
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      productId: map['productId'],
      productName: map['productName'],
      productWarranty: map['productWarranty'],
      totalPrice: map['totalPrice'],
      installmentFee: map['installmentFee'],
    );
  }
}
class Evidence {
  String evidenceId; // Unique ID for each evidence
  String evidenceName;
  String evidenceIdcardNumber;
  String idCardFrontImage;
  String idCardBackImage;
  String designation;
  String occupation;

  Evidence({
    required this.evidenceId,
    required this.evidenceName,
    required this.evidenceIdcardNumber,
    required this.idCardFrontImage,
    required this.idCardBackImage,
    required this.designation,
    required this.occupation,
  });

  // Convert the object to a map
  Map<String, dynamic> toMap() {
    return {
      'evidenceId': evidenceId,
      'evidenceName': evidenceName,
      'evidenceIdcardNumber': evidenceIdcardNumber,
      'idCardFrontImage': idCardFrontImage,
      'idCardBackImage': idCardBackImage,
      'designation': designation,
      'occupation': occupation,
    };
  }

  // Create an object from a map
  factory Evidence.fromMap(Map<String, dynamic> map) {
    return Evidence(
      evidenceId: map['evidenceId'],
      evidenceName: map['evidenceName'],
      evidenceIdcardNumber: map['evidenceIdcardNumber'],
      idCardFrontImage: map['idCardFrontImage'],
      idCardBackImage: map['idCardBackImage'],
      designation: map['designation'],
      occupation: map['occupation'],
    );
  }
}