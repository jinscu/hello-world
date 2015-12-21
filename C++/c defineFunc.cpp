//#include "stdafx.h"
#include <iostream>
using namespace std;
#define SQR(X) X*X
int main(int argc, char const *argv[])
{
	int a = 4;
	int k = 2;
	int m = 1;
	int c = SQR(a+k)/SQR(k+m);//只是替换，并没有用括号
	printf("%d\n", c );
	return 0;
}