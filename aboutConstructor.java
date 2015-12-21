package package0;

public class aboutConstructor {// 要与文件名相同
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		subClass c = null;
		c = subClass.getMember();
//		System.out.println(c.p);
		//new subClass();//因构造函数为私有，因此不能创建对象
	}
}

class subClass {
	int p;
	private static subClass o = new subClass();
	private subClass() {
		p = 2;
//		System.out.println("subClass-constructor loaded!");
	}

	static subClass getMember() {
		// return p;//静态方法不能返回非静态成员
		// p = 3;不能访问非静态成员
		return o;
	}

}
