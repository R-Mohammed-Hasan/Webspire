setTimeout(() => {
    document.querySelector(".webspire-video").removeAttribute("loop");
}, 11000);

$(".multiple-items").slick({
    infinite: false,
    arrows: true,
    speed: 400,
    slidesToShow: 6,
    slidesToScroll: 2,
    touchMove: true,
    edge: true,
    responsive: [{
            breakpoint: 1024,
            settings: {
                slidesToShow: 5,
                slidesToScroll: 2,
                dots: true,
            },
        },
        {
            breakpoint: 600,
            settings: {
                slidesToShow: 3,
                slidesToScroll: 2,
            },
        },
        {
            breakpoint: 480,
            settings: {
                slidesToShow: 3,
                slidesToScroll: 1,
            },
        },
    ],
});
$(".post-content").slick({
    infinite: false,
    arrows: true,
    speed: 400,
    slidesToShow: 1,
    slidesToScroll: 1,
    swipeToSlide: true,
    touchMove: true,
    edge: true,
    dots: true,
});

function showMoreOption() {
    $(".more-option-box").css({
        transform: "scale(1)",
        transition: "all 0.3s",
    });
    $(".more-option-box-container").css({
        backdropFilter: "brightness(50%)",
        zIndex: "2",
        transition: "all 0.3s",
    });
}

function hideMoreOption() {
    $(".more-option-box").css({
        transform: "scale(0.001)",
        backdropFilter: "blur(0)",
    });
    $(".more-option-box-container").css({
        backdropFilter: "brightness(100%)",
        zIndex: "-1",
    });
}

function openFileDialog() {
    $("#forFileDialogBox").trigger("click");
}