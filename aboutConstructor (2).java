package package0;//在同一个包体中类不能重命名

public class aboutConstructor {// 要与文件名相同
	public static void main(String[] args) {
//		subclasses c = null;//类变量赋null值并不会加载类
		subclasses.getMember();//直接用类名调用类的静态方法，不需要建立对象
//		System.out.println(c.p);
		//new subclasses();//因构造函数为私有，因此不能创建对象
	}
}

class subclasses {
	int p = 0;
	static final int s = -1;
	private static subclasses o = new subclasses();//该静态成员变量在类加载时便会调用构造函数，因此p在类加载时便被赋值为2
	private subclasses() {//构造器私有
		p ++;
		System.out.println("subclasses-constructor loaded!--p = "+p);
	}

	static void getMember() {//调用该方法前，需要加载该类，所以会先调用该类的构造函数，即先输出P的值；
		// return p;//静态方法不能返回非静态成员
		// p = 3;不能访问非静态成员
		System.out.println("s = "+s);//返回一个静态的成员
	}

}
