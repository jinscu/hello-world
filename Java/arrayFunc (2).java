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
		a = null;//��ʱ����a�Ѿ������ˣ��������ñ���b��Ȼ��Ч��ָ��������,�洢����ڴ������û�б�����
//		System.out.println(b);
		arrayFunc arr = new arrayFunc();
//		System.out.println(arr.toString());
		System.out.println(arr.ca); //����˽�г�Ա����
	}

}

class another{
	public static void main(String[] args){
		arrayFunc arr = new arrayFunc();
		System.out.println("another main func"); //����˽�г�Ա����
	}
	
}
