class QuizQuestionStructure {
  const QuizQuestionStructure(this.question, this.answers);
  
  final String question;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    final List<String> shuffledListOfAnswers = List.of(answers);
    shuffledListOfAnswers.shuffle();
    return shuffledListOfAnswers;
  }
}