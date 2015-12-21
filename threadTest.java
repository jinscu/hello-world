package package0;

public class threadTest {
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new Thread(new Thread1()).start();//启动一个线程
		try{
			Thread.sleep(10);//sleep并不会释放锁
		}catch(InterruptedException e){
			e.printStackTrace();
		}
		new Thread(new Thread2()).start();
	}

	private static class Thread1 implements Runnable{//内部类，实现runnable接口
		public void run(){
			synchronized(threadTest.class){//这里不能用this ，其只能指向一个对象
				System.out.println("enter thread1...");
				try{
					threadTest.class.wait();//释放锁，进入等待状态
					System.out.println("thread1 is waiting...");
				}catch(InterruptedException e){
					e.printStackTrace();
				}
				System.out.println("thread1 is being over!...");
			}
		}
	}
	
	private static class Thread2 implements Runnable{
		public void run(){
			synchronized (threadTest.class){
				System.out.println("enter thread2...");
				threadTest.class.notify();//由JVM决定唤醒哪个线程，notify并不会释放锁
				try{
					Thread.sleep(10);
				}catch(InterruptedException e){
					e.printStackTrace();
				}
				System.out.println("thread2 is being over...");
			}
		}
	}
}
