
//video before the elements appear on the page
window.addEventListener("DOMContentLoaded",function(){
    if(sessionStorage.mandopedia){
        document.getElementsByClassName("video-wrapper")[0].classList.add("d-none");
    }else{
        document.getElementById("video-logo").addEventListener("ended", function(){
            $(this).parent().hide("slow");
            sessionStorage.setItem("mandopedia",true);//only exists in the open tab
        })
    }
    
})


$(function(){
    //div parent of inputs for the effect
    $("#register .block-form div").addClass("input-field");

    //other styles
    $("#main").siblings("header").addClass("header-no-background");
    
    //container of the agreements check for positioning
    $("#register .input-check").parent().addClass("block-checkbox");

    //hover over links
    $("footer a").each(function(){
        $(this).on("mouseover",function(){
            $(this).addClass("animate__animated animate__rubberBand");
        });
        $(this).on("mouseleave",function(){
            $(this).removeClass("animate__animated animate__rubberBand");
        });
    });

    //Height of textarea
    try{ //in other page this doesn't exist
        $("#textarea-modification")[0].style.height = $("#textarea-modification")[0].scrollHeight + 5 + "px";
    
        $("#textarea-modification").on("input",function(){
            $(this)[0].style.height = "auto";
            $(this)[0].style.height = $(this)[0].scrollHeight + 5 + "px";
        });
    }catch(e){}

    //Create modification
    $("#btnCreateModification").on("click", function(e){ //Edit button
        e.preventDefault();
        $("#btnSaveModification").removeClass("d-none");
        $("#btnCancelModification").removeClass("d-none");
        $("#textarea-modification")[0].disabled = false;
        $("#textarea-modification").removeClass("no-borders");
        $("#textarea-modification").addClass("with-borders");
    });

    $("#btnCancelModification").on("click", function(e){
        e.preventDefault();
        $("#btnSaveModification").addClass("d-none");
        $("#btnCancelModification").addClass("d-none");
        $("#textarea-modification")[0].disabled = true;
        $("#textarea-modification").removeClass("with-borders");
        $("#textarea-modification").addClass("no-borders");
    });

    //Update publications with ajax
    $("#listModification .button-container a").on("click",function(e){
        let idPost = $(e.target).attr("data-id-post");
        let idMod = $(e.target).attr("data-id-mod");

        $.ajax({
            url:"/publication/update/" + idPost + "/" + idMod
        })
        .done(function(){
            $("#"+idMod).hide();
            infoNotification("Publicación actualizada correctamente");
        })
        .fail(function(){
            errorNotification("No se ha podido actualizar la publicación");
        })
    })


    //MATERIALIZE
    //initialization parallax
    $('.parallax').parallax();

    //initialization navbar
    $('.sidenav').sidenav();

    //initialization dropdown
    $('.dropdown-trigger').dropdown();

    //FORM VALIDATION WITH JS
    let text = /\w+/i; //Omit the g flag beacuse it saves the state so the first test() 
                       //will return true and the second on the same expression will return false
    let password = /\w{6,}/i;
    let email = /[a-zA-Z-._0-9]+@[a-z0-9-.]+[.][a-z]{2,4}$/i;
    let loginUsernameValidate = false;
    let loginPasswordValidate = false;
    let registerUsernameValidate = false;
    let registerEmailValidate = false;
    let registerPassword1Validate = false;
    let registerPassword2Validate = false;
    let registerFirstnameValidate = false;
    let registerLastnameValidate = false;
    let checkboxValidate = false;
    let recoverPasswordValidate = false;

    //LOGIN
    $("#loginUsername").on("keyup",function(){
        loginUsernameValidate = validateInput(text,$("#loginUsername")); //only change the styles of the input typping
        validateLoginForm(loginUsernameValidate,loginPasswordValidate);
    });

    $("#loginPassword").on("keyup",function(){
        loginPasswordValidate = validateInput(password,$("#loginPassword"));
        validateLoginForm(loginUsernameValidate,loginPasswordValidate);
    });

    //REGISTER
    $("#registration_form_username").on("keyup",function(){
        registerUsernameValidate = validateInput(text,$("#registration_form_username"));
        validateRegisterForm(registerUsernameValidate,registerEmailValidate,registerPassword1Validate,registerPassword2Validate,registerFirstnameValidate,registerLastnameValidate,checkboxValidate);
    });

    $("#registration_form_email").on("keyup",function(){
        registerEmailValidate = validateInput(email,$("#registration_form_email"));
        validateRegisterForm(registerUsernameValidate,registerEmailValidate,registerPassword1Validate,registerPassword2Validate,registerFirstnameValidate,registerLastnameValidate,checkboxValidate);
    });

    $("#registration_form_plainPassword").on("keyup",function(){
        registerPassword1Validate = validateInput(password,$("#registration_form_plainPassword"));
        validateRegisterForm(registerUsernameValidate,registerEmailValidate,registerPassword1Validate,registerPassword2Validate,registerFirstnameValidate,registerLastnameValidate,checkboxValidate);
    });

    $("#registration_form_plainPassword2").on("keyup",function(){
        registerPassword2Validate = validateInput(password,$("#registration_form_plainPassword2"));
        validateRegisterForm(registerUsernameValidate,registerEmailValidate,registerPassword1Validate,registerPassword2Validate,registerFirstnameValidate,registerLastnameValidate,checkboxValidate);
    });

    $("#registration_form_firstname").on("keyup",function(){
        registerFirstnameValidate = validateInput(text,$("#registration_form_firstname"));
        validateRegisterForm(registerUsernameValidate,registerEmailValidate,registerPassword1Validate,registerPassword2Validate,registerFirstnameValidate,registerLastnameValidate,checkboxValidate);
    });

    $("#registration_form_lastname").on("keyup",function(){
        registerLastnameValidate = validateInput(text,$("#registration_form_lastname"));
        validateRegisterForm(registerUsernameValidate,registerEmailValidate,registerPassword1Validate,registerPassword2Validate,registerFirstnameValidate,registerLastnameValidate,checkboxValidate);
    });

    $("#registration_form_agreeTerms").on("click",function(){
        checkboxValidate = $("#registration_form_agreeTerms").is(":checked");
        validateRegisterForm(registerUsernameValidate,registerEmailValidate,registerPassword1Validate,registerPassword2Validate,registerFirstnameValidate,registerLastnameValidate,checkboxValidate);
    });

    //RECOVER PASSWORD
    $("#recoverPasswordEmail").on("keyup",function(){
        recoverPasswordValidate = validateInput(email,$("#recoverPasswordEmail"));
        if(recoverPasswordValidate)
            $("#recoverPassword button[type='submit']").removeClass("disabled");
        else
            $("#recoverPassword button[type='submit']").addClass("disabled");
    });

    ///////////FUNCTIONS
    /**
     * Validate the value of an input
     * @param {Object} exp - The RegExp object to validate with
     * @param {Object} tagName - The DOM element obejct for validate
     * @returns {Boolean}
     */
    
    function validateInput(exp,tagName){
        if(exp.test(tagName.val())){ //test the input
            tagName.removeClass("error correct"); //to avoid repeated classes
            tagName.addClass("correct");
            return true;
        }else{
            tagName.removeClass("error correct");
            tagName.addClass("error");
            return false;
        }
    }

    /**
     * If the inputs of the login form are valid, the button is activated
     * @param {Boolean} loginUsernameValidate 
     * @param {Boolean} loginUsernamePassword 
     */
    function validateLoginForm(loginUsernameValidate,loginUsernamePassword){
        if(loginUsernameValidate && loginUsernamePassword)
            $("#login button[type='submit']").removeClass("disabled");
        else
            $("#login button[type='submit']").addClass("disabled");
    }

    /**
     * If the inputs of teh register form are validated, the button is activated
     * @param {Boolean} registerUsernameValidate 
     * @param {Boolean} registerEmailValidate 
     * @param {Boolean} registerPassword1Validate 
     * @param {Boolean} registerPassword2Validate 
     * @param {Boolean} registerFirstnameValidate 
     * @param {Boolean} registerLastnameValidate 
     * @param {Boolean} checkboxValidate 
     */
    function validateRegisterForm(registerUsernameValidate,registerEmailValidate,registerPassword1Validate,registerPassword2Validate,registerFirstnameValidate,registerLastnameValidate,checkboxValidate){
        if(registerUsernameValidate && registerEmailValidate && registerPassword1Validate && registerPassword2Validate && registerFirstnameValidate && registerLastnameValidate && checkboxValidate)
            $("#register button[type='submit']").removeClass("disabled");
        else
            $("#register button[type='submit']").addClass("disabled");
    }


})



