

class User{
  String firstname, lastname, email, image, username, password;
  String token;
  Map<String, double> performance;
  User({
    this.token,
    this.username,
    this.password,
    this.firstname,
    this.lastname,
    this.email,
    this.image,
    this.performance,
  });
}
/*
User user = User(
  id: 1,
  username: "emilia", //
  password: "emilia", //
  firstname: "Emilia",
  lastname: "Fernandez",
  correo: "EmiliaFernandez@gmail.com",
  image: "assets/users/user.jpg",
  record: 203,
  performance: {
    "1": 20.0,
    "2": 30.0,
    "3": 40.0,
    "4": 0.0,
    "5": 0.0,
  }
);
*/