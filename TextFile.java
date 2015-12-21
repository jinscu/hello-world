package package0;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class TextFile {

	private String filename;
	private TextFile(String filename){
		this.filename = filename;
	}
	public void writeToFile()throws IOException{
		FileWriter fout = new FileWriter(this.filename);//filewriter继承自outputStreamWriter,此处为调用构造函数，属于字符输出流的一个子类
		int i =0,j=1,count =0;
		while(count<20){
			fout.write(i+ " "+j+" " );//向文件字符输出流写入一个字符串
			i = i+j;
			j =i+j;
			count +=2;
			if(count %10 ==0)fout.write("\r\n");
		}
		fout.close();
		System.out.println("Write Fibonacci to File "+this.filename);
	}
	public void readFromFile()throws IOException{
		FileReader fin = new FileReader(this.filename);
		BufferedReader bin = new BufferedReader(fin);//bufferedReader继承自 reader
		System.out.println("readFromFile "+this.filename);
		String aline = null;
		do{
			aline = bin.readLine();//读取一行字符串，输入流结束时返回null
			if(aline != null)
				System.out.println(aline);
		}while(aline != null);
		bin.close();
		fin.close();
	}
	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		TextFile afile = new TextFile("FibFile.txt");
		afile.writeToFile();
		afile.readFromFile();
	}

}
