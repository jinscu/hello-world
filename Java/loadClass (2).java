package package0;

class Cookie {
	static {
		System.out.println("Loading Cookie");
	}
}

class Candy{
	static{
		System.out.println("Loading Candy");
	}
}

class Gum{
	static{
		System.out.println("Loading Gum");
	}
}

public class loadClass {
	static{
		System.out.println("inside static");//��main����֮ǰִ��
	}
	public static void test(){
		System.out.println("object has created");
	}
	public static void main(String[] args) {
//		loadClass l = new loadClass();
		test();
		System.out.println("inside main");
		new Candy();//����Candy��
		try{
			Class.forName("Gum");
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}
		short longData = (short) Integer.MAX_VALUE;
		System.out.println(longData);
	}
}
