#include <stdio.h>
#include<fstream>
#include<iostream>
#include<math.h>

using namespace std;
char input[20];
char output[20];
int n1,n2;
const int dim=2;
typedef struct{
    double value[dim];
    double error[dim];
    char unit[dim][20];
    char mode[dim][20];
    int p[dim];
}TMereni;

typedef struct{
    double value;
    double error;
}THodnota;

TMereni Table1[100];
TMereni Table1b[100];
TMereni Table2[100];

double power(double x, int e) {
    double v=x;
    for (int i=2; i<=e; i++){
        v=v*x;
    }
    return v;
}


int load(char* file, TMereni Table[]) {
    int i=0;
    ifstream input(file);
    do{
        for (int j=0; j<=dim-1; j++) {
            input >> Table[i].value[j] >> Table[i].error[j];
        }
        i++;
    } while (Table[i].value[0]!=Table[i-1].value[0]);
    return i-2;
    //printf("%i\n",n);
}
void korekce(TMereni Table[]) {
    double Rv,Ra;
    for (int i=0; i<=n1; i++) {
        if (Table[i].value[0]<=1.5) {
            Rv=750;
        }else {
            if (Table[i].value[0]<=3) {
                Rv=1500;
            }else {
                if (Table[i].value[0]<=7.5) {
                    Rv=3725;
                }else {
                    if (Table[i].value[0]<=15) {
                        Rv=7500;
                    }else {
                        Rv=15000;
                    }
                }
            }
        }
        if (Table[i].value[0]<=7.5) {
            Ra=38;
        }else {
            if (Table[i].value[0]<=15) {
                Ra=20;
            } else {
                Ra=9.4;
            }
        }
    
        Table1b[i].value[0]=Table[i].value[1]*(Rv/(1000*(Table1[i].value[0]/Table1[i].value[1])+Rv));
        Table1b[i].error[0]=Table1b[i].value[0]*(0.001+(Table1[i].error[0]/Table1[i].value[0])+(Table1[i].error[1]/Table1[i].value[1]));
        Table1b[i].value[1]=1000*(Table1[i].value[0]/Table1[i].value[1])+Ra; 
        Table1b[i].error[1]=Table1b[i].value[1]*((Table1[i].error[1]/Table1[i].value[1])+0.001);
    }
}

main()
{
    n1=load("g1.dat", Table1);
    n2=load("g2.dat", Table2);
    korekce(Table1);
    for (int k=0; k<=n1; k++) {
        if (Table1[k].error[0]<0.01) {
            Table1[k].p[0]=3;
            Table1[k].p[1]=3;
        }else {
            Table1[k].p[0]=2;
            Table1[k].p[1]=2;
        }
        if (Table1b[k].error[0]<0.1) {
            Table1b[k].p[0]=2;
            Table1b[k].p[1]=0;
        }else {
            Table1b[k].p[0]=1;
            Table1b[k].p[1]=0;
        }
    }
    for (int k=0; k<=n2; k++) {
        if (Table2[k].error[0]<0.01) {
            Table2[k].p[0]=3;
            Table2[k].p[1]=1;
        }else {
            Table2[k].p[0]=2;
            Table2[k].p[1]=1;
        }
    }
    ofstream output2("g1.t", ios::out);
    output2.setf(ios::fixed,ios::floatfield);
    output2 << "$$\n\\begin{array}{|c|c|c|}\n\\hline\n";
    for(int i=0;i<=n1;i++){
    for (int j=0; j<=dim-1;j++) {
    output2.precision(Table1[i].p[j]);
    output2 << Table1[i].value[j]<<"\\pm ";
    output2.precision(Table1[i].p[j]);
    output2 << Table1[i].error[j] << "&" ;
    }
    output2.precision(0);
    output2<< 1000*(Table1[i].value[0]/Table1[i].value[1]) << "\\pm" << 1000*(Table1[i].value[0]/Table1[i].value[1])*((Table1[i].error[0]/Table1[i].value[0])+(Table1[i].error[1]/Table1[i].value[1]));
    output2 << "\\\\ \\hline\n";
    }
    output2 << "\\end{array}\n$$";
    output2.close();


    ofstream output("g2.t", ios::out);
    output.setf(ios::fixed,ios::floatfield);
    output << "$$\n\\begin{array}{|c|c|}\n\\hline\n";
    for(int i=0;i<=n1;i++){
    for (int j=0; j<=dim-1;j++) {
    output.precision(Table2[i].p[j]);
    output << Table2[i].value[j]<<"\\pm ";
    output.precision(Table2[i].p[j]);
    output << Table2[i].error[j];
    if(j<dim-1){
        output << "&" ;
    }
    }
    output << "\\\\ \\hline\n";
    }
    output << "\\end{array}\n$$";
    output.close();

    ofstream output3("g1b.t", ios::out);
    output3.setf(ios::fixed,ios::floatfield);
    output3 << "$$\n\\begin{array}{|c|c|}\n\\hline\n";
    for(int i=0;i<=n1;i++){
    for (int j=0; j<=dim-1;j++) {
    output3.precision(Table1b[i].p[j]);
    output3 << Table1b[i].value[j]<<"\\pm ";
    output3.precision(Table1b[i].p[j]);
    output3 << Table1b[i].error[j];
    if(j<dim-1){
        output3 << "&" ;
    }
    }
    output3 << "\\\\ \\hline\n";
    }
    output3 << "\\end{array}\n$$";
    output3.close();

    ofstream output4("g1b.dat", ios::out);
    for(int i=0;i<=n1;i++){
    for (int j=0; j<=dim-1;j++) {
    output4 << Table1b[i].value[j]<<"\t";
    output4 << Table1b[i].error[j];
    if(j<dim-1){
        output4 << "\t" ;
    }
    }
    output4 << "\n";
    }
    output4.close();


    return 0;
}
