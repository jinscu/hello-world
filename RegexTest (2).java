package package0;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class RegexTest {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String[] str={"323144233900489304","34232509039034x","434098453022343294","320199199202200432"};
		Pattern p1 = Pattern.compile("\\d{14}[a-z0-9A-Z]|\\d{17}[a-z0-9A-Z]");
		Pattern p2 = Pattern.compile("\\d{6}(\\d{8}).*");
		Pattern p3 = Pattern.compile("(\\d{4})(\\d{2})([012][0-9])");
		for(int i=0;i<str.length;i++){
			Matcher matcher = p1.matcher(str[i]);
			System.out.println(str[i]+": "+matcher.matches());
		}
		for(int i=0 ;i<str.length;i++){
			Matcher matcher = p2.matcher(str[i]);
			boolean b = matcher.find();
			if(b){
				String s = matcher.group(1);
				Matcher matcher2 = p3.matcher(s);
				if(matcher2.find()){
					System.out.println("生日为： "+matcher2.group(1)+"年"+matcher2.group(2)+"月"+matcher2.group(3)+"日");
				}
			}
		}
	}

}
