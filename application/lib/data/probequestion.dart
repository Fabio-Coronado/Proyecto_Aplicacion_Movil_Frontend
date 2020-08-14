import 'package:application/models/question.dart';

List<Question> questions = [
  
  new Question(
  id: 1,
  image: "",
  content: "En una grafo completo G, que tiene 12 vértices, ¿cuántas aristas hay?",
  categorie: 3,
  level: 1,
  alternativas: alternativa1,
  correct: 2
),
  new Question(
  id: 2,
  image: "",
  content: "¿Cuál es el número romano para 500?",
  categorie: 3,
  level: 1,
  alternativas: alternativa2,
  correct: 4
),

 new Question(
  id: 3,
  image: "",
  content: "Al número entero más cercano, ¿cuántos radianes hay en un círculo completo?",
  categorie: 3,
  level: 1,
  alternativas: alternativa3,
  correct: 1
)

];

List<Alternative> alternativa1 = [
  new Alternative(
    number: 1,
    content: "67"
  ),
    new Alternative(
    number: 2,
    content: "66"
  ),
    new Alternative(
    number: 3,
    content: "34"
  ),
    new Alternative(
    number: 4,
    content: "11"
  )
];


List<Alternative> alternativa2 = [
  new Alternative(
    number: 1,
    content: "L"
  ),
    new Alternative(
    number: 2,
    content: "C"
  ),
    new Alternative(
    number: 3,
    content: "X"
  ),
    new Alternative(
    number: 4,
    content: "D"
  )
];


List<Alternative> alternativa3 = [
  new Alternative(
    number: 1,
    content: "6"
  ),
    new Alternative(
    number: 2,
    content: "3"
  ),
    new Alternative(
    number: 3,
    content: "2"
  ),
    new Alternative(
    number: 4,
    content: "4"
  )
];