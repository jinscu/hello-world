#include <iostream>
using namespace std;
int main(){
	int n=9;//即00001001
	n>>=2;//向右移动两位，即00000010
	cout<<n<<endl;
	/*
	位的与运算：相同位的两个数字都为1，则为1；若有一个不为1，则为0。
	位的与运算可以判断一个数的奇偶性
	*/
	cout<<(2&1)<<endl; //位运算的与&运算,即10&01,得到结果0

	cout<<(6 &11)<<endl;//0110 & 1011
	return 0;
}