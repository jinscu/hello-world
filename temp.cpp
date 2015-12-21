#include <iostream>
// #include <stdio.h>
#include <string>
// #include <stdafx.h>
using namespace std;
int main(int argc, char const *argv[])
{
	// cout<<fixed<<setprecision(3)<<12.3232<<endl;
	float f = 2323.232323;
	// cout<<Format("0.00",f)<<endl;
	string s = "";
	cout<<sprintf(s,"[%.2f]",f);
	return 0;
}