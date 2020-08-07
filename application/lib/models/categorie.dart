
class Categorie{
  final String image, title;
  final int id;
  Categorie({
    this.id,
    this.image,
    this.title,
  });
}

List<Categorie> categories = [
  Categorie(
    id: 1,
    image: "assets/categorias/matematica.jpg",
    title: "Matemática",
  ),
  Categorie(
    id: 2,
    image: "assets/categorias/fisica.jpg",
    title: "Física"
  ),
  Categorie(
    id: 3,
    image: "assets/categorias/quimica.jpg",
    title: "Química"
  ),
  Categorie(
    id: 4,
    image: "assets/categorias/biologia.jpg",
    title: "Biología"
  ),
  Categorie(
    id: 5,
    image: "assets/categorias/informatica.jpg",
    title: "Informática"
  ),

];
