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
		FileWriter fout = new FileWriter(this.filename);//filewriter�̳���outputStreamWriter,�˴�Ϊ���ù��캯���������ַ��������һ������
		int i =0,j=1,count =0;
		while(count<20){
			fout.write(i+ " "+j+" " );//���ļ��ַ������д��һ���ַ���
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
		BufferedReader bin = new BufferedReader(fin);//bufferedReader�̳��� reader
		System.out.println("readFromFile "+this.filename);
		String aline = null;
		do{
			aline = bin.readLine();//��ȡһ���ַ���������������ʱ����null
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
