package package0;

import java.io.IOException;

public class KeyboardInput {
	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		System.out.print("input: ");//����OUT�����print�������������Ļ
		byte buffer[] = new byte[512];//���ֽ�������Ϊ������
		int count = System.in.read(buffer);//�ӱ�׼�������ж�ȡ�����ֽڵ���������������ʵ�ʶ�ȡ���ֽ���
		
		System.out.print("output: ");
		for(int i=0;i<count;i++)
			System.out.print(" "+buffer[i]);//���ֽڷ�ʽ���bufferԪ��ֵ
		System.out.println();
		System.out.println("count =" +count);
	}

}
