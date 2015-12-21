package package0;

public class embededClass {
	private int a = 1;
	static int b ;//如果是final类型则一定要赋值
	
	public static void main(String[] args) {
		embededClass e = new embededClass();
		e.new class1();//通过一个对象来调用
//		b = 2;//静态成员可以被赋值
//		System.out.println(b);
//		int a =3;
//		System.out.println(Integer.SIZE/8);
	}
	private class class1 {//可用为静态的	
		private static final int a = 5;//内部类的变量函数名称可用和外部类一样
		class1(){
//			++b;
			System.out.println(embededClass.this.a);
			
		}
	} 
}
