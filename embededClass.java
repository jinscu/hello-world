package package0;

public class embededClass {
	private int a = 1;
	static int b ;//�����final������һ��Ҫ��ֵ
	
	public static void main(String[] args) {
		embededClass e = new embededClass();
		e.new class1();//ͨ��һ������������
//		b = 2;//��̬��Ա���Ա���ֵ
//		System.out.println(b);
//		int a =3;
//		System.out.println(Integer.SIZE/8);
	}
	private class class1 {//����Ϊ��̬��	
		private static final int a = 5;//�ڲ���ı����������ƿ��ú��ⲿ��һ��
		class1(){
//			++b;
			System.out.println(embededClass.this.a);
			
		}
	} 
}
