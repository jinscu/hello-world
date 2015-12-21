#include <iostream>
#include <string>
using namespace std;
int main()
{
	string testString = "jinhehui";
	cout<<testString<<"\n size:"<<testString.length()<<endl;
	testString.resize(5);
	cout<<testString<<"\n size:"<<testString.length()<<endl;
	testString.resize(6);//长度重新加大以后，原有数据已经丢失
	cout<<testString<<"\n size:"<<testString.length()<<endl;

	string str("02323");
	cout<<"str = "<<str.c_str()<<endl;//返回字符串的指针

	
	return 0 ;
}