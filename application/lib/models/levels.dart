class Level{
  final String image;
  final int id;
  final String title;
  Level({
    this.id,
    this.image,
    this.title
  });
}

List<Level> levels = [
  Level(
    id: 1,
    image: "assets/niveles/basico.jpg",
    title: "Básico"
  ),
  Level(
    id: 2,
    image: "assets/niveles/intermedio.jpg",
    title: "Intermedio"
  ),
  Level(
    id: 3,
    image: "assets/niveles/avanzado.jpg",
    title: "Avanzado"
  ),
  

];