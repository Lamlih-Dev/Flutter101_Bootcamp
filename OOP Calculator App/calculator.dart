import 'dart:io';

class Operation {
  //Properties
  double? number1;
  double? number2;

  //Constructor
  Operation(double number1, double number2) {
    this.number1 = number1;
    this.number2 = number2;
  }

  //Calcul Method
  calcul() {}
}

class Addition extends Operation {
  Addition(double number1, double number2) : super(number1, number2) {}

  @override
  calcul() {
    return (super.number1! + super.number2!);
  }
}

class Subtraction extends Operation {
  Subtraction(double number1, double number2) : super(number1, number2) {}

  @override
  calcul() {
    return (super.number1! - super.number2!);
  }
}

class Multiplication extends Operation {
  Multiplication(double number1, double number2) : super(number1, number2) {}

  @override
  calcul() {
    return (super.number1! * super.number2!);
  }
}

class Division extends Operation {
  Division(double number1, double number2) : super(number1, number2) {}

  @override
  calcul() {
    return (super.number1! / super.number2!);
  }
}

List getNumbers() {
  List numbers = [];
  printWarning("Please enter the first number: ");
  numbers.add(double.parse(stdin.readLineSync()!));
  printWarning("Please enter the second number: ");
  numbers.add(double.parse(stdin.readLineSync()!));

  return numbers;
}

//Helpers
void printSuccess(String text) {
  print('\x1B[32m$text\x1B[0m');
}

void printError(String text) {
  print('\x1B[31m$text\x1B[0m');
}

void printWarning(String text) {
  print('\x1B[33m$text\x1B[0m');
}

void main() {
  String result;
  double outputResult = 0;
  printSuccess(
      "\n************************************************\n* Hello to the Ahmed LAMLIH's calculator app ! *\n************************************************\n");
  print(
      " -> 1. Addition\n -> 2. Subtraction\n -> 3. Multiplication\n -> 4. Division");
  do {
    printWarning(
        "Please choose the equivalent number of your operation (type 'exit' to quite the app): ");
    result = (stdin.readLineSync()!).toLowerCase();
    switch (result) {
      case "1":
        try {
          List numbers = getNumbers();
          Addition addition = Addition(numbers[0], numbers[1]);
          printSuccess("Addition result is : ${addition.calcul()}");
        } catch (e) {
          printError("Invalid input ! Please try again with a number.");
        }
        break;
      case "2":
        try {
          List numbers = getNumbers();
          Subtraction subtraction = Subtraction(numbers[0], numbers[1]);
          printSuccess("Subtraction result is : ${subtraction.calcul()}");
        } catch (e) {
          printError("Invalid input ! Please try again with a number.");
        }
        break;
      case "3":
        try {
          List numbers = getNumbers();
          Multiplication multiplication =
              Multiplication(numbers[0], numbers[1]);
          printSuccess(
              "Multiplication result is : ${multiplication.calcul()}");
        } catch (e) {
          printError("Invalid input ! Please try again with a number.");
        }
        break;
      case "4":
        try {
          List numbers = getNumbers();
          if (numbers[1] == 0) {
            printError("The second number should be > than 0");
          } else {
            Division division = Division(numbers[0], numbers[1]);
            printSuccess("Division result is : ${division.calcul()}");
          }
        } catch (e) {
          printError("Invalid input ! Please try again with a number.");
        }
        break;
      default:
        if (result != "exit") {
          printError("Please enter a valid number between 1 and 4.");
        } else {
          printSuccess("We will miss you ! Thank you for using our app.");
        }
        break;
    }
  } while (result != "exit");
}
