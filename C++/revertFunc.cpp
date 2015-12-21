#include <iostream>
using namespace std;
int main(int argc, char const *argv[])
{
	char a[11] = "3451678902";
	//memset(a,0,sizeof(a));
	//cin.getline(a,10,'\n');
	cout<<a<<endl;
	char temp;
	for(int i=0,j=strlen(a)-1;i<strlen(a)/2;i++,j--){
		temp = a[j];
		a[j] = a[i];
		a[i] = temp;
	}
	cout<<a<<endl;

	char b[4];
	cin.getline(b,4,'\n');
	cout<<b<<endl;
	return 0;
}