class Question{
  final String image, title, content;
  final int categorie, level, id, correct;
  final List<Alternative> alternativas;
  Question({
    this.id,
    this.image,
    this.title,
    this.content,
    this.categorie,
    this.level,
    this.alternativas,
    this.correct
  });
}

class Alternative{
  final String content;
  final int number;
  Alternative({
    this.number,
    this.content
  });

}