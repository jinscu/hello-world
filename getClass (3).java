package package0;
import java.util.Date;
public class getClass extends Date{

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new getClass().test();
//		String str = "a"+"b"+"c"+"d";//在编译时期就将+号去掉，所以只创建了一个String 对象
//		System.out.println(str == "abcd");
		String s = new String();
		s = "a";
		s = s + "b";//String 是final 类型，不可修改，不可被继承，因此此处创建了两个String 对象
//		System.out.println(s == "ab");//比较是否是同一个引用
		System.out.println(s.equals("ab"));//此处只是比较String对象里的内容
	}
	public void test(){
		System.out.println(super.getClass());
	}
}
