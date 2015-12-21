package package0;

public class classExice {
	public static int a = 2;
	int b = 5;
	public static void main(String[] args) {
		classExice c = new classExice();
		c.first();
//		System.out.println(b);//main是静态函数，不能访问非静态的变量
	}
	public void first() {
		a = 3;//静态变量的值是可以改变的
		int i = 5;
		Value v = new Value();
		v.i = 25;
		second(v, i);
		System.out.println("first :"+a+" " + v.i);
	}

	public void second(Value v, int i) {
		i = 0;
		v.i = 20;//v是引用的副本
		Value val = new Value();
		v = val;//引用的副本指向一个新的object
		System.out.println("second:"+v.i + " " + i);
	}
}

class Value {
	public int i = 15;
}