$(document).ready(function(){
	$('#album-form').hide();
	var $album_select = $('select[name=album_id]')
	alert $album_select
	$album_select.change(function(e){
		if ($album_select.value() === 'new'){
		$('#album-form').show();
	} else {
		$('#album-form').hide();
	};
	});
});