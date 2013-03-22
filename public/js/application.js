$(document).ready(function(){
	 var imagePosition = 1;
    var pictures = $('.frames');
    $('#next_frame').click(function(e){           
        e.preventDefault();
        if (imagePosition === 3){
            imagePosition = 1;
            pictures.animate({
                right: '0%'
            });
        }
        else {
        imagePosition++;
        pictures.animate({
          right: '+=100%'
        }, 100);
        }
    });
    $('#previous_frame').click(function(e){
        e.preventDefault();
        if (imagePosition === 1){
            imagePosition = 3;
            pictures.animate({
                right: '200%'
            }, 100);}
        else {
        imagePosition--;
        pictures.animate({
            right: '-=100%'      
        }, 100);
        }
        
    });
	$('#album-form').hide();
	var $album_select = $('select[name=album_id]')
	
	$album_select.change(function(e){
		if ($album_select.value() === 'new'){
		$('#album-form').show();
	} else {
		$('#album-form').hide();
	};
	});
});