// 수정페이지에서 수정하지 않을 경우, 원래 입력값을 넣어준다
if($("#start").val() != undefined || $("#end").val() != undefined) {
	let convert_s = new Date($("#start").val()).toISOString().slice(0,19);
	let convert_e = new Date($("#end").val()).toISOString().slice(0,19);
	$("#startDate").val(convert_s);
	$("#endDate").val(convert_e);	
}	
	