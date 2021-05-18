//
//  main.cpp
//  Problem-02
//
//  Created by Renpoo on 2021/05/18.
//

#include <stdio.h>
#include <string.h>
#include <iostream>
#include <gmp.h>
#include <gmpxx.h>


mpz_class custom_comb( int N, int K ) {
    mpz_class numerator   = 1;
    mpz_class denominator = 1;

    
    if ( K * 2 > N ) {
        K = N - K;
    }
    
    
    for ( int i = 1; i <= K; i++ ) {
        denominator *= i;
    }
    
    for ( int i = N - K + 1; i <= N; i++ ) {
        numerator *= i;
    }

    mpz_class result = 0;
    result = numerator / denominator;

    return( result );
}


int main( int argc, char* argv[] ) {
    int N;
    int K;
    std::string result;

    std::cout << "Input Numbers for Combinatrics? : ";
    std::cin >> N >> K;
    
    result = custom_comb( N, K ).get_str();
    
    std::cout << N << "_C_" << K << " = " << result << std::endl;
    
    return( 0 );
}
