package package0;

class Base {
	int x = 1;
	static int y = 2;
	int z = 3;

	int method() {
		return x;
	}
}

class Subclass extends Base {
	int x = 4;
	int y = 5;
	String str = "sub";
	static int z = 6;

	String methods() {
		return str+x;
	}
}

public class 多态测试 {
	public static void main(String[] args) {
		Subclass s = new Subclass();
		System.out.println(s.x + " " + s.y + " " + s.z);
		System.out.println(s.method());
		//关键看父类引用指向了那个对象，即运行时期的对象
		Base b = (Subclass) s;//父类对象的引用指向了子类对象，因此该对象将调用子类对象的方法
		System.out.println(b.x + " " + b.y + " " + b.z);
		System.out.println(b.method());//但是如果子类中没有改方法，则向父类中查找并调用
	}
}
/*上面两次调用的方法都是子类的方法
 * 分析上以上代码，我们知道实例方法才有多态的，在运行时动态绑定。而实例变量或类变量则没有动态绑定的，是在编译是就决定了。所以s.x s.y
 * s.z都是Subclass对象相应的值。而b.x b.y b.z都是Base对象相应的值。
 */
//所以必须明确，运行时（动态）绑定针对的范畴只是对象的方法
//如果方法是private、static、final或者构造器，编译器就可以确定调用那个方法。这是静态绑定。
