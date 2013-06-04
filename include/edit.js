

function togglePlaceholder(element){
	if (element.textContent === "" && !$(element).is(":focus")) {
		$('.placeholder', element).show();
	} else {
		$('.placeholder', element).hide();
		if (!$(element).is(":focus")) element.focus();
	}
}