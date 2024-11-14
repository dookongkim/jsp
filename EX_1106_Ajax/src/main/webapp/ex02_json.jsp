<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>
		//JSON(JavaScript Object Notation) 표기법
		//-서로 다른 플랫폼에서 데이터를 교환하기 위한 표기법
		let p ={'name':'일길동','age':30 , "tel":'010-111-1111'};
		document.write("이름 : "+p.name +"<br>");
		document.write("나이 : "+p.age+"<br>");
		document.write("전화번호 : "+p.tel+"<hr>");
		
		let p_arr=[ {'name':'육길동' , 'age':60},
					{'name':'구길동' , 'age':90}  ];
		
		for(let i=0;i<p_arr.length;i++){
			document.write(p_arr[i].name +" / "+p_arr[i].age +'<br>');
		}
		
		document.write("<hr>");
		
		let course={ 'name':'개발자과정',
				'start':'2024-01-01' ,
				'end':"2024-06-06", 
				'sub':['자바','html','jsp'],
				'student':[{'name':"소똥이", 'age':20},
						   {'name':"쥐똥이",age=30 } ] }
		
		
		</script>
	</head>
	<body>
	
	</body>
</html>