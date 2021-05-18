//
//  main.cpp
//  Problem-05
//
//  Created by Renpoo on 2021/05/18.
//

#include <iostream>
#include <vector>


template<class F, class... A> struct lazy {
   F f; std::tuple<A...> a; lazy(F f, A... a) : f(f), a(a...) {}
   auto operator()() const { return std::apply(f, a); }
};

typedef std::vector<unsigned int> ui_vec;

void print_vec( ui_vec L ) {
    for (int i = 0; i < L.size(); i++) {
        std::cout << L.at(i) << " ";
    }
    std::cout << std::endl;
}

long long int SumList( ui_vec L ) {
    unsigned long s = L.size();
    if ( s == 0 ) {
        return( 0 );
    } else {
        long long int X = L.at(0);
        
        L.erase( L.begin() );
        
        return( X + SumList( L ) );
    }
}


int main(int argc, const char * argv[]) {

    int N = 0;
    
    std::cout << "Input Upper Limit Number to Sum? : ";
    std::cin >> N;
    
    ui_vec L( N );
    for ( int i = 0; i < N; i++ ) {
        L.at(i) = i + 1;
    }
    
    auto fn = lazy { SumList, L };

    long long int Sum = fn();

    std::cout << "Answer = " << Sum << std::endl;
    
    return 0;
}
