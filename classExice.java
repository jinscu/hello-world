package package0;

public class classExice {
	public static int a = 2;
	int b = 5;
	public static void main(String[] args) {
		classExice c = new classExice();
		c.first();
//		System.out.println(b);//main�Ǿ�̬���������ܷ��ʷǾ�̬�ı���
	}
	public void first() {
		a = 3;//��̬������ֵ�ǿ��Ըı��
		int i = 5;
		Value v = new Value();
		v.i = 25;
		second(v, i);
		System.out.println("first :"+a+" " + v.i);
	}

	public void second(Value v, int i) {
		i = 0;
		v.i = 20;//v�����õĸ���
		Value val = new Value();
		v = val;//���õĸ���ָ��һ���µ�object
		System.out.println("second:"+v.i + " " + i);
	}
}

class Value {
	public int i = 15;
}