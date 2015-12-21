#include <iostream>
#include <cstdlib>

using namespace std;
int main(int argc, char const *argv[])
{
	int a = 3;
	int * p;
	p = &a;
	printf("p value:%p\n",p );//闂備胶鎳撻悘姘跺箰缁嬭法鏆ら柛鎰靛枛缁嫰鏌ц箛姘兼綈闁伙綁浜堕弻锟犲礋闂堟稓浠柣搴＄仛瀹悂寮婚敃鍌氶唶婵犻潧妫涚粔顕⒒娴ｇ懓绲荤紒缁樺笒閳绘捇骞嬮敃宓嶉梺鍝勵槹鐎笛呭緤
	printf("%d\n", *p);//闂備胶鎳撻悘姘跺箰缁嬭法鏆ら柛鎰靛枛缁犱即鏌涢妷顔煎閻庢碍鐩弻娑樷枎閹版儼闂侀潻绲惧浠嬬嵁瀹ュ洤顫濈捄楦啃曢梺鐟邦嚟婵敻鎮鹃柆宥嗙厱婵炲棙鍔ч懓鍧楁煕

	int * p1 = new int[2];
	p1[0] = 1;
	p1[1] = 2;
	printf("%d\n", *(p1+1));
	delete p1;

	int * k = new int[2];
	printf("%Np\n", k);//near point
	//reference
	int i = 2;
	int &j = i;
	printf("%p,  %p\n", i,j);
	int* &m = p; //只能是用指针变量给另一个指针变量赋值
	printf("%d\n", *m);
	return 0;
}