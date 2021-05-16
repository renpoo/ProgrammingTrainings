//
//  main.cpp
//  Train-01
//
//  Created by Renpoo on 2021/05/16.
//

#include <stdio.h>
#include <string.h>
#include <iostream>
#include <gmp.h>
#include <gmpxx.h>


mpz_class custom_fact(mpz_class N) {
    if ( N == 0 ) {
        return( 1 );
    } else {
        return( N * custom_fact( N - 1 ) );
    }
}

mpz_class custom_comb(mpz_class N, mpz_class K) {
    mpz_class result = custom_fact( N ) / ( custom_fact( K ) * custom_fact( N - K ) );

    return( result );
}


int main( int argc, char* argv[] ) {
    mpz_class N;
    mpz_class K;
    std::string cmd;
    std::string buf1;
    std::string buf2;
    std::string result;

    std::cout << "Input Command Letter : (F)actorial or (C)ombinatorics? : ";
    std::cin >> cmd;

    if ( cmd == "F" ) {
        std::cout << "Input Number for Factorial? : ";
        std::cin >> buf1;
        
        N.set_str(buf1, 10);
        
        result = custom_fact( N ).get_str();
        
        std::cout << buf1 << "! = " << result << std::endl;
    } else if ( cmd == "C" ) {
        std::cout << "Input Numbers for Combinatrics? : ";
        std::cin >> buf1 >> buf2;
        
        N.set_str(buf1, 10);
        K.set_str(buf2, 10);
        
        result = custom_comb( N, K ).get_str();
        
        std::cout << buf1 << "_C_" << buf2 << " = " << result << std::endl;
    }
    
    return( 0 );
}
