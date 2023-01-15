import 'dart:io';

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
          outputResult = numbers[0] + numbers[1];
          printSuccess("Addition result is : $outputResult");
        } catch (e) {
          printError("Invalid input ! Please try again with a number.");
        }
        break;
      case "2":
        try {
          List numbers = getNumbers();
          outputResult = numbers[0] - numbers[1];
          printSuccess("Subtraction result is : $outputResult");
        } catch (e) {
          printError("Invalid input ! Please try again with a number.");
        }
        break;
      case "3":
        try {
          List numbers = getNumbers();
          outputResult = numbers[0] * numbers[1];
          printSuccess("Multiplication result is : $outputResult");
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
            outputResult = numbers[0] / numbers[1];
            printSuccess("Division result is : $outputResult");
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

double sum(double n1, double n2) {
  return n1 + n2;
}

double mult(double n1, double n2) {
  return n1 * n2;
}

double div(double n1, double n2) {
  return n1 / n2;
}

double sub(double n1, double n2) {
  return n1 - n2;
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
