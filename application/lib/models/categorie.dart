
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
    image: "assets/categorias/cienciaynaturaleza.jpg",
    title: "Ciencia y Naturaleza"
  ),
  Categorie(
    id: 3,
    image: "assets/categorias/animales.jpg",
    title: "Animales"
  ),
  Categorie(
    id: 4,
    image: "assets/categorias/geografia.jpg",
    title: "Geografía"
  ),
  Categorie(
    id: 5,
    image: "assets/categorias/informatica.jpg",
    title: "Computación"
  ),

];
