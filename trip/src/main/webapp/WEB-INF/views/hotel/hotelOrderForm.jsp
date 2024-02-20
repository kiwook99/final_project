<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="take.a.trip.hotel.util.NumUtil" %>    
<%@ page import="take.a.trip.hotel.vo.HotelVO" %>
<%@ page import="java.util.List" %> 
  
<% request.setCharacterEncoding("UTF-8"); %>    
<%
	
	String hotelnum = request.getParameter("hotelnum");
	String hotelname = request.getParameter("hotelname");
	String hotelprice = request.getParameter("hotelprice");
	String hotelcheckin = request.getParameter("hotelcheckin");
	String hotelcheckout = request.getParameter("hotelcheckout");
	String totalhotelprice = NumUtil.comma_replace(hotelprice);
	
	Object obj = request.getAttribute("orderList");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<!-- Iamport 결제 api   -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!-- 다음 우편번호 주소 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

</script>

<style type="text/css">

    table {
        border-collapse: collapse;
        width: 60%;
        margin: 20px auto;
    }

    th, td {
        border: 1px solid #bcbcbc;
        padding: 10px;
        text-align: center;
    }

    .mem {
        text-align: center;
    }

    button, .pay input {
        padding: 10px 20px;
        background-color: #0aa4b5;
        color: white;
        border: 0;
        border-radius: 10px;
        cursor: pointer;
        display: inline-block;
        margin: 10px;
    }
    
    h3.mem {
        font-size: 2em; /* 텍스트 크기 조절 */
        margin-top: 10px; /* 위로 조금 올리기 */
        text-align: center; /* 가운데 정렬 */
    }


	#cardBtn:hover, #backBtn:hover {
		 background-color: #0bc5da;
		 transition-duration: 0.5s;
     }	
     
     
   	.sub-title{
		font-size: 24px;
	    padding: 24px 0;
	    line-height: 1;
	    color: #000;
	    font-weight: 800;
	    text-align: center;
	}
    
	.sub-header{
	border-bottom: 2px solid #000;
	padding: 10px 0 0;
    height: auto;
    margin-left: 100px;
    margin-right: 100px;
	}    
     
     td {
     margin-right: 30px;
     }
</style>
</head>
<body>
<%@ include file="/main.jsp" %>
<div class=sub-header>
<h3 class="sub-title">예약하기</h3>

<form name="orderForm" id="orderForm" style="margin-top: 10px;">

</div>
<br><br>

<table border="1" align="center">
<tr>

<td colspan="4" align="center" style="color:white; background-color:#0aa4b5;">					
	<font size="4">숙소 예약하기</font> 
</td>
</tr>
<tr>
	<th class="mem" style="width:100px;">예약자명</th>
	<td class="mem" id="memid"><%= memid %></td>
</tr>
<tr>
	<th class="mem">숙소명</th>
	<td class="mem"><%= hotelname %></td>
</tr>
<tr>
	<th class="mem">입실일</th>
	<td colspan="3" class="mem"><%= hotelcheckin %></td>
</tr>
<tr>
	<th class="mem">퇴실일</th>
	<td colspan="3" class="mem"><%= hotelcheckout %></td>
</tr>
<tr>
	<th class="mem">핸드폰</th>
	<td colspan="3">
		<select name="kohp" id="kohp">
        	<option value="010">010</option>
        	<option value="011">011</option>
        	<option value="016">016</option>
        	<option value="017">017</option>		        	
         </select>
         - <input type="text" name="kohp1" id="kohp1" size="2" maxlength="4" />
         - <input type="text" name="kohp1" id="kohp1" size="2" maxlength="4" />
	</td>
</tr>
<tr>
	<th class="mem">이메일</th>
	<td  colspan="3">		
		<input type="text" name="koemail"  id="koemail" style="width:100px"/>
		@ <input type="text" name="koemail1" id="koemail1" style="width:100px" placeholder="직접입력" />
		<select name="koemail2" id="koemail2">
        	 <option value="1" selected>직접입력</option>
       		 <option value="naver.com">naver.com</option>	       	   
      		 <option value="gmail.com">gmail.com</option>
      		 <option value="daum.net">daum.net</option>	       	   
         </select>
	</td>
</tr> 
<tr>
<th class="mem">결제금액</th>
<td colspan="3"><%= totalhotelprice %>원</td>
</tr>
<tr>
	<td colspan="4" align="center" class="pay"> 			
		<button type="button" id="cardBtn">결제하기</button>
		<a href="hotelSelect?hotelnum=<%= hotelnum %>"> <input type="button" id="backBtn" value="돌아가기"></a>
	</td>				
</tr>
</table>				 		        		     
</form>	

<script type="text/javascript">

	$(document).ready(function(){
		
		var memid = '<%= memid %>';
		var hotelname = '<%= hotelname %>';
		var hotelprice = '<%= hotelprice %>';		
		// alert(hotelname + " : " + hotelprice);
		
		// 이메일 
		$('#koemail2').change(function(){	
			$("#koemail2 option:selected").each(function () {
				if($(this).val()== '1'){ //직접입력일 경우 
						var aa = $("#koemail1").val();						
						$("#koemail1").val(''); //값 초기화 
						$("#koemail1").attr("readonly",false); //활성화 				
				}else{ //직접입력이 아닐경우 
						$("#koemail1").val($(this).text()); //선택값 입력 
						$("#koemail1").attr("readonly",true); //비활성화 
				}
			}); 
		}); 	
		
		$(document).on('click', '#cardBtn', function(){
			
			//가맹점 식별코드
			IMP.init('imp23814146');
			
			IMP.request_pay({
			    mid : 'INIpayTest',
			    gopaymethod : 'card',
			    oid : 'merchant_' + new Date().getTime(),
			    name : hotelname,
		        amount: hotelprice, 
			    buyername : '홍길동',
			    buyertel : '010-1234-5678'
			    //buyer_addr : '서울 양찬구 목동',
			   // buyer_postcode : '123-456'
			}, function(rsp) {
				console.log("Goods Name in IMP.request_pay: ", hotelname);
				console.log(rsp);
			    if ( rsp.success ) {
			    	var msg = '결제가 완료되었습니다.';
			        msg += '고유ID : ' + rsp.mid;
			        msg += '상점 거래ID : ' + rsp.oid;
			        msg += '결과코드 : ' + rsp.resultCode;
			        msg += '결제요청시 세팅한 주문번호 : ' + rsp.orderNumber;
			    } else {
			    	 var msg = '결제에 실패하였습니다.';
			         msg += '에러내용 : ' + rsp.error_msg;
			    }
			    alert(msg);
			});			
		});
});
</script>
</body>
</html>