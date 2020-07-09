const markAsRead = () => {
  console.log("hello from mark as read")
  fetch('/notifications/mark_as_read', {
          method: 'post',
          headers: {
            'Content-Type': 'application/json',
            'X-CSRF-Token': Rails.csrfToken()
          },
          credentials: 'same-origin'
  })
};

const clearButton = document.getElementById('clear');

const clearAll = () => {
  clearButton.addEventListener('click', markAsRead);
};

export { clearAll }
