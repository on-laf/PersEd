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

console.log('Creating subscription');

let wrapperDiv = document.querySelector('.wrapper');
let page = wrapperDiv.dataset.pageAction;
let current_user_id = wrapperDiv.dataset.userId;

console.log(current_user_id);

consumer.subscriptions.create(
  { channel: "NotificationsChannel", user_id: current_user_id },
    {
      connected: function () {
        console.log('Connected!');
      },
      received: function(data) {
        console.log('Receiving Data!')
        console.log(data);
        console.log(data.notification);
        if (page == 'students-show' || page == 'teachers-show') {
          const notificationsDiv = document.querySelector('#notifications');
          notificationsDiv.insertAdjacentHTML("afterbegin", data.notification);
        }
      }
     }
  )
