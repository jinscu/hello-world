package package0;

public class ����ģʽ {
	private ����ģʽ() {//˽�л�����ֹ�����ⲿ��ʵ��������ͬһ���������Χ�ڣ�Singleton��Ψһʵ��ֻ��ͨ��getInstance()�������ʡ�
		System.out.println("private constructor used!");
	}

	private static ����ģʽ single = null;

	public static ����ģʽ getInstace() {
		if (single == null) {
			single = new ����ģʽ();
		}
		return single;
	}
//����ģʽû�п����̰߳�ȫ���⣻������getInstace�ϼ�synchronized�Ա���ͬ��
}