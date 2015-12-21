package package0;

public class 静态内部类 {    
    private static class LazyHolder {    //静态内部类只能访问外部类的静态成员。
       private static final 静态内部类 INSTANCE = new 静态内部类();//函数是属于类的，所以可以在静态内部类中调用    
    }    
    private 静态内部类 (){//构造函数不能是静态的
    	System.out.println("调用私有构造函数！");
    }    
    public static final 静态内部类 getInstance() {    
       return LazyHolder.INSTANCE;    
    }    
    public static void main(String args[]){
    	静态内部类.getInstance();
    }
}    
//该静态内部类用于实现安全同步的单例模式