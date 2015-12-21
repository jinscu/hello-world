public class VarianTest{
	public static int staticVar = 0;
	public int var = 0;
	public VarianTest(){
		staticVar ++ ;
		var ++ ;
		System.out.println("staticVar = "+staticVar+"var = "+ var);
	}
}