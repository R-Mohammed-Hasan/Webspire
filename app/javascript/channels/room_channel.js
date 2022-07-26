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
<<<<<<< HEAD
        console.log(data);
=======
>>>>>>> e0a99ba40d251078f423fd6659047527658462ec
        // Called when there's incoming data on the websocket for this channel
    },
});