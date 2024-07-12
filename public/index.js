const navbar = document.querySelector('.navbar');

window.addEventListener('scroll', () => {
  if (window.scrollY > 0) {
    navbar.classList.add('scrolled');
  } else {
    navbar.classList.remove('scrolled');
  }
});

// this code is   for postt



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
  const searchInput = document.getElementById('searchInput');

  let postsData = []; 

  const fetchData = async () => {
    try {
      const response = await fetch('https://jsonplaceholder.typicode.com/posts');
      const data = await response.json();
      console.log(data); 
      postsData = data.map(post => new Post(post.userId, post.title, post.body));
      renderPosts(postsData);
      // let ans =new XMLHttpRequest()
      // ans.open("GET","https://jsonplaceholder.typicode.com/posts",true)
      // ans.getResponseHeader("content-type","applcation/json")
      // ans.onload=
      function()
      {
         const obj =JSON.parse(this.responseText) 
         console.log(obj)
      }
    } catch (error) {
      console.error('Error fetching data:', error);
    }
  };

  const renderPosts = (posts) => {
    dataBody.innerHTML = '';
    posts.forEach(post => {
      const row = `<tr>
        <td>${post.name}</td>
        <td>${post.title}</td>
        <td>${post.body}</td>
      </tr>`;
      dataBody.insertAdjacentHTML('beforeend', row);
    });
  };

  const handleSearch = () => {
    const searchTerm = searchInput.value.trim().toLowerCase();
    const filteredPosts = postsData.filter(post => post.title.toLowerCase().includes(searchTerm));
    renderPosts(filteredPosts);
  };

  updateDataButton.addEventListener('click', fetchData);
  searchInput.addEventListener('input', handleSearch);

 
  fetchData();
});



  // this codde is  form 

document.addEventListener('DOMContentLoaded', function() {
  const teamSelect = document.getElementById('team');
  const notificationsDiv = document.querySelector('.notifications');
  const whatsappCheckbox = document.getElementById('whatsapp');
  const t20YesRadio = document.getElementById('t20yes');
  const t20NoRadio = document.getElementById('t20no');

  teamSelect.addEventListener('change', function() {
      if (teamSelect.value) {
          notificationsDiv.classList.remove('hidden');
      } else {
          notificationsDiv.classList.add('hidden');
      }
  });

  const form = document.querySelector('form');
  const nameInput = document.getElementById('name');
  const emailInput = document.getElementById('email');
  const phoneInput = document.getElementById('phone');
  const errorMessage = document.createElement('div');
  const resetButton = document.createElement('button');
  const submitButton = form.querySelector('button');
  const thankYouMessage = document.createElement('div');
  const deleteButton = document.createElement('button');

  errorMessage.classList.add('alert', 'alert-danger', 'hidden') ;
  errorMessage.innerText = 'Please check your data';
  form.prepend(errorMessage);

  resetButton.type = 'button';
  resetButton.classList.add('btn', 'btn-secondary', 'w-100', 'mt-3');
  resetButton.innerText = 'Reset';
  form.appendChild(resetButton);

  thankYouMessage.classList.add('alert', 'alert-success', 'mt-3', 'hidden');
  thankYouMessage.innerText = 'Thank you for your submission';
  form.parentNode.insertBefore(thankYouMessage, form.nextSibling);

  deleteButton.type = 'button';
  deleteButton.classList.add('btn', 'btn-danger', 'w-100', 'mt-3', 'hidden');
  deleteButton.innerText = 'Delete Data';
  form.parentNode.insertBefore(deleteButton, thankYouMessage.nextSibling);

  function saveFormData() {
      const formData = {
          name: nameInput.value,
          email: emailInput.value,
          phone: phoneInput.value,
          team: teamSelect.value,
          notifications: whatsappCheckbox.checked,
          t20like: t20YesRadio.checked ? 'yes' : (t20NoRadio.checked ? 'no' : '')
      };
      localStorage.setItem('formData', JSON.stringify(formData));
  }

  function displayThankYouMessage() {
      thankYouMessage.classList.remove('hidden');
      thankYouMessage.innerHTML = '<strong>Thank you for your submission!</strong><br><br>' +
          '<strong>Name:</strong> ' + nameInput.value + '<br>' +
          '<strong>Email:</strong> ' + emailInput.value + '<br>' +
          '<strong>Phone:</strong> ' + phoneInput.value + '<br>' +
          '<strong>Team:</strong> ' + teamSelect.value + '<br>' +
          '<strong>Receive Notifications:</strong> ' + (whatsappCheckbox.checked ? 'Yes' : 'No') + '<br>' +
          '<strong>Like T20:</strong> ' + (t20YesRadio.checked ? 'Yes' : (t20NoRadio.checked ? 'No' : '')) + '<br>';
      deleteButton.classList.remove('hidden');
  }

  function clearFormData() {
      localStorage.removeItem('formData');
  }

  function loadStoredData() {
      const storedData = JSON.parse(localStorage.getItem('formData'));
      if (storedData) {
          nameInput.value = storedData.name;
          emailInput.value = storedData.email;
          phoneInput.value = storedData.phone;
          teamSelect.value = storedData.team;
          if (storedData.notifications) {
              whatsappCheckbox.checked = true;
          } else {
              whatsappCheckbox.checked = false;
          }
          if (storedData.t20like === 'yes') {
              t20YesRadio.checked = true;
          } else if (storedData.t20like === 'no') {
              t20NoRadio.checked = true;
          }
          displayThankYouMessage();
      }
  }

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
          saveFormData();
          form.classList.add('hidden');
          displayThankYouMessage();
      }
  });

  resetButton.addEventListener('click', function() {
      form.reset();
      notificationsDiv.classList.add('hidden');
      errorMessage.classList.add('hidden');
  });

  deleteButton.addEventListener('click', function() {
      clearFormData();
      thankYouMessage.classList.add('hidden');
      deleteButton.classList.add('hidden');
      form.classList.remove('hidden');
  });

  loadStoredData();
});
