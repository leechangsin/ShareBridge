/**
 * 
 */

const PROJECT_NAME = "sharebridge";

function goTo(url) {
	if(!url.startsWith("/")) {
		url = "/" + url;
	}
	
	if(!url.startsWith("/" + PROJECT_NAME)) {
		url = "/" + PROJECT_NAME + url;
	}
	
	location.href = url;
}

function getParameter(name) {
	let parameters = location.search;
	
	if(parameters == '') {
		return undefined;
	}
	
	parameters = parameters.substring(1);
	parameters = parameters.split("&");
	
	for(let i=0; i<parameters.length; i++) {
		let parameter = parameters[i].split("=");
		let paramName = parameter[0];
		let paramValue = parameter[1];
		
		if(paramName == name) {
			return paramValue;
		}
	}
	
	return undefined;
}