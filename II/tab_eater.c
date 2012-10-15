#include <stdio.h>
#include<fstream>
#include<iostream>
#include<math.h>

using namespace std;
char input[20];
char output[20];
int n1,n2;
typedef struct{
    double value[5];
    double error[5];
    char unit[2][20];
    char mode[2][20];
    int p[5];
}TMereni;

typedef struct{
    double value;
    double error;
}THodnota;

TMereni Table1[100];
TMereni Table2[100];

double power(double x, int e) {
    double v=x;
    for (int i=2; i<=e; i++){
        v=v*x;
    }
    return v;
}


int load2(char* file, TMereni Table[]) {
    int i=0;
    ifstream input(file);
    do{
        input >> Table[i].value[0];
        for (int j=1; j<=4; j++) {
            input >> Table[i].value[j] >> Table[i].error[j];
        }
            Table[i].p[0]=1;
            Table[i].p[1]=0;
            Table[i].p[2]=1;
            Table[i].p[3]=2;
            Table[i].p[4]=2;
        i++;
        //printf("%d",i);
    } while (i<=34);
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
            if (Table[i].value[k]<=0.2){
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
                t=(Table[i].error[k])*(power(10,p));
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
    load2("g1.dat", Table1);
    ofstream output2("g1.t", ios::out);
    output2.setf(ios::fixed,ios::floatfield);
    output2 << "$$\n\\begin{array}{|c|c|c|c|c|c|}\n\\hline\\";
    for(int i=0;i<=33;i++){
    output2 << Table1[i].value[0] << "&";
    output2.precision(Table1[i].p[0]);
    for (int j=1; j<=4;j++) {
        output2.precision(Table1[i].p[j]);
    output2 << Table1[i].value[j]<<"\\pm ";
    output2.precision(Table1[i].p[j]);
    output2 << Table1[i].error[j] << "&" ;
    }
    output2<< acos(Table1[i].value[4]) << "\\pm" << acos(Table1[i].value[4])*(Table1[i].error[4]/Table1[i].value[4]);
    output2 << "\\\\ \\hline\n";
    }
    output2 << "\\end{array}\n$$";
    output2.close();



    return 0;
}
