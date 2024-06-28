const navbar = document.querySelector('.navbar');

window.addEventListener('scroll', () => {
  if (window.scrollY > 0) {
    navbar.classList.add('scrolled');
  } else {
    navbar.classList.remove('scrolled');
  }
});


class Post {
  static names = {
    1: 'Athota Srilatha',
    2: 'Bandaru Sampath Kumar',
    3: 'Gollakaram Ganga Bhavani',
    4: 'Gowtham Meka',
    5: 'Mayuraj Ranawat',
    6: 'Narendiran K',
    7: 'Pratham Madhunapanthula',
    8: 'Riya Reddy',
    9: 'Shaik Sameer',
    10: 'Suriyan K',
    11: 'Vaishnavi Panta',
    12: 'Yateesh Tangudu'
  };

  constructor(userId, title, body) {
    this.name = Post.names[userId] ;
    this.title = title;
    this.body = body;
  }
}

document.addEventListener('DOMContentLoaded', () => {
  const dataBody = document.getElementById('dataBody');
  const updateDataButton = document.getElementById('updateData');

  const fetchData = async () => {
    try {
      const response = await fetch('https://jsonplaceholder.typicode.com/posts');
      const data = await response.json();
      console.log(data); 
      // dataBody.innerHTML = '';
      data.forEach((post, index) => {
        const postObject = new Post(post.userId, post.title, post.body);
        const row = `<tr>
          <td>${postObject.name}</td>
          <td>${postObject.title}</td>
          <td>${postObject.body}</td>
        </tr>`;
        dataBody.insertAdjacentHTML('beforeend', row);
      });
    } catch (error) {
      console.error('Error fetching data:', error);
    }
  };

  updateDataButton.addEventListener('click', fetchData);


  fetchData();
});


document.addEventListener('DOMContentLoaded', function() {
  const form = document.querySelector('form');
  const nameInput = document.getElementById('name');
  const emailInput = document.getElementById('email');
  const phoneInput = document.getElementById('phone');
  const teamSelect = document.getElementById('team');
  const notificationsDiv = document.querySelector('.notifications');
  const errorMessage = document.createElement('div');
  const resetButton = document.createElement('button');
  
  errorMessage.classList.add('alert', 'alert-danger', 'hidden');
  errorMessage.innerText = 'Please check your data';
  form.prepend(errorMessage);
  
  resetButton.type = 'button';
  resetButton.classList.add('btn', 'btn-secondary', 'w-100', 'mt-3');
  resetButton.innerText = 'Reset';
  form.appendChild(resetButton);

  teamSelect.addEventListener('change', function() {
      if (teamSelect.value) {
          notificationsDiv.classList.remove('hidden');
      } else {
          notificationsDiv.classList.add('hidden');
      }
  });

  form.addEventListener('submit', function(event) {
      event.preventDefault();
      let valid = true;
      
      if (!/^[a-zA-Z\s]+$/.test(nameInput.value)) {
          valid = false;
      }
      
      if (!/^\S+@\S+\.\S+$/.test(emailInput.value)) {
          valid = false;
      }
      
      if (!/^\d+$/.test(phoneInput.value)) {
          valid = false;
      }
      
      if (!teamSelect.value) {
          valid = false;
      }

      if (!valid) {
          errorMessage.classList.remove('hidden');
      } else {
          errorMessage.classList.add('hidden');
          alert('Form submitted successfully!');
          form.reset();
          notificationsDiv.classList.add('hidden');
      }
  });

  resetButton.addEventListener('click', function() {
      form.reset();
      notificationsDiv.classList.add('hidden');
      errorMessage.classList.add('hidden');
  });
});