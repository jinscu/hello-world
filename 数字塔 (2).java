package package0;

public class ������ {
	final static int M = 9;
	static void count(int n,int k){
		int i;
		if(n == 1)
			for(i=1;i<=M-k;i++)
				System.out.print("  ");
		System.out.print(" "+n);//��ӡ��ߵ���
		if(n<k){
			count(n+1,k);//��ӡ��С��k��֮ǰ����
			System.out.print(" "+n);//��ӡ�ұߵ���
		}
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int i;
		for(i=1;i<=M;i++){
			count(1,i);//��ӡ����I��
			System.out.println();//��ӡ��һ�к���
		}
		System.out.println((int)'0');
	}

}
