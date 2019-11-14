<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>

<html lang="ko">
<head>
<meta charset="utf-8">
<title>웹 폼</title>
<style>

    
h1{
    margin:80px;
}

li {
	
	margin: 20px;
	
}

.a{ 
     border-color:/* #FFBB00; */#CE6D39; 
     border-width:5px; 
     box-shadow:2px 2px 5px 2px gray;
}

ul{ margin:20px; }

/* fieldset{
     background-color:#CE6D39; 
      } */
 #bg1 {
     background-image: url('C:\Users\user\Desktop\프로젝트 내용\옷사진.jpg')
}      
</style>
<script type="text/javascript">
	function chk() {
		if (frm.mem_pw.value != frm.mem_pw2.value) {
			alert("암호가 다릅니다");
			frm.mem_pw.focus();
			return false;
		}
		 return true; 
	}
	function winop() {
		if (!frm.mem_id.value) {
			alert("id를 입력하고 사용하세요");
			frm.mem_id.focus();
			return false;
		}
		window.open("confirmId.do?mem_id=" + frm.mem_id.value , "",
				"width=600 height=300");
	}
	
	
	/* function categoryChange(e) {
		  var addr_1 = ["서초구", "종로구", "구로구", "송파구","용산구"];
		  var addr_2 = ["속초시", "강릉시", "태백시", "삼척시","원주시"];
		  var addr_3 = ["파주시", "포천시", "남양주시", "고양시", "가평군"];
		  var addr_4 = ["용인시", "광주시", "이천시", "여주시", "평택시"];
		  var addr_5 = ["진주시", "통영시", "창원시", "김해시","밀양시"];
		  var addr_6 = ["포항시", "경주시", "안동시", "화성시","구미시"];
		  var addr_7 = ["동구", "서구", "남구", "북구","광산구"];
		  var addr_8 = ["동구", "서구", "남구", "북구","달서구"];
		  var addr_9 = ["동구", "서구", "중구", "대덕구","유성구"];
		  var addr_10 = ["동구", "서구", "남구", "북구","강서구"];
		  var addr_11 = ["전의면", "전동면", "연서면", "연기면","부강면"];
		  var addr_12 = ["동구", "중구", "남구", "북구","욜주군"];
		  var addr_13 = ["계양구", "부평구", "남동구", "중구","연수구"];
		  var addr_14 = ["여수시", "나주시", "광양시", "순천시","완도군"];
		  var addr_15 = ["남원시", "정읍시", "김제시", "군산시","전주시"];
		  var addr_16 = ["제주시", "서귀포시"];
		  var addr_17 = ["천안시", "당진시", "아산시", "공주시","논산시"];
		  var addr_18 = ["충주시", "제천시", "청주시", "단양군","진천군"];
		  var target = document.getElementById("addr");
		 
		  if(e.value == "서울특별시") var d = addr_1;
		  else if(e.value == "강원도") var d = addr_2;
		  else if(e.value == "경기북부") var d = addr_3;
		  else if(e.value == "경기남부") var d = addr_4;
		 
		  else if(e.value == "경상남도") var d = addr_5;
		  else if(e.value == "경상북도") var d = addr_6;
		  else if(e.value == "광주광역시") var d = addr_7;
		  else if(e.value == "대구광역시") var d = addr_8;
		  else if(e.value == "대전광역시") var d = addr_9;
		  else if(e.value == "부산광역시") var d = addr_10;
		  else if(e.value == "세종특별자치시") var d = addr_11;
		  else if(e.value == "울산광역시") var d = addr_12;
		  else if(e.value == "인천광역시") var d = addr_13;
		  else if(e.value == "전라남도") var d = addr_14;
		  else if(e.value == "전라북도") var d = addr_15;
		  else if(e.value == "제주특별자치도") var d = addr_16;
		  else if(e.value == "충청남도") var d = addr_17;
		  else if(e.value == "충청북도") var d = addr_18;

		  target.options.length = 0;
		 
		  for (x in d) {
		    var opt = document.createElement("option");
		    opt.value = d[x];
		    opt.innerHTML = d[x];
		    target.appendChild(opt);
		  } 
		}

	
	 */
