#include <stdio.h>
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
        for (int j=0; j<=6; j++) {
            input >> Table[i].value[j];
        }
            Table[i].p[0]=1;
            Table[i].p[1]=2;
            Table[i].p[2]=2;
            Table[i].p[3]=0;
            Table[i].p[4]=0;
            Table[i].p[5]=3;
            Table[i].p[6]=2;
        i++;
        //printf("%d",i);
    } while (i<=10);
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
    load2("a5.dat", Table1);
    ofstream output2("a5.t", ios::out);
    output2.setf(ios::fixed,ios::floatfield);
    output2 << "$$\n\\begin{array}{|c|c|c|c|c|c|c|}\n\\hline\\";
    for(int i=0;i<=10;i++){
    for (int j=0; j<=5;j++) {
        output2.precision(Table1[i].p[j]);
        output2 << Table1[i].value[j] << "&" ;
    }
    output2<< Table1[i].value[6]; 
    output2 << "\\\\ \\hline\n";
    }
    output2 << "\\end{array}\n$$";
    output2.close();

    ofstream output("a5.t2", ios::out);
        output.setf(ios::fixed,ios::floatfield);
        output << "$$\n\\begin{array}{|c|c|}\n\\hline\\";
            output.precision(Table1[0].p[0]);
            output << Table1[0].value[0] << "&" << 0;
        output << "\\\\ \\hline\n";
        for(int i=1;i<=10;i++){
            output.precision(Table1[i].p[0]);
            output << Table1[i].value[0] << "&" ;
        output<< Table1[0].value[1]-Table1[i].value[1]; 
        output << "\\\\ \\hline\n";
        }
        output << "\\end{array}\n$$";
        output.close();


    return 0;
}
