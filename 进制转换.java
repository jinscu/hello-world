package package0;

public class 进制转换 {

	public static void main(String[] args) {
		// &还能进行位运算，当然也可以进行逻辑与运算
		// System.out.println(0x31 &
		// 0x0f);//我们通常使用0x0f来与一个整数进行&运算，来获取该整数的最低4个bit位,并用10进制表示
		int n1 = 15;
		//十进制转成二进制
	    System.out.println(Integer.toBinaryString(15));
	    System.out.println("取该整数的最后4位："+(0xf & 0x0f));
		// 十进制转成十六进制：
		System.out.println(Integer.toHexString(n1));
		// 十进制转成八进制
		System.out.println(Integer.toOctalString(n1));
		System.out.println(Integer.bitCount(n1));//返回二进制中位是1的位的个数
		
		
	}

}
