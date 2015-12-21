package package0;

public class 懒汉模式 {
	private 懒汉模式() {//私有化，防止类在外部被实例化，在同一个虚拟机范围内，Singleton的唯一实例只能通过getInstance()方法访问。
		System.out.println("private constructor used!");
	}

	private static 懒汉模式 single = null;

	public static 懒汉模式 getInstace() {
		if (single == null) {
			single = new 懒汉模式();
		}
		return single;
	}
//懒汉模式没有考虑线程安全问题；可以再getInstace上加synchronized以保持同步
}