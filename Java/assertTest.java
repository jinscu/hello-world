package package0;

public class assertTest {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int i=0;
		for(i=0 ;i<5;i++){
			System.out.println(i);
		}
		--i;
//		assert i == 5;
		
	}
	private int a =1;
	public int getName(){
		return a;
	}
	public void fun(){
//		private int a =0;//局部变量前不能用访问修饰符
		assertTest at = new assertTest();
		System.out.println(at.getName());
		}
}
