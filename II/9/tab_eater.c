#include <stdio.h>
#include<fstream>
#include<iostream>
#include<cmath>

using namespace std;
char input[20];
char output[20];
int n1,n2;
typedef struct{
    double value[2];
    double error[2];
    char unit[2][20];
    char mode[2][20];
    int p[2];
}TMereni;

typedef struct{
    double value;
    double error;
}THodnota;

TMereni Table1[100];
TMereni Table2[100];

int load(char* file, TMereni Table[],int n) {
    int i=0;
    ifstream input(file);
    do{
        input >> Table[i].value[0];
        input >> Table[i].unit[0] >> Table[i].mode[0]>> Table[i].value[1] >> Table[i].unit[1] >> Table[i].mode[1];
        i++;
        //printf("%d",i);
    } while (Table[i].value[0]!=Table[i-1].value[0]);
    return i-2;
    //printf("%i\n",n);
}
double power(double x, int e) {
    double v=x;
    for (int i=2; i<=e; i++){
        v=v*x;
    }
    return v;
}


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

main()
{
    THodnota T;
    n1=load("Data1Beran.txt", Table1, n1);
    n2=load("Data2Beran.txt", Table2, n2);
    //printf("%i\n",n1);
    /*for(int i=0;i<=n1;i++){
    printf("%f\t%s  %f  %s\n",Table1[i].value[0],Table1[i].unit[0],Table1[i].value[1],Table1[i].unit[1]);
    }*/
    //double t=power(3,2);
    /*printf("\n");
    for(int i=0;i<=n1;i++){
        printf("%f\t%f\t%s\t%f\t%f\t%s\n",Table1[i].value[0],Table1[i].error[0],Table1[i].unit[0],Table1[i].value[1],Table1[i].error[1],Table1[i].unit[1]);
    }
    */
    error1(Table1, n1);
    error2(Table2, n2);
/*
    //cout << "$$\n\\begin{array}{|c|c|}\n\\hline\n";
    for(int i=0;i<=n1;i++){
    cout.setf(ios::fixed,ios::floatfield);
    cout.precision(Table1[i].p[0]);
    cout << Table1[i].value[0]<<"\\pm ";
    cout.precision(Table1[i].p[0]);
    cout << Table1[i].error[0] << "&" ;
    cout.precision(Table1[i].p[1]);
    cout << Table1[i].value[1] << "\\pm ";
    cout.precision(Table1[i].p[1]);
    cout<< Table1[i].error[1] << "\\\\ \\hline\n";
    }
*/


    ofstream output("g1.dat", ios::out);
    for(int i=0;i<=n1;i++){
    output.setf(ios::fixed,ios::floatfield);
    output << Table1[i].value[1]<<"\t"<< Table1[i].error[1] << "\t" << Table1[i].value[0] << "\t"
    << Table1[i].error[0] << "\n";
    }
    output.close();

    ofstream output4("g2.dat", ios::out);
    for(int i=0;i<=n1;i++){
        T=Teplota(Table2[i].value[0],Table2[i].error[0]);
        output4.setf(ios::fixed,ios::floatfield);
        output4.precision(Table2[i].p[0]);
        output4 << Table2[i].value[0]<<"\t ";
        output4.precision(Table2[i].p[0]);
        output4 << Table2[i].error[0] << "\t" ;
        output4.precision(1);
        output4 << T.value << "\t" ;
        output4.precision(1);
        output4 << T.error << "\t" ;
        output4.precision(Table2[i].p[1]);
        output4 << Table2[i].value[1] << "\t ";
        output4.precision(Table2[i].p[1]);
        output4<< Table2[i].error[1] << "\n";
    }
    output4.close();

    ofstream output2("g1.t", ios::out);
    output2.setf(ios::fixed,ios::floatfield);
    output2 << "$$\n\\begin{array}{|c|c|}\n\\hline\\";
    for(int i=0;i<=n1;i++){
    output2.precision(Table1[i].p[0]);
    output2 << Table1[i].value[0]<<"\\pm ";
    output2.precision(Table1[i].p[0]);
    output2 << Table1[i].error[0] << "&" ;
    output2.precision(Table1[i].p[1]);
    output2 << Table1[i].value[1] << "\\pm ";
    output2.precision(Table1[i].p[1]);
    output2<< Table1[i].error[1] << "\\\\ \\hline\n";
    }
    output2 << "\\end{array}\n$$";
    output2.close();

    ofstream output3("g2.t", ios::out);
    output3 << "$$\n\\begin{array}{|c|c|}\n\\hline\\";
    for(int i=0;i<=n1;i++){
        T=Teplota(Table2[i].value[0],Table2[i].error[0]);
        output3.setf(ios::fixed,ios::floatfield);
        output3.precision(Table2[i].p[0]);
        output3 << Table2[i].value[0]<<"\\pm ";
        output3.precision(Table2[i].p[0]);
        output3 << Table2[i].error[0] << "&" ;
        output3.precision(1);
        output3 << T.value << "\\pm" ;
        output3.precision(1);
        output3 << T.error << "&" ;
        output3.precision(Table2[i].p[1]);
        output3 << Table2[i].value[1] << "\\pm ";
        output3.precision(Table2[i].p[1]);
        output3<< Table2[i].error[1] << "\\\\ \\hline\n";
    }
    output3 << "\\end{array}\n$$";
    output3.close();





    return 0;
}
