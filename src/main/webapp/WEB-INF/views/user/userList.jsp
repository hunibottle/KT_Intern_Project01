<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../include/header.jsp" %>
    <style>
    @import url(//fonts.googleapis.com/earlyaccess/jejumyeongjo.css);
    @import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Jua&family=Noto+Sans+KR:wght@100&family=Noto+Serif+KR:wght@200;300;900&display=swap');
    .jm-font{
    	font-family: 'Do Hyeon', sans-serif;
    }
    .table{
    	font-family: 'Do Hyeon' sans-serif;
    }
    
    .hoverClass:hover{
    	background-color:#787878;
    }
    </style>
            <div class="row">
                <!-- <div class="col-lg-12">
                    <h1 class="page-header"></h1>
                </div> -->
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                        	<a href="${ContextPath}/memberProject/user/userList">
                           <img src="/memberProject/resources/img/logo.png" style="height:60px; float:left; margin-top:15px; padding-right:20px">
                           </a>
                           <h1 class="jm-font">IT팀 업무/담당자 조회</h1> 
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div id="dataTables-example_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
                            <form name="search_form" method="post" onsubmit="return false">
	                            <div class="row">
		                            <div class="col-sm-6">
			                            <div class="dataTables_length" id="dataTables-example_length">
			                            <div class="col-sm-6">
			                            <div class="dataTables_paginate paging_simple_numbers" id="dataTables-example_paginate">
			                            	<ul class="pagination" style="width:1000px;">
			                            		<li value="고객관리시스템" class="paginate_button active" aria-controls="dataTables-example" tabindex="0" id="a1" onclick="sort('a1')"><a href="#">고객관리시스템</a></li>
			                            		<li class="paginate_button" aria-controls="dataTables-example" tabindex="0" id="a2" onclick="sort('a2')"><a href="#">내부지원시스템</a></li>
			                            		<li class="paginate_button" aria-controls="dataTables-example" tabindex="0" id="a3" onclick="sort('a3')"><a href="#">대외지원시스템</a></li>
			                            		<li class="paginate_button" aria-controls="dataTables-example" tabindex="0" id="a4" onclick="sort('a4')"><a href="#">인프라 기획</a></li>
			                            		<li class="paginate_button" aria-controls="dataTables-example" tabindex="0" id="a5" onclick="sort('a5')"><a href="#">정보보호</a></li>
			                            	</ul>
			                            </div>
			                            <script>
			                            	var gValue = '';
			                            	window.onload=function(){
			                            		gValue='고객관리시스템';
			                            	}
			                            	function sort(st){
			                            		if(st === 'a1'){
			                            			$(".pagination li").removeClass("active");
				                            		document.getElementById('a1').classList.add("active");
				                            		var sortValue = "고객관리시스템";
				                            		gValue = sortValue;
			                            		}
			                            		if(st === 'a2'){
			                            			$(".pagination li").removeClass("active");
				                            		document.getElementById('a2').classList.add("active");
				                            		var sortValue = "내부지원시스템";
				                            		gValue = sortValue;
			                            		}
			                            		if(st === 'a3'){
			                            			$(".pagination li").removeClass("active");
				                            		document.getElementById('a3').classList.add("active");
				                            		var sortValue = "대외지원시스템";
				                            		gValue = sortValue;
			                            		}
			                            		if(st === 'a4'){
			                            			$(".pagination li").removeClass("active");
				                            		document.getElementById('a4').classList.add("active");
				                            		var sortValue = "인프라/기획";
				                            		gValue = sortValue;
			                            		}
			                            		if(st === 'a5'){
			                            			$(".pagination li").removeClass("active");
				                            		document.getElementById('a5').classList.add("active");
				                            		var sortValue = "정보보호";
				                            		gValue = sortValue;
			                            		}
			                            		
			                            		/* console.log(sortValue); */
			                            		 $.ajax({
			                            			type:"post",
			                            			url:"${contextPath}/user/suser",
			                            			data:{"sortValue":sortValue},
			                            			dataType:"json",
			                                        success: function(result){
			                                        	$('#userList tbody tr').empty();
			                                        	$('#userList > tbody:last > tr:last').remove();
			                            				for(let pp of result){
			                            					console.log(pp);
			                            					var num = pp.USER_SEQ;
			                            					var ud = pp.USER_DEPARTMENT;
			                            					var uc = pp.USER_CATEGORY;
			                            					var uw = pp.USER_WORK;
			                            					var un = pp.USER_NAME;
			                            					var up = pp.USER_PHONE;
			                            					var position = pp.USER_POSITION;
			                            					var content = pp.WORK_CONTENT;
			                            					var inner ="";
			                            					inner += '<tr onclick="detail('+num+')">'
			                            					inner += '<td style="text-align:center">'+ud+'</td>';
			                            					inner += '<td style="text-align:center">'+uc+'</td>';
			                            					inner += '<td style="text-align:center">'+uw+'</td>';
			                            					inner += '<td style="text-align:center">'+un+'</td>';
			                            					inner += '<td style="text-align:center">'+position+'</td>';
			                            					inner += '<td style="text-align:center">'+up+'</td>';
			                            					inner += '<td>'+content+'</td>';
			                            					inner += '</tr>'
			                            					$('#userList > tbody:last').append(inner);
			                            				}
			                                        	console.log(result);
			                                        },error: function (e){
			                                            console.log('error', e);
			                                            console.log("에러다");
			                                        } 
			                            		}) 
			                            	}
			                            	var sortNum = 1;
			                            	var a = gValue;
			                            	function nameSort(){
			                            		console.log(a);
			                            		var keyword = $('.active').val();
			                            		sortNum = sortNum+1;
			                            		if(sortNum % 2 == 0){
			                            			var orderOption = "올림";
			                            			console.log("올림");
			                            		}else{
			                            			console.log("내림");
			                            			var orderOption = "내림";
			                            		}
			                            		console.log(gValue);
			                            		$.ajax({
			                            			type:"post",
			                            			url:"${contextPath}/user/sortName",
			                            			data:{"orderOption":orderOption, "gValue":gValue},
			                            			dataType:"json",
			                                        success: function(result){
			                                        	$('#userList tbody tr').empty();
			                                        	$('#userList > tbody:last > tr:last').remove();
			                            				for(let pp of result){
			                            					console.log(pp);
			                            					var num = pp.USER_SEQ;
			                            					var ud = pp.USER_DEPARTMENT;
			                            					var uc = pp.USER_CATEGORY;
			                            					var uw = pp.USER_WORK;
			                            					var un = pp.USER_NAME;
			                            					var up = pp.USER_PHONE;
			                            					var position = pp.USER_POSITION;
			                            					var content = pp.WORK_CONTENT;
			                            					var inner ="";
			                            					inner += '<tr onclick="detail('+num+')">'
			                            					inner += '<td style="text-align:center">'+ud+'</td>';
			                            					inner += '<td style="text-align:center">'+uc+'</td>';
			                            					inner += '<td style="text-align:center">'+uw+'</td>';
			                            					inner += '<td style="text-align:center">'+un+'</td>';
			                            					inner += '<td style="text-align:center">'+position+'</td>';
			                            					inner += '<td style="text-align:center">'+up+'</td>';
			                            					inner += '<td>'+content+'</td>';
			                            					inner += '</tr>'
			                            					$('#userList > tbody:last').append(inner);
			                            				}
			                                        	console.log(result);
			                                        },error: function (e){
			                                            console.log('error', e);
			                                            console.log("에러다");
			                                        } 
			                            		}) 
			                            	}
			                            </script>
                           			</div>
			                        </div>
		                        	</div>
		                            <div class="col-sm-6">
		                            	<label style="float: left;">검색 조건 
				                          <select id="select_value" name="dataTables-example_length" aria-controls="dataTables-example" class="form-control input-sm">
				                          		<option value="1">담당업무</option>
				                            	<option value="10">대분류</option>
				                           	 	<option value="25">중분류</option>
				                            	<option value="50">시스템</option>
				                            	<option value="100">담당자</option>
				                          </select>
				                    	</label>
		                            	<div id="dataTables-example_filter" class="dataTables_filter">
		                           		<label>Search:
			                            	<input type="search" id="keyword" class="form-control input-sm"
			                            	 placeholder="검색어" aria-controls="dataTables-example" style="width:500px" onKeyPress="if(window.event.keyCode==13){getSearchList()}">
			                            	<input type="button" class="paginate_button" value="검색" onclick="getSearchList()">
				                            <script>
				                            	function getSearchList(){
				                            		console.log("검색 버튼 클릭");
				                            		var keyword = document.getElementById('keyword').value;
				                            		var option = document.getElementById('select_value').value;
				                            		console.log(keyword);
				                            		console.log(option);
				                            		$.ajax({
				                            			type:"post",
				                            			url:"${ContextPath}/memberProject/user/getSearchList",
				                            			data:{"keyword":keyword, "option":option},
				                            			dataType:"json",
				                            			success: function(result){
				                            				$('#userList tbody tr').empty();
				                            				console.log("검색 매핑 성공");
				                            				console.log(result);
				                            				$('#userList > tbody:last > tr:last').remove();
				                            				for(let pp of result){
				                            					console.log(pp);
				                            					var num = pp.USER_SEQ;
				                            					var ud = pp.USER_DEPARTMENT;
				                            					var uc = pp.USER_CATEGORY;
				                            					var uw = pp.USER_WORK;
				                            					var un = pp.USER_NAME;
				                            					var us = pp.USER_STATE;
				                            					var up = pp.USER_PHONE;
				                            					var content =pp.WORK_CONTENT;
				                            					var position = pp.USER_POSITION;
				                            					var inner ="";
				                            					inner += '<tr onclick="detail('+num+')">'
				                            					inner += '<td style="text-align:center">'+ud+'</td>';
				                            					inner += '<td style="text-align:center">'+uc+'</td>';
				                            					inner += '<td style="text-align:center">'+uw+'</td>';
				                            					inner += '<td style="text-align:center">'+un+'</td>';
				                            					inner += '<td style="text-align:center">'+position+'</td>';
				                            					inner += '<td style="text-align:center">'+up+'</td>';
				                            					inner += '<td>'+content+'</td>';
				                            					inner += '</tr>'
				                            					$('#userList > tbody:last').append(inner);
				                            				}
				                            			},error: function (e){
				                                            console.log('error', e);
				                                            console.log("에러다");
				                                        }
				                            		})
				                            	}
				                            	
				                            		$('#keyword').autocomplete({
					                            		source:function(request, response){
					                            			var value = document.getElementById('keyword').value;
					                            			var option = document.getElementById('select_value').value;
					                            			console.log(value);
					                            			$.ajax({
					                            				type:"post",
						                            			url:"${ContextPath}/memberProject/user/autoComplete",
						                            			data:{"value":value, "option":option},
						                            			dataType:"json",
						                            			success:function(data){
						                            				if(option == 1){
							                            				response(
							                            						$.map(data.resultList, function(item){
							                            							return{
							                            									label:item.WORK_CONTENT,
								                            								value:item.WORK_CONTENT
							                            							};
							                            						})
							                            					);
							                            				}else if(option == 10){
								                            				response(
								                            						$.map(data.resultList, function(item){
								                            							return{
								                            									label:item.USER_DEPARTMENT,
									                            								value:item.USER_DEPARTMENT
								                            							};
								                            						})
								                            					);
						                            				}else if(option == 25){
						                            					response(
							                            						$.map(data.resultList, function(item){
							                            							return{
							                            									label:item.USER_CATEGORY,
								                            								value:item.USER_CATEGORY
							                            							};
							                            						})
							                            					);
						                            				}else if(option == 50){
						                            					response(
							                            						$.map(data.resultList, function(item){
							                            							return{
							                            									label:item.USER_WORK,
								                            								value:item.USER_WORK
							                            							};
							                            						})
							                            					);
						                            				}else if(option == 100){
						                            					response(
							                            						$.map(data.resultList, function(item){
							                            							return{
							                            									label:item.USER_NAME,
								                            								value:item.USER_NAME
							                            							};
							                            						})
							                            					);
						                            				}
						                            			},error: function(e){
						                            				console.log(e);
						                            			}
					                            			})
					                            		}
				                            		,focus : function(event, ui){
				                            			return false;
				                            		},
				                            		minLengh:1,
				                            		autoFocus:true,
				                            		delay:100,
				                            		autoFill: true,
				                            		select:function(evt, ui){
				                            			console.log(ui.item);
				                            			
				                            		}
					                            });
				                            </script>	
		                            	</label>
		                            	</div>
		                            </div>
	                            </div>
	                            </form>
	                            <div class="row">
	                            <div class="col-sm-12">
	                            <table id="userList" width="100%" class="table table-striped table-bordered table-hover dataTable no-footer dtr-inline" id="dataTables-example" role="grid" aria-describedby="dataTables-example_info" style="width: 100%;">
                                <thead>
                                    <tr role="row">
                                    <th class="list_class" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Rendering engine: activate to sort column descending" style="width: 65px; text-align:center">대분류</th>
                                    <th class="list_class" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending" style="width: 55px; text-align:center">중분류</th>
                                    <th class="list_class" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending" style="width: 100px; text-align:center">시스템(업무)</th>
                                    <th class="sorting" onClick="nameSort()" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending" style="width: 40px; text-align:center">담당자</th>
                                    <th class="list_class" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending" style="width: 40px; text-align:center">직책</th>
                                    <th class="list_class" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending" style="width: 60px; text-align:center">전화번호</th>
                                    <th class="list_class" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending" style="width: 500px;">담당업무</th>
                                </thead>
                                <c:forEach items="${list}" var = "user">
	                                <tr>
	                                	<td style="text-align:center"><c:out value="${user.user_department}"/></td>
	                                	<td style="text-align:center"><c:out value="${user.user_category}"/></td>
	                                	<td style="text-align:center"><c:out value="${user.user_work}"/></td>
	                                	<td style="text-align:center"><c:out value="${user.user_name}"/></td>
	                                	<td style="text-align:center"><c:out value="${user.user_position}"/></td>
	                                	<td style="text-align:center"><c:out value="${user.user_phone}"/></td>
	                                	<td><c:out value="${user.work_content}"/></td>
	                                </tr>
                                </c:forEach>
                            </table>
                            </div></div>
                            <div class="row">
                          </div>
                        </div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <!-- /.panel-heading -->
                        <div class="panel-body" style="text-align: center">
                            <div class="table-responsive table-bordered">
                                <table class="table" style="font-weight: bolder">
                                    <thead>
                                        <tr>
                                            <td colspan='8' bgcolor="#ddd" style="text-align: center; font-size: 20px">IT팀 자리 배치도</td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<tr>
	                                    	<td class='hoverClass' colspan='2' bgcolor="#F5F5F5" style="font-size: 22px; vertical-align : middle; cursor:pointer; margin:auto" onClick="team('기획')">IT기획</td>
	                                    	<td rowspan='7'></td>
	                                    	<td rowspan='2' colspan='2' style="vertical-align : middle; font-size: 20px; margin:auto">최돈무 팀장</td>
	                                    	<td rowspan='7'></td>
	                                    	<td class='hoverClass' colspan='2' bgcolor="#F5F5F5" style="font-size: 22px; vertical-align : middle; cursor:pointer" onClick="team('정보보호')">정보보호</td>
                                    	</tr>
                                        <tr>
                                            <td>박진석 대리</td>
                                            <td>박춘규 차장</td>
                                            <td colspan='2'>김경삼 파트장</td>
                                        </tr>
                                        <tr>
                                            <td>한지혜 주임</td>
                                            <td>이선민 주임</td>
                                            <td colspan='2'></td>                                 
                                            <td>우제은 차장</td>
                                            <td>장윤아 대리</td>
                                        </tr>
                                        
                                        <tr>
	                                    	<td class='hoverClass' colspan='2' bgcolor="#F5F5F5" style="font-size: 22px; vertical-align : middle; cursor:pointer" onClick="team('개발')">IT개발 지원</td>
	                                    	<td class='hoverClass' colspan='2' bgcolor="#F5F5F5" style="font-size: 22px; vertical-align : middle; cursor:pointer" onClick="team('인프라')">IT운영 지원</td>
	                                    	<!-- <td colspan='4'></td> -->
                                    	</tr>
                                        <tr>
                                            <td>유일수 과장</td>
                                            <td>이종기 과장</td>
                                            <td colspan='2' style="text-align: center;">권혁참 차장</td>
                                        </tr>
                                        <tr>
                                            <td>김성민 과장</td>
                                            <td>정세민 대리</td>
                                            <td>장호인 선임</td>
                                            <td>윤석준 과장</td>
                                        </tr>
                                        <tr>
                                            <td>이주형 주임</td>
                                            <td></td>
                                            <td>강동규 주임</td>
                                            <td>진형진 주임</td>
                                        </tr>
                                    </tbody>
                                </table>
                                <script>
                                	function team(st){
                                		if(st == '기획'){
                                			var teamValue = '기획';
                                		}else if(st == '인프라'){
                                			var teamValue = '인프라';
                                		}else if(st == '정보보호'){
                                			var teamValue = '정보보호';
                                		}else if(st == '개발'){
                                			var teamValue = '개발';
                                		}
                                		
                                		console.log(teamValue);
                                		$.ajax({
	                            			type:"post",
	                            			url:"${ContextPath}/memberProject/user/sortTeam",
	                            			data:{"teamValue": teamValue},
	                            			dataType:"json",
	                            			success: function(result){
	                            				$('#userList tbody tr').empty();
	                            				console.log("검색 매핑 성공");
	                            				console.log(result);
	                            				$('#userList > tbody:last > tr:last').remove();
	                            				for(let pp of result){
	                            					console.log(pp);
	                            					var num = pp.USER_SEQ;
	                            					var ud = pp.USER_DEPARTMENT;
	                            					var uc = pp.USER_CATEGORY;
	                            					var uw = pp.USER_WORK;
	                            					var un = pp.USER_NAME;
	                            					var us = pp.USER_STATE;
	                            					var up = pp.USER_PHONE;
	                            					var content =pp.WORK_CONTENT;
	                            					var position = pp.USER_POSITION;
	                            					var inner ="";
	                            					inner += '<tr onclick="detail('+num+')">'
	                            					inner += '<td style="text-align:center">'+ud+'</td>';
	                            					inner += '<td style="text-align:center">'+uc+'</td>';
	                            					inner += '<td style="text-align:center">'+uw+'</td>';
	                            					inner += '<td style="text-align:center">'+un+'</td>';
	                            					inner += '<td style="text-align:center">'+position+'</td>';
	                            					inner += '<td style="text-align:center">'+up+'</td>';
	                            					inner += '<td>'+content+'</td>';
	                            					inner += '</tr>'
	                            					$('#userList > tbody:last').append(inner);
	                            				}
	                            			},error: function (e){
	                                            console.log('error', e);
	                                            console.log("에러다");
	                                        }
	                            		})
	                            	}
                                </script>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-6 -->
            </div>
            <!-- /.row -->
            <!-- /.row -->
    <!-- /#wrapper -->
    </body>
</html>