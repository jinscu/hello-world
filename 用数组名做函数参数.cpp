#include <iostream>
#include <string>
using namespace std;
int main(){
	int max_value(int array[3][4]);
	int a[3][4]={{11,32,43,54},{22,33,514,99},{14,92,43,37}};
	cout<<"max value is "<<max_value(a)<<endl;
	
	char str[]="jinhehui";//������ĳ���Ӧ�ð���'\0'
	cout<<"�ַ����鳤�� "<<sizeof(str);//���Գ���Ϊ9
	char s[3];
	//s="jd";//���ܸ���������ֵ����������һ����ַ���������ܸ���
	cout<<str<<endl;
	
	string name[2]={"jdddddin","fun"};
	cout<<"Ԫ�صĳ��� "<<sizeof(name[1])<<endl;//�ַ�������Ԫ�ش�ŵ���һ����ַ
	return 0;
}

int max_value(int array[3][4])//�е�ֵ����Ҫȷ�����е�ֵ����Ϊ�ջ�����
{
	int i,j,max;
	max =array[0][0];
	for(i=0;i<3;i++)
			for(j=0;j<4;j++)
				if(array[i][j]>max) max=array[i][j];
				return max;
}