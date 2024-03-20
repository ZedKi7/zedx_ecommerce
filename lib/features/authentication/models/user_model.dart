import '../../../utils/formatters/formatter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  // Keep those values final which you don't want to update
  final String id;
  String firstName;
  String lastName;
  final String username;
  final String email;
  String phoneNumber;
  String profilePicture;

  /// Constructor for UserModel
  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  /// Helper function to get the full name
  String get fullName => '$firstName $lastName';

  /// Helper function to format the phone number
  String get formattedPhoneNo => ZFormatter.formatPhoneNumber(phoneNumber);

  /// Static function to get the full name parts which are the first name and last name
  static List<String> nameParts(fullName) => fullName.split(" ");

  /// Static function to generate a username from the full name
  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";
    String camelCaseUsername = "$firstName$lastName";
    String usernameWithPrefix = "cwt_$camelCaseUsername";
    return usernameWithPrefix;
  }

  /// Static function to create an empty user model
  static UserModel empty() => UserModel(id: "", firstName: "", lastName: "", username: "", email: "", phoneNumber: "", profilePicture: "");

  /// Convert model to JSON structure for storing data in Firebase
  Map<String, dynamic> toJson() => {
        'FirstName': firstName,
        'LastName': lastName,
        'Username': username,
        'Email': email,
        'PhoneNumber': phoneNumber,
        'ProfilePicture': profilePicture,
      };

  /// Factory method to create a UserModel from a Firestore document snapshot
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    if (documentSnapshot.data() != null) {
      final data = documentSnapshot.data()!;
      return UserModel(
        id: documentSnapshot.id,
        firstName: data["firstName"] ?? '',
        lastName: data["lastName"] ?? '',
        username: data["username"] ?? '',
        email: data["email"] ?? '',
        phoneNumber: data["phoneNumber"] ?? '',
        profilePicture: data["profilePicture"] ?? '',
      );
    }
    throw Exception("Failed to create UserModel from snapshot."); // Add throw statement
  }
}
