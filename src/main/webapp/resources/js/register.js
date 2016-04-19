function valiUname(){
	var uname = document.getElementById("uname");
	var unameInfo = document.getElementById("unameInfo");
	var reg = /[\w]+/;
	unameInfo.innerHTML = "";
	if (uname.value == ""){
		unameInfo.innerHTML = "*username should not Null*";
		return false;
	}else if(!reg.test(uname.value) || uname.value.length >20){
		unameInfo.innerHTML ="*unnorm*";
		return false;
	}else{
		return true;
	}
}
function valiPw(){
	var pw = document.getElementById("pw");
	var pwInfo = document.getElementById("pwInfo");
	var reg = /[\w]+/;//正则表达式，字符类型
	pwInfo.innerHTML = "";
	if(pw.value == ""){
		pwInfo.innerHTML ="*password should not Null*";
		return false;
	}else if(!reg.test(pw.value) || pw.value.length > 20){
		pwInfo.innerHTML = "*unnorm*";
		return false;
	}else{
		return true;
	}
}
function valiRepw(){
	var pw = document.getElementById("pw");
	var repw = document.getElementById("repw");
	var repwInfo = document.getElementById("repwInfo");
	repwInfo = "";
	if(repw.value == ""){
		repwInfo.innerHTML = "*password should not Null*";
		return false;
	}else if( !repw.equal( pw ) || pw.value.length > 20){
		pwInfo.innerHTML = "*The password is different*";
		return false;
	}else{
		return true;
	}
}
function valiEmail(){
	var email = document.getElementById("email");
	var emailInfo = document.getElementById("emailInfo");
	var reg = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
	emailInfo = "";
	if(email.value == ""){
		emailInfo.innerHTML = "*email should not Null*";
		return false;
	}else if( !reg.test(email.value) || email.value.length > 20){
		emailInfo.innerHTML = "*unnorm*";
		return false;
	}else{
		return true;
	}
}
function validate() {
	var flag = valiUname() && valiPw() && valiRepw() && valiEemail();
	return flag;
}