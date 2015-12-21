package package0;

public class ThreadTest2 {
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ThreadTest2 t2 = new ThreadTest2();
		Inc inc = t2.new Inc();
		Dec dec = t2.new Dec();
//		for(int i=0;i<2;i++){
			Thread t = new Thread(inc);
			t.start();
			t = new Thread(dec);
			t.start();
//		}
	}
	private int j;
	private synchronized void inc(){
		j++;
		System.out.println(Thread.currentThread().getName()+"--inc:"+j);
	}
	private synchronized void dec(){
		j--;
		System.out.println(Thread.currentThread().getName()+"--dec:"+j);
	}
	class Inc implements Runnable{
		public void run(){
			for (int i=0;i<100;i++){
				inc();
			}
		}
	}
	class Dec implements Runnable{
		public void run(){
			for(int i= 0;i<100;i++){
				dec();
			}
		}
	}

}
