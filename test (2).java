/**
 * 
 */
package package0;

/**
 * @author Administrator
 *
 */
public class test {
//��������ã��ж����������Ƿ����
	/**
	 * @param args
	 */
	int a = 0;
	
	test(int _a){a = _a;
		System.out.print("this is a ;");
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Integer a = new Integer(3);
		Integer b = 3;
		int c = 3;
//		System.out.println(a==b);//false
//		System.out.println(a==c);//true
		float f = 0.3F;
		Float f1 = (float)0.3;//������Ĭ��Ϊdouble,����float��������ʱ������Ҫ��f/F,����ʹ��ǿ������ת����
		
		short s1 = 1;
//		s1 = s1+1;//��Ҫ������ʾ��ǿ������ת��
		s1 += 1;//������ʽ������ת��
//		System.out.print(s1);
//		System.out.print(Math.round(-11.7));
		String str = "13abf";
		int len = str.length();
		int sum = 0;
		for (int i = 0;i < len; i++){
			char cc = str.charAt(len-1-i);
			int n = Character.digit(cc,16);
//			System.out.println(n);
			sum += n* (1<<(4*i));
		}
//		System.out.println("sum is : "+sum);
		
//		System.out.print(1<<(4));//������4λ�൱�ڳ���16
		String s;
		s = new String("jin");
//		System.out.println(s.hashCode());
		
		test t =new test(3);
		
		anothor aa = new anothor();
	}

}
class anothor{
	anothor(){
		System.out.println("this is anothor class");
	}
}
