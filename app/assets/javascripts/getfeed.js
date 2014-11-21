	$(document).ready(function() {
		var feed_object = {};
		$('.ui-li-has-icon a').each(function(index, value) {
			feed_id = $(this).attr('id');
			feed_object[index] = feed_id;	
		});
        $(feed_object[0]).on('click', function() {
			var feed_url = $(this).attr('data-feed-url');
			console.log(feed_url);
			/*
			var form_data = ''; 
			
			$.ajax({
				url: '/feeds/feed_articles',
				type: 'post',
				data: form_data,
				dataType: 'json',               
			    //async: true,
                beforeSend: function() {
                    // This callback function will trigger before data is sent
                    //$.mobile.showPageLoadingMsg(true); // This will show ajax spinner
                },
                complete: function() {
                    // This callback function will trigger on data sent/received complete
                    //$.mobile.hidePageLoadingMsg(); // This will hide ajax spinner
                },
                success: function (result) {
                	resultObject.formSubmitionResult = result;
                	// $.mobile.changePage("#second");						
					var result_html = "<h4 class=\"ui-collapsible-heading ui-collapsible-heading-collapsed\"><a href=\"#\" class=\"ui-collapsible-heading-toggle ui-btn ui-icon-plus ui-btn-icon-right ui-btn-inherit\">Data submitted successfully.</a></h4>";
					$(".form_container").html(result_html);
					//console.log(result);
                },
                error: function (request,error) {
                    // This callback function will trigger on unsuccessful action                
                    alert('Network error has occurred please try again!');
					console.log(request,error);
                }
            }); */
			return false; // cancel original event to prevent form submitting
		});    
		//var resultObject = {
		//    formSubmitionResult : null  
		//}
});