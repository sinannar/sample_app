//			
//			$( "#pagewrapper" ).addEventListener('click', function () {
//				alert("googles");
//			});
			
			$( ".add-url-form" ).hide();	
			
			var showlink = function (event) {
				$( ".add-url-form" ).toggle( "fast", function() {});	
				$( ".add-link-btn" ).toggle( "fast", function() {});	
			}
			
			var addlink = function () {
				$( ".add-url-form" ).toggle( "fast", function() {});	
				$( ".add-link-btn" ).toggle( "fast", function() {});	
				
			}
			
			$('form').submit(function(event) {
				// event.preventDefault();
			});
			
		
			
//			$( ".add-link-btn" ).addEventListener('click', addlinks, false);
			
//			var el = $( ".add-link-btn" );
//			el.addEventListener("click", addlinks, false);
			