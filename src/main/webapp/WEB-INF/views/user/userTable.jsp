<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	table {
		width: 500px;
		height: 500px;
	}
	
	
	
	table, th, td{
		border: 1px solid gray;
	}
</style>
<title>Insert title here</title>
</head>
<body>
<table>
<tr>
	<!-- 셀 안에서 수평으로는 왼쪽정렬, 수직으로는 가운데 정렬 -->
	<td align="left" valign="top">1</td>
	<td align="center" valign="middle">2</td>
	<td align="right" valign="bottom">3</td>
	<td>4</td>
	<td>5</td>
</tr>
<tr>
	<!-- 컬럼 5개 합치겠다 -->
	<td colspan="5">6~10</td>
	<!-- 6~10 셀합치기 마치 엑셀처럼
	<td>7</td>
	<td>8</td>
	<td>9</td>
	<td>10</td> 
	-->
</tr>
<tr>
	<td>11</td>
	<td>12</td>
	<td rowspan="3">13</td>
	<td>14</td>
	<td rowspan="2">15</td>
</tr>
<tr>
	<td colspan="2">16</td>
	<!-- <td>17</td> -->
	<!-- <td>18</td> -->
	<td>19</td>
	<!-- <td>20</td> -->
</tr>
<tr>
	<td>21</td>
	<td>22</td>
	<!-- <td>23</td> -->
	<td>24</td>
	<td>25</td>
</tr>
</table>
</body>
</html>