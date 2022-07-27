import consumer from "./consumer";

$(document).ready(() => {
    const room_id = Number(
        document.getElementById("currentRoomId").getAttribute("data-room-id")
    );
    consumer.subscriptions.create({ channel: "RoomChannel", id: room_id }, {
        connected() {
            console.log("connected to " + room_id);
            // Called when the subscription is ready for use on the server
        },

        disconnected() {
            // Called when the subscription has been terminated by the server
        },

        received(data) {
            console.log(data);
            const container = document.getElementsByClassName(
                "details-of-chatting"
            )[0];
            const current_user_id = Number(
                document.getElementById("currentUserId").getAttribute("data-user-id")
            );
            let html;

            html =
                data.message.sender_id == current_user_id ?
                data.request :
                data.response;
            container.innerHTML += html;
            document.getElementById("inputsm").value = "";
            container.scrollTop = container.scrollHeight + 100;
        },
    });
});