function copiedText(event) {
    event.target.innerHTML = "Copied..";
    setTimeout(function() {
        event.target.innerHTML = "Copy Link";
    }, 5000);
}