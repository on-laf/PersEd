import cable from 'actioncable';

let consumer;

function createChannel(...args) {
  if (!consumer) {
    consumer = cable.createConsumer();
  }

  console.log('creating channel!');
  console.log(consumer);

  return consumer.subscriptions.create(...args);
}

export default createChannel;
