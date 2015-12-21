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
		DataOutputStream dout = new DataOutputStream(fout);//���캯�������������ֽ����������
		int i=0,j=1,count=0;
		while(count<20){
			dout.writeInt(i);//�������д��һ������
			dout.writeInt(j);
			i = i+j;
			j = i+j;
			count += 2;
		}
		dout.close();//�ȹر�������
		fout.close();//�ٹر��ļ���
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
			catch(EOFException ioe){//�׳�EOFException�쳣��Ϊ�������������
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
