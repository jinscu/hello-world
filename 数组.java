package package0;

public class 数组 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int arr[][]={{1,2,3},{4,6,2},{8}};
		//System.out.println(arr);//这样输出的是数组的地址
		System.out.println(arr.length);//返回一维的个数
		for(int i=0;i<arr.length;i++){
			for(int j=0;j<arr[i].length;j++){
				System.out.println(arr[i][j]);
			}
		}
	}

}
