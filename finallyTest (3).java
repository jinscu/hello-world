package package0;

public class finallyTest {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int t =new finallyTest().test();
		System.out.println(t);
//		System.out.println(finallyTest.class);
	}
	public int test(){
		int x = 1;
		try{
			return x++;
		}
		finally{
			System.out.println("finally: "+(++x));//������return ����finally����ִ�е���,��return֮ǰִ��
		}
	}

}
