function signUpButton() {
    let userName = $("#userName");
    let fullName = $("#fullName");
    let mobileNumber = $("#mobileNumber");
    let password = $("#password");
    let agreement = $("#agreement");
    if (userName.val() && fullName.val() && mobileNumber.val() && password.val()) {
        $(".btn.btn-primary.m-5.p-1").removeAttr("disabled");
    }
}

function onsubmitHandler() {
    let userName = $("#userName");
    let fullName = $("#fullName");
    let mobileNumber = $("#mobileNumber");
    let password = $("#password");
    console.log(password.val());
}

function showPassword(event) {
    let el = event.target;
    input = $("#password")
    if (input.attr("type") == "password") {
        el.src = "./../assets/images/hidePassword.png";
        input.attr("type", "text");
    } else {
        el.src = "./../assets/images/showPassword.png";
        input.attr("type", "password");
    }

}