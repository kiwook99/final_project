package take.a.trip.hotel.util;

import java.text.DecimalFormat;

public class NumUtil {
	
	public static String comma(String s) {
		int iS = Integer.parseInt(s);
		return new DecimalFormat("###,###").format(iS);		
	}
	
	public static String comma_replace(String s) {
	    if (s == null) {
	        return "";
	    }

	    String ss = s.replaceAll("(\\d)(?=(\\d{3})+$)", "$1,");
	    return ss;
	}
	
	public static void main(String args[]) {
		//System.out.println(NumUtil.comma("5000"));
		System.out.println(NumUtil.comma_replace("5000"));
		System.out.println(NumUtil.comma_replace("5000"));
	}

}
