$(document).ready(function() {  // When HTML DOM "click" event is invoked on element with ID "somebutton", execute the following function...
    $.get("RetreiveRequests", function(responseJson) {    // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response JSON...
        var $ul = $("<ul>").appendTo($("#append")); // Create HTML <ul> element and append it to HTML DOM element with ID "somediv".
        $.each(responseJson, function(index, item) { // Iterate over the JSON array.
            $("<li>").text(responseJson[0]).appendTo($ul);      // Create HTML <li> element, set its text content with currently iterated item and append it to the <ul>.
        });
    });
});