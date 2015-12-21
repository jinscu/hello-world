package package0;

public class fun {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		doubleNum(3);
//		for (int i = 0; i < 20; i++)
//			System.out.println(i / 3);//求商，不是求余
//		char[] cc ={'a','c','b'};
//		int c0 = cc.length;
//		int c = "abc".length();
//		System.out.println(c);
//		char c = 17;
//		char c2 = 'd';
//		System.out.println((int)c);
//		System.out.println(c2);
//		short i = 98;
//		char c =(char)i;//shor char byte是同级的，转换时要强制申明
//		System.out.println("output:"+c);
		//利用包装类中的方法进行简单数据类型间的转换
//		double d1 = 10.01; Double dd = new Double(d1); int i= dd.intValue();
//		System.out.println(i);
//		int i = 012;
//		int j = 034;
//		int k = (int)056L;
//		int l = 0212;//8进制0-7
//		System.out.println(i);
//		System.out.println(j);
//		System.out.println(k);//L作为字符被舍弃，只计算056
//		System.out.println(l);
		//-----------------------
//		char x = 'x';
//		int ii = 10;
//		System.out.println(false?ii:x);//三目运算符会进行类型转换
//		System.out.println(false?10:x);//10可以由char来表示，因此输出x(即char类型)
//		int num = 2;
//		System.out.println(num >>32);//以32为模进行位移，因为int类型占用4字节
		System.out.println(Integer.valueOf("1234"));//将包含数字的字符串转换为数字
	}
	public static void doubleNum(int n){
		System.out.println(n);
		if(n<=5000){
			doubleNum(n*2);//递归
			System.out.println(n);
		}
	}
}
