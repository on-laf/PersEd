// import createChannel from './cable';

// let callback; // declaring a variable that will hold a function later

// const notifications = createChannel('NotificationsChannel', {
//   received({data}) {
//     if (callback) callback.call(null, data);
//   }
// });

// function setCallback(fn) {
//   callback = fn;
// }

// export { setCallback };


import consumer from "../channels/consumer"

consumer.subscriptions.create({ channel: "NotificationsChannel"})
