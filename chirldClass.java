package package0;

public class chirldClass extends parentClass{
	private double width;
	private double length;
	chirldClass(double w,double l){
		width = w;
		length = l;
	}
	chirldClass(){
		this(10.0,10.0);//���ñ���Ĺ��캯��
	}
	chirldClass(double d){//���캯������
		this(d,d);
	}
	public double area() {//������һ��Ҫʵ�����еĳ��󷽷�
		// TODO Auto-generated method stub
		return width*length;
	}
	public void fun(){//�ú���ֻ�ܱ�����������
		System.out.println("is this function only accessabled by chirldClass?");
	}
}
class excute{
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		parentClass p = new chirldClass();
		p.print();
//		p.fun();//�����Ǹ�����󣬲��ܵ��������и���û�еĺ���
	}
}