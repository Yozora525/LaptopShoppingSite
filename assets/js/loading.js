$(function(){
    $.blockUI({
        message: $("#loading"),
        css: {
            "border": "none",
            "backgroundColor": "rgba(0,0,0,0)",
            "backgroundImage": "url('LaptopShoppingSiteFront/assets/img/loading.gif')",
            "backgroundSize": "100%",
            
        }
    }),
    $.unblockUI();
}
);
