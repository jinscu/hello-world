package package0;

class Base {
	int x = 1;
	static int y = 2;
	int z = 3;

	int method() {
		return x;
	}
}

class Subclass extends Base {
	int x = 4;
	int y = 5;
	String str = "sub";
	static int z = 6;

	String methods() {
		return str+x;
	}
}

public class ��̬���� {
	public static void main(String[] args) {
		Subclass s = new Subclass();
		System.out.println(s.x + " " + s.y + " " + s.z);
		System.out.println(s.method());
		//�ؼ�����������ָ�����Ǹ����󣬼�����ʱ�ڵĶ���
		Base b = (Subclass) s;//������������ָ�������������˸ö��󽫵����������ķ���
		System.out.println(b.x + " " + b.y + " " + b.z);
		System.out.println(b.method());//�������������û�иķ������������в��Ҳ�����
	}
}
/*�������ε��õķ�����������ķ���
 * ���������ϴ��룬����֪��ʵ���������ж�̬�ģ�������ʱ��̬�󶨡���ʵ���������������û�ж�̬�󶨵ģ����ڱ����Ǿ;����ˡ�����s.x s.y
 * s.z����Subclass������Ӧ��ֵ����b.x b.y b.z����Base������Ӧ��ֵ��
 */
//���Ա�����ȷ������ʱ����̬������Եķ���ֻ�Ƕ���ķ���
//���������private��static��final���߹��������������Ϳ���ȷ�������Ǹ����������Ǿ�̬�󶨡�
