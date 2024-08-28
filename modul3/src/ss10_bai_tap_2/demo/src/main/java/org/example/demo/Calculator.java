package org.example.demo;

public class Calculator {
    public static float calculator(float firstNumber, float secondNumber,char Calculations){
        switch (Calculations) {
            case '+':
                return firstNumber + secondNumber;
            case '-':
                return firstNumber - secondNumber;
            case '*':
                return firstNumber * secondNumber;
            case '/':
                if (secondNumber != 0){
                    return firstNumber / secondNumber;
                }else {
                    throw new ArithmeticException("Số này không thể chia với số 0!!! đừng thử nữa");
                }
            default:
                throw new IllegalArgumentException("Không hợp lệ" + Calculations);
        }
    }
}
