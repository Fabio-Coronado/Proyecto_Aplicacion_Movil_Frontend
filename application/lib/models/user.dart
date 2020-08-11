class User{
  final String firstname, lastname, correo, image, username, password;
  final int id, record;
  User({
    this.id,
    this.username,
    this.password,
    this.firstname,
    this.lastname,
    this.correo,
    this.image,
    this.record
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
  record: 203
);
