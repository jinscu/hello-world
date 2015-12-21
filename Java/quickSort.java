package package0;

public class quickSort {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int[] arr = { 32, 20, 19,1, 3, 8, 4, 10, 42, 21, 45, 63, 35, 29, 65, 
				11 };
		for (int i = 0; i < arr.length; i++)
			System.out.print(arr[i]+" ");
		System.out.println();
		quickSortFunc(arr, 0, arr.length - 1);
		for (int i = 0; i < arr.length; i++)
			System.out.print(arr[i]+" ");
	}

	public static void quickSortFunc(int arr[], int left, int right) {
		int dp;
		if (left < right) {
			dp = partition(arr, left, right);
			quickSortFunc(arr, left, dp - 1);
			quickSortFunc(arr, dp + 1, right);
		}
	}

	static int partition(int arr[], int left, int right) {
		int pivot = arr[left];//leftλ���Ѿ����Կճ�����
		while (left < right) {
			while (left < right && arr[right] >= pivot)
				--right;
			if (left < right)
				arr[left++] = arr[right];//��ֵ���д�С����
			while (left < right && arr[left] <= pivot)
				++left;
			if (left < right)
				arr[right--] = arr[left];
		}
		arr[left] = pivot;//����λ�ã�ֵ�ع�
		return left;
	}
//	//������Ч����΢�ߵ�ķ���
//	static int partition2(int arr[] ,int left, int right){
//		int pivot = arr[left],temp;//leftλ���Ѿ����Կճ�����
//		while (left < right) {
//			while (left < right && arr[right] >= pivot)
//				--right;
//			while (left < right && arr[left] <= pivot)
//				++left;
//			if (left < right){
//				temp = arr[left];
//				arr[left] = arr[right];
//				arr[right] = temp;
//				++left;--right;
//			}
//		}
//		arr[left] = pivot;//����λ�ã�ֵ�ع�
//		return left;
//	}
}
