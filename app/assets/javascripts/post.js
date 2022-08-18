function copiedText(event) {
    event.target.innerHTML = "Copied..";
    setTimeout(function() {
        event.target.innerHTML = "Copy Link";
    }, 5000);
}

$(".postsContainer").infiniteScroll({
    // options
    path: () => {
        url = $(".pagination .next_page").attr("href");
        console.log(url);
    },
    append: ".post-container",
    history: false,
});