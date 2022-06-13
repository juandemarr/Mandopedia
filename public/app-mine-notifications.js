//NOTY
function errorNotification(error){
    new Noty({
        type:"error",
        theme:"metroui",
        text:error,
        timeout:"2500",
        progressBar:true,
    }).show();
}

function infoNotification(success){
    new Noty({
        type:"success",
        theme:"metroui",
        text:success,
        timeout:"2500",
        progressBar:true,
    }).show();
}

function warningNotification(warn){
    new Noty({
        type:"warning",
        theme:"metroui",
        text:warn,
        timeout:"2500",
        progressBar:true,
    }).show();
}

function showModifications(){
    new Noty({
        type:"warning",
        theme:"metroui",
        text:"Hay solicitudes de nuevas modificaciones",
        timeout:"2000",
        progressBar:true,
        callbacks:{
            onClick:function(){
                window.location = '/modification';
            },
        }
    }).show();
}
