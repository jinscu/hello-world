package package0;//��ͬһ���������಻��������

public class aboutConstructor {// Ҫ���ļ�����ͬ
	public static void main(String[] args) {
//		subclasses c = null;//�������nullֵ�����������
		subclasses.getMember();//ֱ��������������ľ�̬����������Ҫ��������
//		System.out.println(c.p);
		//new subclasses();//���캯��Ϊ˽�У���˲��ܴ�������
	}
}

class subclasses {
	int p = 0;
	static final int s = -1;
	private static subclasses o = new subclasses();//�þ�̬��Ա�����������ʱ�����ù��캯�������p�������ʱ�㱻��ֵΪ2
	private subclasses() {//������˽��
		p ++;
		System.out.println("subclasses-constructor loaded!--p = "+p);
	}

	static void getMember() {//���ø÷���ǰ����Ҫ���ظ��࣬���Ի��ȵ��ø���Ĺ��캯�����������P��ֵ��
		// return p;//��̬�������ܷ��طǾ�̬��Ա
		// p = 3;���ܷ��ʷǾ�̬��Ա
		System.out.println("s = "+s);//����һ����̬�ĳ�Ա
	}

}
