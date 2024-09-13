<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<fieldset> <!-- HTML요소를 박스로 묶어주는 태그 -->
   <legend>학점확인프로그램</legend> <!-- fieldset 태그에 제목을 달아주는 태그 -->
   <form action="ex01Result.jsp" method="post">
   <table align="center">
      <tr>
         <td align="left">이름</td>
         <td><input type="text" name="name"></td>
      </tr>
      <tr>
         <td>Java점수</td>
         <td><input type="text" name="java"></td>
      </tr>
      <tr>
         <td>Web점수</td>
         <td><input type="text" name="Web"></td>
      </tr>
      <tr>
         <td>IOT점수</td>
         <td><input type="text" name="iot"></td>
      </tr>
      <tr>
         <td>Android점수</td>
         <td><input tyep="text" name="and"></td>
      </tr>
      <tr>
         <td></td>
         <td><input type="submit" value="확인하기"></td>
      </tr>
   </table>
   </form>
   
</fieldset>
	
</body>
</html>