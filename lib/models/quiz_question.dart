//Act as a blueprint!
class QuizQuestion {
  const QuizQuestion(this.quest, this.answers);

  final String quest;
  final List<String> answers;

  List<String> shuffledfun(){
    final shuffledlist = List.of(answers); //take one item at a time and stored in that list
    shuffledlist.shuffle(); //shuffled them
    return shuffledlist; //return the new list
  }
}

// class abc {
//   // List<QuizQuestion> questions = [
//   //   const QuizQuestion("hello", ["a", "b"]),
//   // ];
// }
