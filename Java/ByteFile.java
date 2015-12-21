package package0;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

public class ByteFile {
	private String filename;//用来存储文件名
	public ByteFile(String filename){
		this.filename = filename;
	}
	public void writeToFile(byte[] buffer)throws IOException{
		FileOutputStream fout = new FileOutputStream(this.filename);//为指定文件创建文件输出流对象
		fout.write(buffer);//将指定缓冲区的数据写入输出流，输出到文件
		fout.close();
		System.out.println("Write to File "+this.filename);
	}
	public void readFromFile()throws IOException{
		FileInputStream fin = new FileInputStream(this.filename);//为指定文件创建输入流对象
		System.out.println("read from file "+this.filename);
		byte[] buffer = new byte[512];//字节缓冲区
		int count = 0;
		do{
			count = fin.read(buffer);//将数据输入到字节数组缓冲区，并返回实际读取的字节数，输入流结束则返回-1
			System.out.println("count = "+count);
			for(int i=0;i<count;i++)
				System.out.print(buffer[i]+" ");//按字节方式输出
			System.out.println();
		}while(count!=-1);
		fin.close();
	}
	public void copyFile(String filename2,boolean append)throws IOException{
		FileInputStream fin = new FileInputStream(this.filename);
		FileOutputStream fout = new FileOutputStream(filename2,append);
		byte[] buffer = new byte[512];
		int count = 0;
		do{
			count = fin.read(buffer);
			if(count!=-1)
				fout.write(buffer);
		}while(count!=-1);
		fin.close();
		fout.close();
		System.out.println("Copyfile from "+this.filename +"to "+ filename2);
	}
	public void copyFile(String filename2)throws IOException{
		copyFile(filename2,false);//不在结尾追加
	}
	public static void main(String[] args) throws IOException {
		byte[] buffer = {'a','i','n',3,4,5,6,7,8,9};//创建已有数据的字节数组
		ByteFile afile = new ByteFile("ByteFile.txt");
		afile.writeToFile(buffer);
		afile.readFromFile();//将文件内容读入内存，然后向屏幕输出
		afile.copyFile("ByteFile2.txt");
	}

}
