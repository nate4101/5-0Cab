// Get list of Cab# available
$('.dropdown-inverse li > a').click(function(e){
	 document.getElementById("change").value = (this.innerHTML);
});