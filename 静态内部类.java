package package0;

public class ��̬�ڲ��� {    
    private static class LazyHolder {    //��̬�ڲ���ֻ�ܷ����ⲿ��ľ�̬��Ա��
       private static final ��̬�ڲ��� INSTANCE = new ��̬�ڲ���();//������������ģ����Կ����ھ�̬�ڲ����е���    
    }    
    private ��̬�ڲ��� (){//���캯�������Ǿ�̬��
    	System.out.println("����˽�й��캯����");
    }    
    public static final ��̬�ڲ��� getInstance() {    
       return LazyHolder.INSTANCE;    
    }    
    public static void main(String args[]){
    	��̬�ڲ���.getInstance();
    }
}    
//�þ�̬�ڲ�������ʵ�ְ�ȫͬ���ĵ���ģʽ