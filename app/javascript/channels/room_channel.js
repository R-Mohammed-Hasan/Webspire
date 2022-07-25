import consumer from "./consumer";

consumer.subscriptions.create({ channel: "RoomChannel", id: 6 }, {
    connected() {
        console.log("connected");
        // Called when the subscription is ready for use on the server
    },
    disconnected() {
        // Called when the subscription has been terminated by the server
    },
    received(data) {
        console.log(data);

        const currentUserId = document
            .getElementById("currentUserId")
            .getAttribute("data-user_id");

        let html;
        if (currentUserId == data.user_id) {}

        const messageContainer = document.getElementsByClassName(
            "details-of-chatting"
        )[0];
        messageContainer.innerHTML = messageContainer.innerHTML + data.html;
    },
});