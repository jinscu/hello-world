package package0;

import java.io.IOException;

public class KeyboardInput {
	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		System.out.print("input: ");//调用OUT对象的print方法，输出到屏幕
		byte buffer[] = new byte[512];//以字节数组作为缓冲区
		int count = System.in.read(buffer);//从标准输入流中读取若干字节到缓冲区，并返回实际读取的字节数
		
		System.out.print("output: ");
		for(int i=0;i<count;i++)
			System.out.print(" "+buffer[i]);//按字节方式输出buffer元素值
		System.out.println();
		System.out.println("count =" +count);
	}

}
