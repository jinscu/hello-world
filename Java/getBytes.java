package package0;

import java.io.FileOutputStream;
import java.io.IOException;

public class getBytes {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try{
			FileOutputStream out = new FileOutputStream("writeToTxt.txt");
			out.write("���ַ���ת��Ϊ�ֽ�".getBytes());
			out.close();
		}catch(IOException ioe){
			ioe.printStackTrace();
		}
	}

}
