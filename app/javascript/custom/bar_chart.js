document.addEventListener('turbo:load', function() {

  const ctx = document.getElementById('myChart');
  
  new Chart(ctx, {
    type: 'bar',
    data: {
      labels: ['January', 'February', 'March'],
      datasets: [{
        label: 'Dataset 1',
        data: [0, 0, 0],
        borderWidth: 1
      },{
        label: 'Dataset 2',
        data: [0, 0, 0],
        borderWidth: 1
      },{
        label: 'Dataset 3',
        data: [0, 0, 0],
        borderWidth: 1
      }]
    }
  });
});