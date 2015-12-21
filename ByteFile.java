package package0;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

public class ByteFile {
	private String filename;//�����洢�ļ���
	public ByteFile(String filename){
		this.filename = filename;
	}
	public void writeToFile(byte[] buffer)throws IOException{
		FileOutputStream fout = new FileOutputStream(this.filename);//Ϊָ���ļ������ļ����������
		fout.write(buffer);//��ָ��������������д���������������ļ�
		fout.close();
		System.out.println("Write to File "+this.filename);
	}
	public void readFromFile()throws IOException{
		FileInputStream fin = new FileInputStream(this.filename);//Ϊָ���ļ���������������
		System.out.println("read from file "+this.filename);
		byte[] buffer = new byte[512];//�ֽڻ�����
		int count = 0;
		do{
			count = fin.read(buffer);//���������뵽�ֽ����黺������������ʵ�ʶ�ȡ���ֽ����������������򷵻�-1
			System.out.println("count = "+count);
			for(int i=0;i<count;i++)
				System.out.print(buffer[i]+" ");//���ֽڷ�ʽ���
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
		copyFile(filename2,false);//���ڽ�β׷��
	}
	public static void main(String[] args) throws IOException {
		byte[] buffer = {'a','i','n',3,4,5,6,7,8,9};//�����������ݵ��ֽ�����
		ByteFile afile = new ByteFile("ByteFile.txt");
		afile.writeToFile(buffer);
		afile.readFromFile();//���ļ����ݶ����ڴ棬Ȼ������Ļ���
		afile.copyFile("ByteFile2.txt");
	}

}
