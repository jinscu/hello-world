package package0;

public class helloWorld {
	private helloWorld(){
		System.out.println("this is hello constructor");
	}
	static int a =2;//设置权限为default，则访问范围在本包内
	static helloWorld getClassObject(){
		return (new helloWorld());//静态公有方法返回对象引用
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		System.out.println("hello world");
//		new func();//不属于本类的成员，但访问权限为default，即在本包中可以访问，用new创建对象会返回对象的引用
//		helloWorld h = new helloWorld();
		helloWorld.getClassObject();
	}

}
class func{
	func(){//构造函数可以为private，但是在类外不能访问
		helloWorld.a = 3;//此处不能设置为私有，否则不能访问
		System.out.println(helloWorld.a);
	}
}
