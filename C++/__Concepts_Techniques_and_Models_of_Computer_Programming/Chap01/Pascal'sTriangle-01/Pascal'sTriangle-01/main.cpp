//
//  main.cpp
//  Train-02
//
//  Created by Renpoo on 2021/05/16.
//

#include <iostream>
#include <vector>

typedef std::vector<unsigned int> ui_vec;

void print_vec( ui_vec L ) {
    for (int i = 0; i < L.size(); i++) {
        std::cout << L.at(i) << " ";
    }
    std::cout << std::endl;
}

ui_vec ShiftLeft( ui_vec L ) {
    unsigned long s = L.size();
    if ( s == 0 ) {
        return( ui_vec{ 0 } );
    } else {
        L.push_back( 0 );

        return( L );
    }
}

ui_vec ShiftRight( ui_vec L ) {
    ui_vec::iterator it;
    
    it = L.begin();
    it = L.insert( it, 0 );

    return( L );
}

ui_vec AddList( ui_vec L1, ui_vec L2 ) {

    ui_vec result = {};

    int s = L1.size();

    if ( s == L2.size() ) {
        
        for ( int i = 0; i < s; i++ ) {
            result.push_back( L1.at(i) + L2.at(i) );
        }
    }
    
    return( result );
}

ui_vec Pascal( unsigned int N ) {
    if ( N == 1 ) {
        return( ui_vec{ 1 } );
    } else {
        return( AddList( ShiftLeft( Pascal( N - 1 ) ), ShiftRight( Pascal( N - 1 ) ) ) );
    }
}

ui_vec FastPascal( unsigned int N ) {
    if ( N == 1 ) {
        return( ui_vec{ 1 } );
    } else {
        ui_vec L = FastPascal( N - 1 );
        return( AddList( ShiftLeft( L ), ShiftRight( L ) ) );
    }
}

int main(int argc, const char * argv[]) {
    
    unsigned int N = 0;
    
    std::cout << "Pascal(?) : ";
    std::cin >> N;

//    ui_vec result = Pascal( N );
    ui_vec result = FastPascal( N );

    print_vec( result );
    
    return 0;
}
