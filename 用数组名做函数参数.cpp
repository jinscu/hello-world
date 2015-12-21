#include <iostream>
#include <string>
using namespace std;
int main(){
	int max_value(int array[3][4]);
	int a[3][4]={{11,32,43,54},{22,33,514,99},{14,92,43,37}};
	cout<<"max value is "<<max_value(a)<<endl;
	
	char str[]="jinhehui";//该数组的长度应该包含'\0'
	cout<<"字符数组长度 "<<sizeof(str);//所以长度为9
	char s[3];
	//s="jd";//不能给数组名赋值，数组名是一个地址常量，不能更改
	cout<<str<<endl;
	
	string name[2]={"jdddddin","fun"};
	cout<<"元素的长度 "<<sizeof(name[1])<<endl;//字符串数组元素存放的是一个地址
	return 0;
}

int max_value(int array[3][4])//列的值必须要确定，行的值可以为空或任意
{
	int i,j,max;
	max =array[0][0];
	for(i=0;i<3;i++)
			for(j=0;j<4;j++)
				if(array[i][j]>max) max=array[i][j];
				return max;
}