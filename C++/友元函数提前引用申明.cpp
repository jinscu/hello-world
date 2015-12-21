#include <iostream>
using namespace std;
class Date;//提前引用申明
class Time 
{
public:
	Time(int,int,int);
	void display(Date &);
private:
	int hour;
	int minute;
	int sec;
};
class Date
{
public:
	Date(int ,int, int );
	friend void Time :: display(Date &);//申明为友元函数才能访问该类的私有成员
private:
	int month;
	int day;
	int year;
};

Time :: Time (int h,int m,int s)
{
	hour = h;
	minute = m;
	sec = s;
}

void Time :: display(Date & d)
{
	cout<<d.month<<"/"<<d.day<<"/"<<d.year<<endl;
	cout<<hour<<":"<<minute<<":"<<sec<<endl;
}

Date:: Date(int m,int d,int y)
{
	month=m;
	day=d;
	year=y;
}

int main(){
	Time t1(10,13,56);
	Date d1(12,35,2004);
	t1.display(d1);
	return 0;
}