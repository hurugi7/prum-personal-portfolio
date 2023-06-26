import { Chart, registerables } from "chart.js";
Chart.register(...registerables);


const ctx = document.getElementById('myChart');

const chart = new Chart(ctx, {
  type: 'bar',
  data: {
    labels: ['January', 'February', 'March'],
    datasets: [{
      label: 'Dataset 1',
      data: [-17, -10, -60],
      borderWidth: 1.5,
      backgroundColor: 'rgba(247, 141, 184, 0.7)',
      borderColor: 'rgba(247, 141, 184)'
    },{
      label: 'Dataset 2',
      data: [5, 10, -9],
      borderWidth: 1.5,
      backgroundColor: 'rgba(255, 180, 110, 0.7)',
      borderColor: 'rgba(255, 180, 110)'
    },{
      label: 'Dataset 3',
      data: [90, -18, 18],
      borderWidth: 1.5,
      backgroundColor: 'rgba(250, 212, 125, 0.7)',
      borderColor: 'rgba(250, 212, 125)'
    }
  ]
  }
});