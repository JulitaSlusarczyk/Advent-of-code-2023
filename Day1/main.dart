import 'data.dart';

void main() {
  print(calculatePartOne(taskInput));
  print(calculatePartTwo(taskInput));
}

int calculatePartOne(String input) {
  final inputs = input.split('\n');
  String stringNumber='';
  int result = 0;
  
  for(String inp in inputs) {
    stringNumber = '';
    for(int i=0; i<inp.length; i++) {
      stringNumber += (int.tryParse(inp[i]) ?? '').toString();
    }
    result += int.parse(stringNumber[0]+stringNumber[stringNumber.length-1]);
  }
  
  return result;
}

int calculatePartTwo(String input) {
  final inputs = input.split('\n');
  int result = 0;
  
  for(String inp in inputs) {
    result+=returnValue(inp);
  }
  
  return result;
}

int returnValue(String input){
  RegExp exp = RegExp(r"(?=(one|two|three|four|five|six|seven|eight|nine|[0-9]))");
  String result = '';
  for (var str in exp.allMatches(input)) {
    int? convert = convertStrToNum(str[1] ?? '0');
    result += convert != null 
      ? convert.toString() 
      : '';
  }
  return int.parse(result[0]+result[result.length-1]);
}

int? convertStrToNum(String str) {
 var number = <String, int>{
   'one': 1, 
   'two': 2,
   'three': 3,
   'four': 4,
   'five': 5,
   'six': 6,
   'seven': 7,
   'eight': 8,
   'nine': 9,
 };
 return int.tryParse(str) ?? number[str];
}

