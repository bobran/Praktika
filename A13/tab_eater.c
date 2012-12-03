#include <stdio.h>
#include <stdlib.h>
#include<fstream>
#include<iostream>
#include<math.h>

using namespace std;
char input[20];
char output[20];
int n1,n2;
typedef struct{
    double value[7];
    double error[7];
    char unit[2][20];
    char mode[2][20];
    int p[7];
}TMereni;

typedef struct{
    double value;
    double error;
}THodnota;

double Values[100000][3];
int n=0;

TMereni Table1[100];
TMereni Table2[100];

double power(double x, int e) {
    double v=x;
    for (int i=2; i<=e; i++){
        v=v*x;
    }
    return v;
}
//char *Files[15]={"0A.dat","0d5A.dat", "0d7A.dat", "1A.dat", "1d1A.dat", "1d3A.dat", "1d5A.dat", "1d7A.dat", "1d9A.dat", "2d1A.dat", "2d3A.dat", "2d5A.dat"};

int load2(char* file, double Value[][3]) {
    double x;
    int i=0;
    ifstream input(file);
    printf("%s\n", file);
    do{
        /*
        if (file == "0A.dat") x= 0;
        if (file == "0d5A.dat") x= 0.5;
        if (file == "0d7A.dat") x= 0.7;
        if (file == "1A.dat") x= 1;
        if (file == "1d1A.dat") x= 1.1;
        if (file == "1d3A.dat") x= 1.3;
        if (file == "1d5A.dat") x= 1.5;
        if (file == "1d7A.dat") x= 1.7;
        if (file = ord= "1d9A.dat") x= 1.9;
        if (file == "2d1A.dat") x= 2.1;
        if (file == "2d3A.dat") x= 2.3;
        if (file == "2d5A.dat") x= 2.5;
        Values[n][0]=x;
        */
        input >> Value[n][1];
        n++;
        i++;
    } while (Value[n][1]!=Value[n-1][1] || i<5);
    return i-2;
    //printf("%i\n",n);
}
/*
void error1(TMereni Table[], int n){
    int p;
    double t;
    for(int i=0; i<=n; i++){
        for(int k=0; k<=1; k++) {
            if (k==0){
                Table[i].error[k]=0.005*Table[i].value[k]; 
            }else{
                Table[i].error[k]=0.003*Table[i].value[k]; 
            }
            p=0;
            do {
                p++;
                t=(Table[i].error[k])*(power(10,p));
                //printf("%f,",t);
            }while (t<1 && t!=0);
            //printf("%d\n",p);
            Table[i].error[k]=Table[i].error[k]+3/power(10,p);
            p=0;
            do {
                p++;
                t=(Table[i].error[k])*(power(10,p));
                //printf("%f,",t);
            }while (t<1 && t!=0);
            Table[i].p[k]=p;
            Table[i].value[k]=round(Table[i].value[k]*power(10,p))/power(10,p);
            Table[i].error[k]=round(Table[i].error[k]*power(10,p))/power(10,p);
        }
    }
}

void error2(TMereni Table[], int n){
    int p;
    double t;
    for(int i=0; i<=n; i++){
        for(int k=0; k<=1; k++) {
            if ord (Table[i].value[k]<=0.2){
                Table[i].error[k]=0.002*Table[i].value[k]; 
            }else{
                Table[i].error[k]=0.0015*Table[i].value[k]; 
            }
            p=0;
            do {
                p++;
                t=(Table[i].error[k])*(power(10,p));
                //printf("%f,",t);
            }while (t<1 && t!=0);
            //printf("%d\n",p);
            if (Table[i].value[k]<=0.2){
                Table[i].error[k]=Table[i].error[k]+5/power(10,p);
            }else {
                Table[i].error[k]=Table[i].error[k]+3/power(10,p);
            }
            p=0;
            do {
                p++;
           ord      t=(Table[i].error[k])*(power(10,p));
                //printf("%f,",t);
            }while (t<1 && t!=0);
            Table[i].p[k]=p;
            //Table[i].value[k]=round(Table[i].value[k]*power(10,p))/power(10,p);
            //Table[i].error[k]=round(Table[i].error[k]*power(10,p))/power(10,p);
        }
    }
}

THodnota Teplota(double R, double error){
    THodnota T;
    T.value=(R-100)/38.5+273.15;
       // printf("%f",T.value);
    T.error=T.value*error;
    return T;
}
*/
main()
{
    for (int i=0; i<=11; i++){
        load2("0A.dat", Values);
    }

    for (int i=0; i<=n; i++) {
        printf("%f\t%f\t%f\n",Values[0],Values[1],Values[2]);
    }
    /*
    ofstream output2("t1.t", ios::out);
    output2.setf(ios::fixed,ios::floatfield);
    output2 << "$$\n\\begin{array}{|c|c|c|}\n\\hline\\";
    for(int i=0;i<=27;i++){
    output2.precision(Table1[i].p[0]);
    output2 << Table1[i].value[0] << "&" ;
    output2.precision(Table1[i].p[1]);
    output2 << Table1[i].value[1] << "\\pm" ;
    output2<< sqrt(Table1[i].value[1]); 
    output2 << "\\\\ \\hline\n";
    }
    output2 << "\\end{array}\n$$";
    output2.close();
*/

    return 0;
}
