class Option {
  Option({
    required this.id,
    required this.answer,
  });

  String id;
  String answer;

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
      id: json['id'],
      answer: json['answer'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'avatar': answer,
      };
}
