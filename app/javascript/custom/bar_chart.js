document.addEventListener("turbo:load", function() {
  
  const ctx = document.getElementById('myChart');
  var months = JSON.parse(document.getElementById('months').dataset.json);

  var back_chart = JSON.parse(document.getElementById('back_chart').dataset.json);
  var front_chart = JSON.parse(document.getElementById('front_chart').dataset.json);
  var infra_chart = JSON.parse(document.getElementById('infra_chart').dataset.json);

  new Chart(ctx, {
    type: 'bar',
    data: {
      labels: months,
      datasets: [{
        label: 'バックエンド',
        data: back_chart,
        borderWidth: 1,
        borderColor: 'rgba(255, 177, 194)',
        backgroundColor: 'rgba(255, 177, 194, 0.8)'
      },{
        label: 'フロントエンド',
        data: front_chart,
        borderWidth: 1,
        borderColor: 'rgba(255, 208, 161)',
        backgroundColor: 'rgba(255, 208, 161, 0.8)'
      },{
        label: 'インフラ',
        data: infra_chart,
        borderWidth: 1,
        borderColor: 'rgba(255, 230, 172)',
        backgroundColor: 'rgba(255, 230, 172, 0.8)'
      }]
    },
    options: {
      plugins: {
        title: {
          display: true,
          text: 'Chart.js Bar Chart'
        }
      }
    }
  });
});