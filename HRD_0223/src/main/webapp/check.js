function add() {
	console.log(document.frm);
	if (document.frm.custname.value.length == 0) {
		alert("회원성명이 입력되지 않았습니다");
		document.frm.custname.focus();
		return false;
	}
	if (document.frm.phone.value.length == 0) {
		alert("전화번호가 입력되지 않았습니다");
		document.frm.phone.focus();
		return false;
	}
	if (document.frm.address.value.length == 0) {
		alert("주소가 입력되지 않았습니다");
		document.frm.address.focus();
		return false;
	}
	if (document.frm.joindate.value.length == 0) {
		alert("가입일자가 입력되지 않았습니다");
		document.frm.joindate.focus();
		return false;
	}
	if (document.frm.grade.value.length == 0) {
		alert("고객등급이 입력되지 않았습니다");
		document.frm.custgradename.focus();
		return false;
	}
	if (document.frm.city.value.length == 0) {
		alert("도시코드가 입력되지 않았습니다");
		document.frm.city.focus();
		return false;
	}
	alert("회원등록이 완료되었습니다");
	return true;
}


function search() {
	window.location.href = "list.jsp";
}


function modify(){
	alert("회원정보 수정이 완료되었습니다 !");
	return true;
}