package package0;

public class fun {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		doubleNum(3);
//		for (int i = 0; i < 20; i++)
//			System.out.println(i / 3);//���̣���������
//		char[] cc ={'a','c','b'};
//		int c0 = cc.length;
//		int c = "abc".length();
//		System.out.println(c);
//		char c = 17;
//		char c2 = 'd';
//		System.out.println((int)c);
//		System.out.println(c2);
//		short i = 98;
//		char c =(char)i;//shor char byte��ͬ���ģ�ת��ʱҪǿ������
//		System.out.println("output:"+c);
		//���ð�װ���еķ������м��������ͼ��ת��
//		double d1 = 10.01; Double dd = new Double(d1); int i= dd.intValue();
//		System.out.println(i);
//		int i = 012;
//		int j = 034;
//		int k = (int)056L;
//		int l = 0212;//8����0-7
//		System.out.println(i);
//		System.out.println(j);
//		System.out.println(k);//L��Ϊ�ַ���������ֻ����056
//		System.out.println(l);
		//-----------------------
//		char x = 'x';
//		int ii = 10;
//		System.out.println(false?ii:x);//��Ŀ��������������ת��
//		System.out.println(false?10:x);//10������char����ʾ��������x(��char����)
//		int num = 2;
//		System.out.println(num >>32);//��32Ϊģ����λ�ƣ���Ϊint����ռ��4�ֽ�
		System.out.println(Integer.valueOf("1234"));//���������ֵ��ַ���ת��Ϊ����
	}
	public static void doubleNum(int n){
		System.out.println(n);
		if(n<=5000){
			doubleNum(n*2);//�ݹ�
			System.out.println(n);
		}
	}
}
