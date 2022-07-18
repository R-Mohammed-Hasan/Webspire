// Rails.ajax({
//     url: "/post/like/:id",
//     type: "put",
//     data: data.serialize(),
//     success: (data) => {
//         console.log("success");
//         console.log(data);
//     },
//     error: (data) => {
//         console.log(data);
//     },
// });

function getLikes() {
    axios.get("http://localhost:3000/api/v1/posts").then((response) => {
        console.log(response.data);
    });
}

function getLikes() {
    axios
        .post("http://localhost:3000/api/v1/posts", { post_id: 1 })
        .then((response) => {
            console.log(response.data);
        });
}

function getMessages() {
    axios
        .get("http://localhost:3000/api/v1/messages/conversation_id")
        .then((response) => {
            console.log(response.data);
        });
}