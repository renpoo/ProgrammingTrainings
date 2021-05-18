//
//  main.cpp
//  Problem-08
//
//  Created by Renpoo on 2021/05/18.
//

#include <iostream>


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


//Counter Acc; // Not Desired Global Variable Use.


////unsigned long Accumulate( int N ) {
//unsigned long Accumulate( int N, Counter Acc ) {
////    Counter Acc;
//
//    Acc.set( Acc.get() + N );
//
//    return( Acc.get() );
//}


unsigned long Accumulate( int N, Counter* Acc ) {
//    Counter Acc;
    
    Acc->set( Acc->get() + N );
    
    return( Acc->get() );
}


int main(int argc, const char * argv[]) {

    int N = 1;

    Counter Acc;
    
    while ( N != 0 ) {
        std::cout << "Input Number to accumulate? : ";
        std::cin >> N;

//        std::cout << Accumulate( N ) << std::endl;
        std::cout << Accumulate( N, &Acc ) << std::endl;
    }

    return 0;
}
