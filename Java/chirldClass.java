package package0;

public class chirldClass extends parentClass{
	private double width;
	private double length;
	chirldClass(double w,double l){
		width = w;
		length = l;
	}
	chirldClass(){
		this(10.0,10.0);//调用本身的构造函数
	}
	chirldClass(double d){//构造函数重载
		this(d,d);
	}
	public double area() {//子类中一定要实现所有的抽象方法
		// TODO Auto-generated method stub
		return width*length;
	}
	public void fun(){//该函数只能被子类对象调用
		System.out.println("is this function only accessabled by chirldClass?");
	}
}
class excute{
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		parentClass p = new chirldClass();
		p.print();
//		p.fun();//由于是父类对象，不能调用子类中父类没有的函数
	}
}