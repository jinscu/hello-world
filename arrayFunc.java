package package0;

public class arrayFunc {

	/**
	 * @param args
	 */
	private int ca = -42;
	public static void fun(){
		
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int a[] = {1,23,4,5,43};
		int b[] = null;
		b=a;
//		System.arraycopy(a,0,b,1,3);
		a = null;//此时变量a已经回收了，但是引用变量b仍然有效，指向了数组,存储与堆内存的数组没有被回收
//		System.out.println(b);
		arrayFunc arr = new arrayFunc();
//		System.out.println(arr.toString());
		System.out.println(arr.ca); //访问私有成员变量
	}

}

class another{
	public static void main(String[] args){
		arrayFunc arr = new arrayFunc();
		System.out.println("another main func"); //访问私有成员变量
	}
	
}
