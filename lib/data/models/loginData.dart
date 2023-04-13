/// Modèle de données pour l'authentification (récupération des données de l'utilisateur).
class LoginData {
  int id;
  String email;
  String firstName;
  String lastName;

  LoginData(this.id, this.email, this.firstName, this.lastName);

  LoginData.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        email = json['email'],
        firstName = json['firstName'],
        lastName = json['lastName'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'firstName': firstName,
        'lastName': lastName,
      };
}
