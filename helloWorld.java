package package0;

public class helloWorld {
	private helloWorld(){
		System.out.println("this is hello constructor");
	}
	static int a =2;//����Ȩ��Ϊdefault������ʷ�Χ�ڱ�����
	static helloWorld getClassObject(){
		return (new helloWorld());//��̬���з������ض�������
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		System.out.println("hello world");
//		new func();//�����ڱ���ĳ�Ա��������Ȩ��Ϊdefault�����ڱ����п��Է��ʣ���new��������᷵�ض��������
//		helloWorld h = new helloWorld();
		helloWorld.getClassObject();
	}

}
class func{
	func(){//���캯������Ϊprivate�����������ⲻ�ܷ���
		helloWorld.a = 3;//�˴���������Ϊ˽�У������ܷ���
		System.out.println(helloWorld.a);
	}
}
