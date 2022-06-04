$(function(){
    $.blockUI({
        message: $("#loading"),
        css: {
            "border": "none",
            "backgroundColor": "rgba(0,0,0,0)",
            "backgroundSize": "100%",
        }
    }),
    $.unblockUI();
}
);
