

class User{
  final String firstname, lastname, correo, image, username, password;
  final int id, record;
  Map<int, double> performance;
  User({
    this.id,
    this.username,
    this.password,
    this.firstname,
    this.lastname,
    this.correo,
    this.image,
    this.record,
    this.performance,
  });
}

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
    1: 20.0,
    2: 30.0,
    3: 40.0,
    4: 0.0,
    5: 0.0,
  }
);
