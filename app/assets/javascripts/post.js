function copiedText(event) {
    event.target.innerHTML = "Copied..";
    setTimeout(function() {
        event.target.innerHTML = "Copy Link";
    }, 5000);
}

console.log("running");
$(".postsContainer").infiniteScroll({
    // options

    path: () => {
        url = $(".pagination .next_page").attr("href");
        return url;
    },
    append: ".post-container",
    history: false,
});