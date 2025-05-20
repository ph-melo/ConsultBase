// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

// Pie Chart Example
var ctx = document.getElementById("myPieChart");
var grafDiv = document.getElementById("grafDiv").value;
var grafDivpag = grafDiv.split(",");
var myPieChart = new Chart(ctx, {
  type: 'pie',
  data: {
    labels: ["SOCIETÁRIO", "CONSUMIDOR NACIONAL", "DIVISÃO DE CONSULTORIA JURÍDICA EMPRESARIAL", "NACIONAL TRABALHISTA", "NACIONAL CONTENCIOSO ESPECIAL", "SERVIÇOS ESPECIAIS"],
    datasets: [{
      data: grafDivpag,
      backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc','#b08dd1', '#ffa700', '#d9534f'],
      hoverBorderColor: "rgba(234, 236, 244, 1)",
    }],
  },
  options: {
    maintainAspectRatio: false,
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      borderColor: '#dddfeb',
     
      displayColors: false,
      caretPadding: 10,
    },
    legend: {
      display: false
    },
     plugins: {
      	labels: [{
		    render: 'value',
		    fontSize: 14,
		   arc: true,
		    fontColor: 'white',
		    fontStyle: 'bold'
		   
		 },
		 {
		    render: function (args) {
      return  args.label.substring(0, 20);
    },
		    fontSize: 11,
		  
		    fontColor: '#000',
		    position: 'outside'
		   
		 },
		 ]
	}
  },
  
  
});

var ctx2 = document.getElementById("graficoBarra");

var valueschart = document.getElementById("valueschart").value;
var values = valueschart.split(",");
var labelschart = document.getElementById("labelschart").value;
var labelspag = labelschart.split(",");

var chartColors = {
  color1: "#1cc88a",
  color2: "#ffa700"
};

var graficoBarra = new Chart(ctx2, {
  type: 'bar',
  data: {
    labels: labelspag,
    datasets: [{
      label: "",
      backgroundColor: [
        chartColors.color2,
        chartColors.color2,
        chartColors.color2,
        chartColors.color2
      ],
      borderColor: "#4e73df",
      data: values,
    }],
  },
  options: {
    maintainAspectRatio: false,
    layout: {
      padding: {
        left: 10,
        right: 25,
        top: 25,
        bottom: 0
      }
    },
    scales: {
      xAxes: [{
             
        time: {
          unit: 'date'
        },
        gridLines: {
          display: false,
          drawBorder: false
        },
        ticks: {
          maxTicksLimit: 26
        },
        maxBarThickness: 26,
      }],
      yAxes: [{
        ticks: {
          
          maxTicksLimit: 7,
          padding: 10,
           beginAtZero: true, 
          min: 0 
        },
        gridLines: {
          color: "rgb(234, 236, 244)",
          zeroLineColor: "rgb(234, 236, 244)",
          drawBorder: false,
          borderDash: [2],
          zeroLineBorderDash: [2]
        }
      }],
    },
    legend: {
      display: false
    },
    tooltips: {
      titleMarginBottom: 10,
      titleFontColor: '#6e707e',
      titleFontSize: 13,
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      caretPadding: 10,
      callbacks: {
        label: function(tooltipItem, chart) {
          var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
          return datasetLabel + '' + number_format(tooltipItem.yLabel) ;
        }
      }
    },
   plugins: {
      	labels: {
		    render: 'value',
		    fontSize: 14,
		   
		    fontColor: '#000'
		   
		 }
	},
  }
});

let data = labelspag
var dataset = graficoBarra.data.datasets[0];
for (var i = 0; i < dataset.data.length; i++) {
  if (data[i] !== "Pendente") {
   	dataset.backgroundColor[i] = chartColors.color1;
  }
}
graficoBarra.update();