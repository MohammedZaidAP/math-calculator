#include <iostream>
#include <mathlib2.h>

int main() {
    double a, b;
    char operation;
    std::cout << "Enter the first number: ";
    std::cin >> a;
    std::cout << "Enter the second number: ";
    std::cin >> b;
    std::cout << "Enter the operation (+, -, *, /): ";
    std::cin >> operation;

    switch (operation) {
        case '+':
            std::cout << math2::add(a, b) << std::endl;
            break;
        case '-':
            std::cout << math2::subtract(a, b) << std::endl;
            break;
        case '*':
            std::cout << math2::multiply(a, b) << std::endl;
            break;
        case '/':
            std::cout << math2::divide(a, b) << std::endl;
            break;
        default:
            std::cout << "Invalid operation" << std::endl;
            break;
    }
    return 0;
}
