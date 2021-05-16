//
//  main.cpp
//  Pascal'sTriangle-05
//
//  Created by Renpoo on 2021/05/17.
//

#include <iostream>
#include <vector>


typedef std::vector<unsigned int> ui_vec;


class Counter {
private:
    unsigned long c;

public:
    Counter( void ) {
        c = 0;
    }
    
    ~Counter() {}
    
    unsigned long get( void ) {
        return( c );
    }
    
    void set( unsigned long val ) {
        c = val;
    }
    
    void up( void ) {
        c++;
    }

    void down( void ) {
        c--;
    }
};


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

template <typename T, typename Function> std::vector<T> OpList( ui_vec L1, ui_vec L2, Function&& func ) {

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
std::vector<T> GenericPascal( unsigned int N, Function&& func, Counter i ) {

    ui_vec result = {};
    
//    i.up();
    i.down();

    if ( N == 1 ) {
        result = ui_vec{ 1 };
    } else {
        std::vector<T> L = GenericPascal<uint>( N - 1, func, i );
        result = OpList<uint>( ShiftLeft( L ), ShiftRight( L ), func );
    }

    std::cout << "[" << i.get() << "]: ";
    print_vec( result );
    
    return( result );
}

int custom_Add( int x, int y ) {
    return( x + y );
}

int custom_XOR( int x, int y ) {
    return( x ^ y );
}


int main(int argc, const char * argv[]) {
    
    unsigned int N = 0;
    
    std::cout << "Pascal(?) : ";
    std::cin >> N;

    Counter i;
    
    i.set( N );

//    print_vec( GenericPascal<uint>( N, custom_Add, i ) );
//    print_vec( GenericPascal<uint>( N, custom_XOR, i ) );
    GenericPascal<uint>( N, custom_Add, i );
    
    return 0;
}



