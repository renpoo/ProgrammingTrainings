//
//  main.cpp
//  Problem-01a
//
//  Created by Renpoo on 2021/05/18.
//

#include <stdio.h>
#include <string.h>
#include <iostream>
#include <gmp.h>
#include <gmpxx.h>

int main(int argc, const char * argv[]) {

    mpz_class result = 1;
    std::cout << result << std::endl;

    for ( int c = 0; c < 100; c++ ) {
        result *= 2;
        std::cout << result << std::endl;
    }

    return 0;
}
