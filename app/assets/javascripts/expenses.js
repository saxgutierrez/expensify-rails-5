// funcion para filtrar por dos parametros type y category
function x(){

	$(".list-group-item").click(function(){

		model = $(this).attr("model");
		id = $(this).attr("modelid");

		if (model == "type"){
			localStorage.setItem('type',id);
		}
		else{
			localStorage.setItem('category',id);
		}

		type = localStorage.getItem('type');
		category = localStorage.getItem('category');


		if(type!=null && category!=null){
			window.location="/expenses?category_id="+category+"&type_id="+type;
		}else if(type!=null){
			window.location="/expenses?type_id="+type;
		}
		else
		{
			window.location="/expenses?category_id="+category;
		}
		// console.log(type,category);
	});
}


	