</script>


</head>
<body >


<form action="joinPro.do" name="frm" onsubmit="return chk()">
	       
<fieldset id="bg1">
<legend><h1>회원 가입</h1></legend>

	
		<ul>
			<li><label ><input type="text" class="a" name="mem_id"
					placeholder="아이디"> <input type="button" value="중복확인"
					onclick="winop()"></label></li>
			<li><label><input type="password" class="a" name="mem_pw"
					required="required" placeholder="비밀번호"></label></li>
			<li><label><input type="password" class="a" name="mem_pw2"
					required="required" placeholder="비밀번호 확인"></label></li>
			<li><label><input type="text" class="a" name="mem_name"
					required="required" placeholder="이름"></label></li>
			<li><label><input type="tel" class="a" name="mem_phone"
					required="required" placeholder="전화번호(xxx-xxxx-xxxx)"></label></li>
			<li><label><input type="text" class="a" name="mem_email"
					required="required" placeholder="이메일"></label></li>
			<!-- <li><label><input type="text" class="a" name="mem_addr"
					required="required" placeholder="주소"></label></li>  -->
			
			<li><label class="" >주소  </label> <select
				  name="mem_addr" onChange="categoryChange(this)" >
					<option>사는 곳을 선택해주세요</option>
					<option value="서울특별시">서울특별시</option>
					<option value="강원도">강원도</option>
					<option value="경기북부">경기북부</option>
					<option value="경기남부">경기남부</option>
					<option value="경상남도">경상남도</option>
					<option value="경상북도">경상북도 </option>
					<option value="광주광역시">광주광역시</option>
					<option value="대구광역시">대구광역시</option>
					<option value="대전광역시">대전광역시</option>
					<option value="부산광역시">부산광역시</option>
					<option value="세종특별자치시">세종특별자치시</option>
					<option value="울산광역시">울산광역시</option>
					<option value="인천광역시">인천광역시</option>
					<option value="전라남도">전라남도</option>
					<option value="전라북도">전라북도</option>
					<option value="제주특별자치도">제주특별자치도</option>
					<option value="충청남도">충청남도</option>
					<option value="충청북도">충청북도</option>
                  </select>
                  <!-- <select name="mem_addr" id="addr">
                  <option>상세 주소를 선택해주세요</option>
                  </select>   -->         
                   
		 <input type="text" name="mem_add_addr" list="mem_addr"
					required="required" placeholder="나머지 주소"> </li>
			<li><label class="" >체형</label> <select
				name="mem_body_type">
					<option value="1">통통</option>
					<option value="2">슬림</option>
					<option value="3">키작은</option>
					<option value="4">키큰</option>


			</select></li>
			
			<li><label class="" name="mem_fav_loc">관심지역(중복 선택 가능)</label></li>
			 
            <label><input type="checkbox" name="mem_fav_loc" value="서울특별시">서울특별시</label>
			<label><input type="checkbox" name="mem_fav_loc" value="경기도">경기도</label>
			<label><input type="checkbox" name="mem_fav_loc" value="강원도">강원도</label><p>
			<label><input type="checkbox" name="mem_fav_loc" value="충청남도">충청남도</label>
			<label><input type="checkbox" name="mem_fav_loc" value="충청북도">충청북도</label>
			<label><input type="checkbox" name="mem_fav_loc" value="전라남도">전라남도</label><p>
			<label><input type="checkbox" name="mem_fav_loc" value="전라북도">전라북도</label>
			<label><input type="checkbox" name="mem_fav_loc" value="경상남도">경상남도</label>
			<label><input type="checkbox" name="mem_fav_loc" value="경상북도">경상북도</label><p>	
			<label><input type="checkbox" name="mem_fav_loc" value="제주도">제주도</label> 
          
          
			<li><label><input type="radio" name="mem_gender" value="1"
					required="required">남</label> <label><input type="radio"
					name="mem_gender" value="2" required="required">여</label></li>

			<li><input type="submit" value="확인"> 
			    <input type="reset"	value="취소"></li>
		</ul>
	

</fieldset>
</form>

</body>
</html>