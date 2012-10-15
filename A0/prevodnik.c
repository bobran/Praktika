#include <stdio.h>
#include <fstream>
using namespace std;

int main (){
    double x, y;
    ofstream output;
    ifstream input; 
    input.open("spect2.dat");
    output.open("output2.txt");
    for (int i=0; i<=7500; i++) {
        input >> x;
        output << 0.411570*i-0.159852 << "\t" << x << "\n";
    }
    output.close();
    input.close();



    return 0;
}
