package package0;

public class 静态变量 {
	public static int staticVar = 0;
	public int var = 0;
	public 静态变量(){
		staticVar ++ ;
		var ++ ;
		System.out.println("staticVar = "+staticVar+"var = "+ var);
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		静态变量 v1 = new 静态变量();
		静态变量 v2 = new 静态变量();
	}
/*静态变量在加载类的字节码时就已经分配了空间，此后其值在类的生存期间一直存在；
而类的普通成员变量在创建对象时才分配空间，且每个成员变量是归属于其对象的，与其他对象无关；*/
}
