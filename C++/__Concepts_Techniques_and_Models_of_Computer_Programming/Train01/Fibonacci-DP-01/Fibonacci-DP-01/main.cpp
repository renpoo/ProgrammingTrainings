//
//  main.cpp
//  Fibonacci-DP-01
//
//  Created by Koji SATO on 2021/05/18.
//

#include <iostream>
#include <stdbool.h>

long long int memo[1000] = {0, 1};
bool in_memo[1000] = {true, true};

long long int fib(unsigned int n) {
    if (!in_memo[n]) {
        memo[n] = fib(n - 1) + fib(n - 2);
        in_memo[n] = true;
    }
    return memo[n];
}

int main(int argc, const char * argv[]) {

    int N = 1;

    while ( N != 0 ) {
        std::cout << "Input Number for Fibonacci? : ";
        std::cin >> N;
        
        std::cout << "fib(" << N << ") = " << fib( N ) << std::endl;
    }

    return 0;
}
