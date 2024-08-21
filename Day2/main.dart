import 'data.dart';

void main() {
  print(calculatePartOne(taskInput));
  print(calculatePartTwo(taskInput));
}

int calculatePartOne(String input) {
  final inputs = input.split('\n');
  int result = 0;

  for (String inp in inputs) {
    result += check(inp);
  }

  return result;
}

int check(String input) {
  final split1 = input.split(':');
  final split2 = split1[0].split(' ');
  final gameId = int.tryParse(split2[1]) ?? 0;
  final games = split1[1].split(';');
  for (String game in games) {
    final cubes = game.split(',');
    for (String cube in cubes) {
      final lastSplit = cube.split(' ');
      final value = int.tryParse(lastSplit[1]) ?? 0;
      switch (lastSplit[2]) {
        case 'red':
          if (value <= 12) {
            continue;
          } else {
            return 0;
          }
        case 'green':
          if (value <= 13) {
            continue;
          } else {
            return 0;
          }
        case 'blue':
          if (value <= 14) {
            continue;
          } else {
            return 0;
          }
      }
    }
  }
  return gameId;
}

int calculatePartTwo(String input) {
  final inputs = input.split('\n');
  int result = 0;

  for (String inp in inputs) {
    result += check2(inp);
  }

  return result;
}

int check2(String input) {
  final split1 = input.split(':');
  final games = split1[1].split(';');
  int red = 1;
  int green = 1;
  int blue = 1;
  for (String game in games) {
    final cubes = game.split(',');
    for (String cube in cubes) {
      final lastSplit = cube.split(' ');
      final value = int.tryParse(lastSplit[1]) ?? 0;
      switch (lastSplit[2]) {
        case 'red':
          red = red < value ? value : red;
          continue;
        case 'green':
          green = green < value ? value : green;
          continue;
        case 'blue':
          blue = blue < value ? value : blue;
          continue;
      }
    }
  }
  return red * green * blue;
}
