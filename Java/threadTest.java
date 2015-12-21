package package0;

public class threadTest {
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new Thread(new Thread1()).start();//����һ���߳�
		try{
			Thread.sleep(10);//sleep�������ͷ���
		}catch(InterruptedException e){
			e.printStackTrace();
		}
		new Thread(new Thread2()).start();
	}

	private static class Thread1 implements Runnable{//�ڲ��࣬ʵ��runnable�ӿ�
		public void run(){
			synchronized(threadTest.class){//���ﲻ����this ����ֻ��ָ��һ������
				System.out.println("enter thread1...");
				try{
					threadTest.class.wait();//�ͷ���������ȴ�״̬
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
				threadTest.class.notify();//��JVM���������ĸ��̣߳�notify�������ͷ���
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
