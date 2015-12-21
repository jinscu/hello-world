#include <iostream>
using namespace std;
int main(int argc, char const *argv[])
{
	int a1 = 3, a = 1;
	const int a2 = a1;

	/*
	const修饰指针变量时：

　　(1)只有一个const，如果const位于*左侧，表示指针所指数据是常	量，不能通过该引用修改该数据；指针本身是变量，可以指向其他	的内存单元。

　　(2)只有一个const，如果const位于*右侧，表示指针本身是常量，	不能指向其他内存地址；指针所指的数据可以通过解引用修改。

　　(3)两个const，*左右各一个，表示指针和指针所指数据都不能修改。
	*/

	int* a3 = &a1;
	// cout<<*a3<<endl;
	const int* a4 = &a1;//const data,non-const pointer
	cout<<"&a1: "<<*a4<<endl;
	a4 = &a;//指针还是可以指向其他变量的，不是常指针
	cout<<"&a: "<<*a4<<endl;
	// *a4 = a;//变量是常量不可修改
	// cout<<"change value of varial: "<<*a4<<endl;

	int* const a5 = &a1;//non-const data,const pointer
	// a5 = &a;//常量指针，指向不可更改
	// cout<<*a5<<endl;
	*a5 = a;//可以通过变量改变常指针所指向的值
	cout<<"change value of varial: "<<*a5<<endl;

	// cout<<*a4<<endl;
	//下面效果一样
	int const * const a6 = &a1;//const data,const pointer
	const int* const a7 = &a1;//const data,const pointer

	/*
	const修饰成员函数

(1)const修饰的成员函数不能修改任何的成员变量(mutable修饰的变量除外)

(2)const成员函数不能调用非onst成员函数，因为非const成员函数可以会修改成员变量
	*/
	return 0;
}