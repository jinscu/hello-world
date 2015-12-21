#include <iostream>
#include <string>//为了在我们的程序中使用string类型，我们必须包含头文件 <string>
using namespace std;
int main(int argc, char const *argv[])
{
	//以下是创建一个String对象

	string s;//生成一个空字符串
	s = "chengou";//后面指针要指向这个字符串
	string s1("jin");//拷贝构造函数，生成括号内字符串的复制品
	cout<<s1<<endl;
	string s2("jinhehui",1,10);//string s(chars,chars_len) //将C字符串前chars_len个字符作为字符串s的初值
	string str = "sichuang";
	//string s(str,stridx) //将字符串str内“始于位置stridx”的部分当作字符串的初值,和上面的不一样，这个是先定义了一个字符串变量
	//string s(str,stridx,strlen) //将字符串str内“始于stridx且长度顶多strlen”的部分作为字符串的初值
	string str1(str,1);
	cout<<str1<<endl;
	cout<<"str1 max_size:"<<str1.max_size()<<endl;//max_size() 这个大小是指当前C++字符串最多能包含的字符数
	str1.~string();//销毁字符，释放内存



	/*
	标准库的string类提供了3个成员函数来从一个string得到c类型的字符数组：c_str()、data()、copy(p,n),c语言里面没有字符串，只有数组来表示；

	c_str()返回一个客户程序可读不可改的指向字符数组的指针，不需要手动释放或删除这个指针。

	data():与c_str()类似，但是返回的数组不以空字符终止

	copy(p,n,size_type _Off = 0)：从string类型对象中至多复制n个字符到字符指针p指向的空间中。默认从首字符开始，但是也可以指定，开始的位置（记住从0开始）。返回真正从对象中复制的字符。------用户要确保p指向的空间足够保存n个字符。

	*/
	const char* c;//常指针
	c = str.c_str();// c_str()：生成一个const char*指针，指向以空字符终止的数组。
	cout<<"c point: "<<c<<endl;
	str = "1234";
	cout<<c<<endl;
	c = s.c_str();//这里算是改变c指针的指向吗？
	cout<<"change c towards: "<<c<<endl;

	char* c1 = new char[20];
	// strcpy(c,str.c_str());//这里不能再复制给c指针了，c是常指针	
	/*
	char *strcpy(char* dest, const char *src);
	C语言标准库函数strcpy，把从src地址开始且含有'\0'结束符的字符串复制到以dst开始的地址空间。注意第一个参数不能是常指针
	*/
	strcpy(c1,str.c_str());	
	cout<<"c1 copy:"<<c1<<endl;

	char cs[20];
	// cs = str.data();//该方法返回一个const char*类型指针,而cs是一个数组地址，不能直接赋值,可以用下面的方法复制
	strcpy(cs,str.data());
	cout<<"data function: "<<cs<<endl;

	// strcpy(cs,str.copy());

	// begin()  end()提供类似STL的迭代器支持
	basic_string <char>:: iterator str_iter;
	for(str_iter = str.begin();str_iter != str.end();str_iter++)
		cout<<*str_iter<<endl;

	// at 或者 [] 获取某个元素
	/*
    可以使用下标操作符[]和函数at()对元素包含的字符进行访问。但是应该注意的是操作符[]并不检查索引是否有效（有效索引0~str.length()），如果索引失效，会引起未定义的行为。而at()会检查，如果使用 at()的时候索引无效，会抛出out_of_range异常。
	*/
    str = "sichuan university";
    cout<<"at function: "<<str.at(3)<<endl;
    cout<<"[]: "<<str[3]<<endl;

    /*
    字符串比较
	C ++字符串支持常见的比较操作符（>,>=,<,<=,==,!=），甚至支持string与C-string的比较(如 str<”hello”)。在使用>,>=,<,<=这些操作符的时候是根据“当前字符特性”将字符按字典顺序进行逐一得比较
	返回值意义如下：0-相等〉0-大于 <0-小于。举例如下：
    */

    cout<<"compare: "<<str.compare("abcd")<<endl;

    /*操作字符，增删改查*/
    str.append(s1,1,string::npos);//把字符串s1从索引值1开始到结尾赋给s
    cout<<"append: "<<str<<endl;
    str.insert(1,"kkkk");//在索引1位置处插入字符串
    cout<<"insert: "<<str<<endl;
    str.replace(1,4,"mmmm");//从索引1开始的4个替换成后面的字符串
    cout<<"replace: "<<str<<endl;
    str.erase(1,4);//从索引1开始往后删除4个
    cout<<"erase: "<<str<<endl;
    str = str.substr(1,4);//从索引1开始4个字符
    cout<<"substr: "<<str<<endl;
    cout<<"+: "<<str+s1<<endl;

    return 0;
}
