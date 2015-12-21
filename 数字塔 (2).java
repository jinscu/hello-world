package package0;

public class 数字塔 {
	final static int M = 9;
	static void count(int n,int k){
		int i;
		if(n == 1)
			for(i=1;i<=M-k;i++)
				System.out.print("  ");
		System.out.print(" "+n);//打印左边的数
		if(n<k){
			count(n+1,k);//打印出小于k的之前的数
			System.out.print(" "+n);//打印右边的数
		}
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int i;
		for(i=1;i<=M;i++){
			count(1,i);//打印出第I行
			System.out.println();//打印完一行后换行
		}
		System.out.println((int)'0');
	}

}
