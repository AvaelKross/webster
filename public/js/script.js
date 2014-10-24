function validateEmail(email) { 
	var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	return re.test(email);
}
var params = [];
var query = location.search.substr(1); 
var A = query.split("&");
var qwe;
for (var j=0; j<A.length; j++){ qwe = A[j].split("="); params[qwe[0]] = qwe[1]; }
var key;
key = params['key'];
if (key==undefined) {key="Прямой заход";}
var group = params['group']
var mail = params['mail']

$(document).ready(function() {
	if (mail) {
		//$(".no-mail").hide();
		//$(".with-mail").show();
		$(".with-mail .phone").html("8-900-20-14-333");
		$(".phone_bottom").html("<b>8-900-20-14-333</b>");
	}

	$(".closer").on('click', function(){
		$(".popup").css("display", "none");
	});
	
	$(".call-me-button").on('click', function(){
		$("#popup1").css("display", "block"); 
	});
	
	// var phonemask = "+7 (999) 999-99-99"
	// $("#phone").mask(phonemask);
	// $("#phone1").mask(phonemask);
	// $("#phone2").mask(phonemask);
	
	// $(".fancybox").fancybox();

	function send_data(name, email, phone, form){
		if ($(name).val().length==0) { alert("Пожалуйста, введите своё имя"); return;}
		if ($(phone).val().length==0) { alert("Пожалуйста, введите свой номер телефона"); return;}
		if ($(email).val().length==0) { alert("Пожалуйста, введите свой адрес электронной почты"); return;}
		if (!validateEmail($(email).val())) { alert("Пожалуйста, введите корректный адрес электронной почты"); return;}
		
		$.ajax({
		  type: "POST",
		  dataType: 'json',
		  url: "ajax-proxy",
		  data: { name: $(name).val(), email: $(email).val(), phone: $(phone).val(), form: form, key: decodeURIComponent(key) }
		})
		  .done(function( msg ) {
			console.log(msg);
		  });
		$("#popup1").css("display", "none");
		$("#popup2").css("display", "block"); 
	}
	
	$("#submit_button2").on('click', function(){send_data('#name2', '#email2', '#phone2', "лидформа2")});
	$("#submit_button1").on('click', function(){send_data('#name1', '#email1', '#phone1', "лидформа1")});
	$("#in-popup-button").on('click', function(){send_data('#name', '#email', '#phone', "попап")});
	//$('.slider1').mobilyslider();
});