$(function() {
    $('#minus').on('click', function(event){
        if ((parseInt($('#quan').val())-1) < 1) {
            $('#quan').val(1);
        }else{
            $('#quan').val(parseInt($('#quan').val())-1);
        }
    });

    $('#plus').on('click', function(event){
        if ((parseInt($('#quan').val())+1) >= (parseInt($('#inventory').text()))) {
            $('#quan').val($('#inventory').text());
        }else{
            $('#quan').val(parseInt($('#quan').val())+1);
        }
        
    });

    $('#quan').on('keyup', function(event){
        if ($('#quan').val().length == 0) {
            $('#quan').val(1);
        }
        if(parseInt($('#quan').val()) > (parseInt($('#inventory').text()))){
            $('#quan').val($('#inventory').text());
        }
        $('#quan').val(parseInt($('#quan').val())); // 避免使用者在數量前打0
    });

    $('img[name="img-list"]').on('click', function(){
        $('#img-show').attr('src', $(this).attr('src'));
    });

    $('img[name="img-list"]').on('mouseenter', function(){
        $('#img-show').attr('src', $(this).attr('src'));
        $(this).css('border', '1px solid #0096C7');
    });

    $('img[name="img-list"]').on('mouseleave', function(){
        $('#img-show').attr('src', $(this).attr('src'));
        $(this).css('border', '0');
    });

    // $('span[name="new-eval-star"]').on('mouseenter', function(){
    //     let index = $('span[name="new-eval-star"]').index(this);
    //     for (let i = 0; i <= index; i++) {
    //         $($('span[name="new-eval-star"]')[i]).css('color', '#0096C7');
    //     }
    // });

    // $('span[name="new-eval-star"]').on('mouseleave', function(){
    //     let index = $('span[name="new-eval-star"]').index(this);
    //     let count = $('span[name="new-eval-star"]').length
    //     for (count; count > index ; count--) {
    //         $($('span[name="new-eval-star"]')[count]).css('color', '#ddd');
    //     }
    // });

    $('span[name="new-eval-star"]').on('click', function(){
        let index = $('span[name="new-eval-star"]').index(this);
        let count = $('span[name="new-eval-star"]').length
        for (let i = 0; i <= index; i++) {
            $($('span[name="new-eval-star"]')[i]).css('color', '#0096C7');
            $('input[name="eval-star"]').val($($('span[name="new-eval-star"]')[i]).data('star'));
        }
        for (count; count > index ; count--) {
            $($('span[name="new-eval-star"]')[count]).css('color', '#ddd');
        }

        
    });


});