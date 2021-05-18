//
//  main.cpp
//  Problem-06
//
//  Created by Renpoo on 2021/05/16.
//

#include <iostream>
#include <vector>


typedef long long int TYPE;
typedef std::vector<TYPE> VecT;


template <typename T>
void print_vec( std::vector<T> L ) {
    for (int i = 0; i < L.size(); i++) {
        std::cout << L.at(i) << " ";
    }
    std::cout << std::endl;
}

template <typename T>
std::vector<T> ShiftLeft( std::vector<T> L ) {
    unsigned long s = L.size();
    if ( s == 0 ) {
        return( std::vector<T>{ 0 } );
    } else {
        L.push_back( 0 );

        return( L );
    }
}

template <typename T>
std::vector<T> ShiftRight( std::vector<T> L ) {
    VecT::iterator it;
    
    it = L.begin();
    it = L.insert( it, 0 );

    return( L );
}

template <typename T, typename Function>
std::vector<T> OpList( std::vector<T> L1, std::vector<T> L2, Function&& func ) {

    std::vector<T> result = {};

    int s = L1.size();

    if ( s == L2.size() ) {
        
        for ( int i = 0; i < s; i++ ) {
            result.push_back( func( L1.at(i), L2.at(i) ) );
        }
    }
    
    return( result );
}

template <typename T, typename Function>
std::vector<T> GenericPascal( unsigned int N, Function&& func ) {

    if ( N == 1 ) {
        return( std::vector<T>{ 1 } );
    } else {
        std::vector<T> L = GenericPascal<T>( N - 1, func );
        return( OpList<T>( ShiftLeft<T>( L ), ShiftRight<T>( L ), func ) );
    }
}


template <typename T>
T custom_Add( T x, T y ) {
    return( x + y );
}

template <typename T>
T custom_Sub( T x, T y ) {
    return( x - y );
}

template <typename T>
T custom_Mul( T x, T y ) {
    return( x * y );
}

template <typename T>
T custom_Mul2( T x, T y ) {
    return( (x + 1) * (y + 1) );
}

template <typename T>
T custom_XOR( T x, T y ) {
    return( x ^ y );
}


int main(int argc, const char * argv[]) {
    
    unsigned int N = 0;
    
    std::cout << "Pascal(?) : ";
    std::cin >> N;

    for ( int i = 1; i <= N; i++ ) {
        print_vec<TYPE>( GenericPascal<TYPE>( i, custom_Add<TYPE> ) );
//        print_vec<TYPE>( GenericPascal<TYPE>( i, custom_Sub<TYPE> ) );
//        print_vec<TYPE>( GenericPascal<TYPE>( i, custom_Mul<TYPE> ) );
//        print_vec<TYPE>( GenericPascal<TYPE>( i, custom_Mul2<TYPE> ) );
//        print_vec<TYPE>( GenericPascal<TYPE>( i, custom_XOR<TYPE> ) );
    }
    return 0;
}



