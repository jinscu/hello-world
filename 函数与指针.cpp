#include <iostream>
using namespace std;
int main(){
	void sort(char * name[],int n);
	void print(char * name[],int n);
	char * name[] = {"basic","fortan","cdfds","sichuan","uni"};//¶¨ÒåÖ¸ÕëÊý×é£¬·ñÔò²»ÄÜÕâÑù¶¨Òå£¬Ó¦ÊÇÒÔÏÂÁ½ÖÖÐÎÊ½
	char name1[]={'d','s','d'};
	char name2[]="for sichuan";
	cout<<"name1: "<<name1<<endl;
	cout<<"name2: "<<name2<<endl;//×Ö·û´®»áË³ÐòÊä³ö£¬¶øÉÏÃæµÄ×Ö·ûÊý×éÔò²»ÐÐ
	int n=5;
	sort(name,n);
	print(name,n);
	return 0;
}

void sort(char * name[],int n){
	char * temp;
	int i,j,k;
	for(i=0;i<n-1;i++){
		k=i;
		for(j=i+1;j<n;j++)
			if(strcmp(name[k],name[j])>0)k=j;
				if(k!=i){
					temp=name[i];name[i]=name[k];name[k]=temp;
				}
	}
}

void print(char *name[],int n){
	int i;
	for(i=0;i<n;i++)
		cout<<name[i]<<endl;//ÒòÎªÊÇ×Ö·û´®Êý×é£¬ËäÈ»ÊÇ×Ö·û´®µØÖ·£¬µ«×Ö·û´®ÒÀÈ»»áÊä³ö
}