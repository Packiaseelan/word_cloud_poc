part of '../coordinator/answer_board_coordinator.dart';

class AnswerBoardViewModel {
  final _sizes = const [50, 30, 20, 15, 12, ];
  final _colors = const [
    Color(0xFFFFC108),
    Color(0xFF13B9FD),
    Color(0xFF0175C2),
    Color(0xFF02569B),
    Color.fromARGB(255, 34, 72, 129),
    Color(0xFF60646B),
    Color(0xFF202124),
  ];

  List<ScatterModel> process(List<AnswerModel> answers) {
    final sorted = _getHashMap(answers);
    return _mapToScatterModel(sorted);
  }

  Map<String, dynamic> _getHashMap(List<AnswerModel> answers) {
    var hash = <String, int>{};
    for (AnswerModel answer in answers) {
      final text = answer.answerText ?? "";
      final str = text.trim().toLowerCase();
      var value = hash[str];
      if (value != null) {
        hash[str] = value + 1;
      } else {
        hash[str] = 1;
      }
    }
    //order value by desc
    final list = hash.entries.toList()..sort((b, a) => a.value.compareTo(b.value));
    hash.clear();
    hash.addEntries(list);
    return hash;
  }

  List<ScatterModel> _mapToScatterModel(Map<String, dynamic> hash) {
    List<ScatterModel> smodel = [];
    int counter = 0;
    int? previousValue;
    hash.forEach((key, value) {
      
      final randomInt = _getRandom();
      final rotate = randomInt % 2 == 0;
      final colorIndex = _getRandom(max: _colors.length);

      if (previousValue == value) {
        if (counter > 0)  {
          counter --;
        }
      }
      final size = counter >= _sizes.length ? _sizes.last : _sizes[counter];
      final scater = ScatterModel(
        title: key,
        color: _colors[colorIndex],
        rorate: rotate,
        size: size
      );
      smodel.add(scater);
      previousValue = value;
      counter ++;
    });
    return smodel;
  }

  int _getRandom({int? max}) {
    Random r = Random();
    return r.nextInt(max ?? 100000);
  }
}
