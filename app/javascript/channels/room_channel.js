import consumer from "./consumer";

document.addEventListener("turbolinks:load", () => {
    const room_id = Number(
        document.getElementById("currentRoomId").getAttribute("data-room-id")
    );

    consumer.subscriptions.create({ channel: "RoomChannel", id: room_id }, {
        connected() {
            console.log("connected to " + room_id);
        },
        disconnected() {
            console.log("disconnected from " + room_id);
        },
        received(data) {
            console.log(data);
            const container = document.getElementsByClassName(
                "details-of-chatting"
            )[0];
            const current_user_id = document
                .getElementById("currentUserId")
                .getAttribute("data-user-id");
            let html;
            html =
                current_user_id == data.message.receiver_id ?
                data.response :
                data.request;
            container.innerHTML += html;
            document.getElementById("inputsm").value = "";
            container.scrollTop = container.scrollHeight + 100;
        },
    });
});