#include <iostream>
#include <stdlib.h>
//#include <stdafx.h>
using namespace std;
int main(){
	char str[] = "jinhehui";
	cout<<str<<endl;
	char p[20];
	strcpy(p,str);//c语言标准函数库
	printf("%s\n", p);

	string s = "sichuan";
	string s1 = "province";
	string s2 = s+s1;
	cout<<s2<<endl;
	return 0;
}