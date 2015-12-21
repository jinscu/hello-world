package package0;

public class TestSingleton {
	String name = null;

	private TestSingleton() {
	}

	private static volatile TestSingleton instance = null;//加了volatile关键字来声明单例对象

	public static TestSingleton getInstance() {
		if (instance == null) {
			synchronized (TestSingleton.class) {
				if (instance == null) {//两个null校验
					instance = new TestSingleton();
				}
			}
		}
		return instance;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void printInfo() {
		System.out.println("the name is " + name);
	}
}
