package package0;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.EOFException;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

public class IntFile {
	private String filename;
	public IntFile(String filename){
		this.filename = filename;
	}
	public void writeToFile() throws IOException{
		FileOutputStream fout = new FileOutputStream(this.filename);
		DataOutputStream dout = new DataOutputStream(fout);//构造函数，创建数据字节输出流对象
		int i=0,j=1,count=0;
		while(count<20){
			dout.writeInt(i);//向输出流写出一个整数
			dout.writeInt(j);
			i = i+j;
			j = i+j;
			count += 2;
		}
		dout.close();//先关闭数据流
		fout.close();//再关闭文件流
		System.out.println("Write Fibonacci to File "+ this.filename);
	}
	public void readFromFile() throws IOException{
		FileInputStream fin = new FileInputStream(this.filename);
		DataInputStream din = new DataInputStream(fin);
		System.out.println("readFromFile "+this.filename);
		while(true)
			try{
				int i= din.readInt();
				System.out.print(i+ " ");
			}
			catch(EOFException ioe){//抛出EOFException异常作为输入流结束标记
				break;
			}
		System.out.println();
		din.close();
		fin.close();
	}
	
	public static void main(String[] args) throws IOException {
		IntFile afile = new IntFile("FibIntFile.txt");
		afile.writeToFile();
		afile.readFromFile();
	}

}
