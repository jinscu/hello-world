package package0;
import java.util.Date;
public class getClass extends Date{

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new getClass().test();
//		String str = "a"+"b"+"c"+"d";//�ڱ���ʱ�ھͽ�+��ȥ��������ֻ������һ��String ����
//		System.out.println(str == "abcd");
		String s = new String();
		s = "a";
		s = s + "b";//String ��final ���ͣ������޸ģ����ɱ��̳У���˴˴�����������String ����
//		System.out.println(s == "ab");//�Ƚ��Ƿ���ͬһ������
		System.out.println(s.equals("ab"));//�˴�ֻ�ǱȽ�String�����������
	}
	public void test(){
		System.out.println(super.getClass());
	}
}
