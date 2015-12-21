package package0;

public abstract class parentClass {

	private String shape = "parent ";
	protected abstract double area();//抽象方法是要被子类继承的，所以不能为私有
	public void print(){//抽象类中可以有非抽象方法
		System.out.println(this.shape+"面积为："+this.area());
	}
}
