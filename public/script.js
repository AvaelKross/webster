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
	var title = "Изготовление деталей любого класса точности, <br>обработка всех видов металлов<br>за срок от 1-го рабочего дня";
	switch (group) {
	case "gibka":
		title = "Гибка и другие виды обработки металлов. <br>Изготовление деталей любого класса точности<br> за срок от 1-го рабочего дня";
		break;
	case "main":
		title = "Изготовление, обработка и восстановление<br> деталей за срок от 1-го рабочего дня";
		break;
	case "na_zakaz":
		title = "Изготовление деталей любого класса точности<br> на заказ за срок от 1-го рабочего дня";
		break;
	case "zavod":
		title = "Заводское изготовление деталей любого класса<br> точности. Все виды обработки металла";
		break;
	case "po_vidam":
		title = "Изготовление деталей из металла. <br>Любой класс точности. <br> Срок от 1-го дня";
		break;
	case "izg_detalei":
		title = "Изготовление деталей из металла на заказ. <br>Обработка на станках с ЧПУ. <br>Срок от 1-го дня";
		break;
	case "izdeliya":
		title = "Изготовление изделий из металла на заказ.<br> Обработка на станках с ЧПУ. <br>Срок от 1-го дня";
		break;
	case "met_obr":
		title = "Металлообработка на станках с ЧПУ. <br>Срок выполнения от 1-го рабочего дня";
		break;
	case "obr_detalei":
		title = "Обработка деталей на станках с ЧПУ. <br>Срок выполнения от 1-го рабочего дня";
		break;
	case "obr_detalei_po_vidam":
		title = "Все виды обработки деталей из металла. <br>Срок выполнения от 1-го рабочего дня";
		break;
	case "obr_met":
		title = "Все виды обработки металла. Изготовление<br> деталей любого класса точности";
		break;
	case "obr_stali":
		title = "Все виды обработки стали. Изготовление<br> деталей любого класса точности";
		break;
	case "detali":
		title = "Изготовление и обработка деталей любого <br>класса точности. Срок выполнения<br> от 1-го рабочего дня";
		break;
	case "proizv_detalei":
		title = "Производство деталей из металла на заказ";
		break;
	case "proizv_detalei_po_vidam":
		title = "Производство деталей из металла на заказ. <br>Срок выполнения от 1-го рабочего дня";
		break;
	case "rezka":
		title = "Резка металла на заказ. <br>Срок выполнения от 1-го рабочего дня";
		break;
	case "mech_obr_met":
		title = "Механическая обработка на станках с ЧПУ.<br> Срок выполнения от 1-го рабочего дня";
		break;
	}

	$("#main_title").html(title)
	$(".closer").on('click', function(){
		$(".popup").css("display", "none");
	});
	
	$("#popup_button1").on('click', function(){
		$("#popup1").css("display", "block"); 
	});
	
	$("#popup_button2").on('click', function(){
		$("#popup1").css("display", "block"); 
	});
	
	var phonemask = "+7 (999) 999-99-99"
	$("#phone").mask(phonemask);
	$("#phone1").mask(phonemask);
	$("#phone2").mask(phonemask);
	
	$(".fancybox").fancybox();

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