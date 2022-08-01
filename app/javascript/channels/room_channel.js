import consumer from "./consumer";

document.addEventListener("turbolinks:load", () => {
    const room_element = document.getElementById("currentRoomId");
    const room_id = room_element.getAttribute("data-room-id");

    consumer.subscriptions.subscriptions.forEach((subscription) => {
        consumer.subscriptions.remove(subscription);
    });

    consumer.subscriptions.create({ channel: "RoomChannel", id: room_id }, {
        connected() {},
        disconnected() {},

        received(data) {
            const container = document.getElementsByClassName(
                "details-of-chatting"
            )[0];
            const current_user_id = document
                .getElementById("currentUserId")
                .getAttribute("data-user-id");
            let html =
                current_user_id == data.message.sender_id ?
                data.request :
                data.response;
            container.innerHTML += html;
            document.getElementById("inputsm").value = "";
            container.scrollTop = container.scrollHeight + 100;
        },
    });
});