#include<iostream>
using namespace std;
class Time 
{
public:
	Time(int ,int ,int );
	friend void display(Time &);//ÉêÃ÷ÓÑÔªº¯Êı
private:
	int hour;
	int minute;
	int sec;
};

Time :: Time (int h,int m,int s)
{
	hour = h;
	minute = m;
	sec = s;
}

//void Time::display(Time & t)
//{
//	cout<<t.hour<<":"<<t.minute<<":"<<t.sec<<endl;
//}

void display(Time & t)
{
	cout<<t.hour<<":"<<t.minute<<":"<<t.sec<<endl;
}


int main()
{
	Time t1(10,13,45);
	//t1.display(t1);
	display(t1);
	return 0;
}