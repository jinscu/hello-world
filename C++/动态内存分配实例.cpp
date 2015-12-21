#include <stdio.h>
#include <iostream.h>
void main(){
	unsigned int *a, *b;
	b = new unsigned int[5];//返回数组的首地址
	for(int i=0;i<5;i++){
		b[i] = i;
	}
	for(int j=0;j<5;j++){
		cout<<*(b++)<<endl;
	}
	delete []b;
	struct st{
		unsigned int m,d,y;
	};
	st *c = new st;
	c->m =3;
	cout<<c->d<<endl;
	
}