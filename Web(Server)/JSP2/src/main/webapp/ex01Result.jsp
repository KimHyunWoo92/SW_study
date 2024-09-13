<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%
		request.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("name");
		int java = Integer.parseInt(request.getParameter("java"));
		int web = Integer.parseInt(request.getParameter("Web"));
		int iot = Integer.parseInt(request.getParameter("iot"));
		int and = Integer.parseInt(request.getParameter("and"));
		
		// System.out.print(name+java+web+iot+and);
		
		double avg = (java+web+iot+and)/4;
		String grade = null;
		
		if(avg>=95){
			grade = "A+";	
		}else if (avg>=90){
			grade = "A";
		}else if (avg>=85){
			grade = "B+";
		}else if (avg>=80){
			grade = "B";
		}else{
			grade = "F";
		}
		
	%>
	
	<fieldset> <!-- HTML요소를 박스로 묶어주는 태그 -->
   <legend>학점확인프로그램</legend> <!-- fieldset 태그에 제목을 달아주는 태그 -->
   <table align="center" >
      <tr>
         <td align="left" colspan="3">이름</td>
         <td align="left"><%=name %></td>
      </tr>
      <tr>
         <td align="left" colspan="3">Java점수</td>
         <td align="center"><%=java%></td>
      </tr>
      <tr>
         <td align="left" colspan="3">Web점수</td>
         <td><%=web%></td>
      </tr>
      <tr>
         <td align="left" colspan="3">IOT점수</td>
         <td><%=iot %></td>
      </tr>
      <tr>
         <td align="left" colspan="3">Android점수</td>
         <td><%=and %></td>
      </tr>
      <tr>
         <td align="left" colspan="3">평균</td>
         <td><%=avg %></td>
      </tr>
      <tr>
         <td align="left" colspan="3">학점</td>
         <td><strong><%=grade %></strong></td>
      </tr>
   </table>
 
</fieldset>

</body>
</html>