package package0;

public abstract class parentClass {

	private String shape = "parent ";
	protected abstract double area();//���󷽷���Ҫ������̳еģ����Բ���Ϊ˽��
	public void print(){//�������п����зǳ��󷽷�
		System.out.println(this.shape+"���Ϊ��"+this.area());
	}
}
