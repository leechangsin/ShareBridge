/**
 * 
 */

const PROJECT_NAME = "sharebridge";

function goTo(url) {
	if(!url.startsWith("/")) {
		url = "/" + url;
	}
	
	if(!url.startsWith(PROJECT_NAME)) {
		url = "/" + PROJECT_NAME + url;
	}
	
	location.href = url;
}