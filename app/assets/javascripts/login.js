function loginButton() {
    let userName = $("#userName");
    let password = $("#password");
    if (userName.val() && password.val()) {
        $(".btn.btn-primary.my-4.ms-5").removeAttr("disabled");
    }
}

function onsubmitHandler() {
    console.log("submitted");

    let userName = $("#userName");
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