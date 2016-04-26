<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		Calendar cal = Calendar.getInstance();
		int nowYear = cal.get(Calendar.YEAR);
		int nowMonth = cal.get(Calendar.MONTH) + 1;
		int nowDay = cal.get(Calendar.DAY_OF_MONTH);
		String strYear = request.getParameter("year");
		String strMonth = request.getParameter("month");
		int year = nowYear;
		int month = nowMonth;
		if (strYear != null) {
			year = Integer.parseInt(strYear);
		}
		if (strMonth != null) {
			month = Integer.parseInt(strMonth);
		}
		int preYear = year, preMonth = month - 1;
		if (preMonth < 1) {
			preYear = year - 1;
			preMonth = 12;
		}
		int nextYear = year, nextMonth = month + 1;
		if (nextMonth > 12) {
			nextYear = year + 1;
			nextMonth = 1;
		}
		cal.set(year, month - 1, 1);
		int startDay = 1;
		int endDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		int week = cal.get(Calendar.DAY_OF_WEEK);
	%>
	<STYLE type="text/css">
body {
	font-size: 9pt;
}

td {
	font-size: 9pt;
}

a:link {
	text-decoration: none;
	color: red
}

a:active {
	text-decoration: none;
	color: red
}

a:visited {
	text-decoration: none;
	color: red
}

a:hover {
	text-decoration: none;
	color: red
}
</STYLE>
</head>
<body>
	<br />&nbsp;
	<br />
	<table align="center" width="210" cellpadding="2" cellspacing="1">
		<tr>
			<td align="center"><a
				href="Calender.jsp?year=<%=preYear%>&month=<%=preMonth%>">◀</a> <b>&nbsp;<%=year%>년&nbsp;&nbsp;<%=month%>월
			</b> <a href="Calender.jsp?year=<%=nextYear%>&month=<%=nextMonth%>">▶</a>
			</td>
		</tr>
	</table>
	<table align="center" width="210" cellpadding="0" cellspacing="1"
		bgcolor="#cccccc">
		<tr>
			<td bgcolor="#e6e4e6" align="center"><font color="red">일</font>
			</td>
			<td bgcolor="#e6e4e6" align="center">월</td>
			<td bgcolor="#e6e4e6" align="center">화</td>
			<td bgcolor="#e6e4e6" align="center">수</td>
			<td bgcolor="#e6e4e6" align="center">목</td>
			<td bgcolor="#e6e4e6" align="center">금</td>
			<td bgcolor="#e6e4e6" align="center"><font color="blue">토</font>
			</td>
		</tr>
		<%
			int newLine = 0;
			out.print("<tr height='20'>");
			for (int i = 1; i < week; i++) {
				out.print("<td bgcolor='#ffffff'>&nbsp;</td>");
				newLine++;
			}
			for (int i = startDay; i <= endDay; i++) {
				String fontColor = (newLine == 0) ? "red"
						: (newLine == 6) ? "blue" : "black";
				String bgColor = (nowYear == year) && (nowMonth == month)
						&& (nowDay == i) ? "#e6e6e6" : "#fff";
				out.print("<td align='center' bgcolor='" + bgColor
						+ "'><font color='" + fontColor + "'>" + i
						+ "</font></td>");
				newLine++;
				if (newLine == 7 && i != endDay) {
					out.print("</tr><tr height='20'>");
					newLine = 0;
				}
			}
			while (newLine > 0 && newLine < 7) {
				out.print("<td bgcolor='#ffffff'>&nbsp;</td>");
				newLine++;
			}
			out.print("</tr>");
		%>
	</table>
</body>
</html>