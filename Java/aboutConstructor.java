package package0;

public class aboutConstructor {// Ҫ���ļ�����ͬ
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		subClass c = null;
		c = subClass.getMember();
//		System.out.println(c.p);
		//new subClass();//���캯��Ϊ˽�У���˲��ܴ�������
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
		// return p;//��̬�������ܷ��طǾ�̬��Ա
		// p = 3;���ܷ��ʷǾ�̬��Ա
		return o;
	}

}
