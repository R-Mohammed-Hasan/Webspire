import consumer from "./consumer";

document.addEventListener("turbolinks:load", () => {
    const room_element = document.getElementById("currentRoomId");
    const room_id = room_element.getAttribute("data-room-id");

    console.log(consumer.subscriptions);

    consumer.subscriptions.subscriptions.forEach((subscription) => {
        consumer.subscriptions.remove(subscription);
    });

    consumer.subscriptions.create({ channel: "RoomChannel", id: room_id }, {
        connected() {
            console.log("connected to " + room_id);
        },
        disconnected() {
            console.log("disconnected from " + room_id);
        },
        received(data) {
            console.log("Entering received method");
            console.log(data);

            const container = document.getElementsByClassName(
                "details-of-chatting"
            )[0];
            const current_user_id = document
                .getElementById("currentUserId")
                .getAttribute("data-user-id");

            console.log(current_user_id);

            let html;
            html =
                parseInt(current_user_id) == data.message.receiver_id ?
                data.response :
                data.request;
            container.innerHTML += html;
            document.getElementById("inputsm").value = "";
            container.scrollTop = container.scrollHeight + 100;
        },
    });
});

const sender = () => {};

const receiver = () => {};