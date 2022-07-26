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
        console.log(data.response);
        const container = document.getElementsByClassName(
            "details-of-chatting"
        )[0];
        const current_user_id = document
            .getElementById("currentUserId")
            .getAttribute("data-user-id");
        console.log(current_user_id);
        let html;
        html =
            data.message.receiver_id == current_user_id ?
            data.response :
            data.request;
        container.innerHTML += html;
        document.getElementById("inputsm").value = "";
        container.scrollTop = container.scrollHeight + 100;
    },
});