package package0;

public class ����ת�� {

	public static void main(String[] args) {
		// &���ܽ���λ���㣬��ȻҲ���Խ����߼�������
		// System.out.println(0x31 &
		// 0x0f);//����ͨ��ʹ��0x0f����һ����������&���㣬����ȡ�����������4��bitλ,����10���Ʊ�ʾ
		int n1 = 15;
		//ʮ����ת�ɶ�����
	    System.out.println(Integer.toBinaryString(15));
	    System.out.println("ȡ�����������4λ��"+(0xf & 0x0f));
		// ʮ����ת��ʮ�����ƣ�
		System.out.println(Integer.toHexString(n1));
		// ʮ����ת�ɰ˽���
		System.out.println(Integer.toOctalString(n1));
		System.out.println(Integer.bitCount(n1));//���ض�������λ��1��λ�ĸ���
		
		
	}

}
