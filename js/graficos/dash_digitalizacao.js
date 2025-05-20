// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

function number_format(number, decimals, dec_point, thousands_sep) {
  // *     example: number_format(1234.56, 2, ',', ' ');
  // *     return: '1 234,56'
  number = (number + '').replace(',', '').replace(' ', '');
  var n = !isFinite(+number) ? 0 : +number,
    prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
    sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
    dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
    s = '',
    toFixedFix = function(n, prec) {
      var k = Math.pow(10, prec);
      return '' + Math.round(n * k) / k;
    };
  // Fix for IE parseFloat(0.55).toFixed(0) = 0;
  s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
  if (s[0].length > 3) {
    s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
  }
  if ((s[1] || '').length < prec) {
    s[1] = s[1] || '';
    s[1] += new Array(prec - s[1].length + 1).join('0');
  }
  return s.join(dec);
}

// Area Chart Example
var ctx = document.getElementById("myAreaChart");
var valueschart = document.getElementById("valueschart").value;
var values = valueschart.split(",");
var valueshist = document.getElementById("valueshistchart").value.split(",");
var labelschart = document.getElementById("labelschart").value;
var labelspag = labelschart.split(",");

var myLineChart = new Chart(ctx, {
  type: 'line',
  data: {
    labels: labelspag,
    datasets: [{
      label: "Digitalizações: ",
      lineTension: 0.3,
      backgroundColor: "rgba(78, 115, 223, 0.05)",
      borderColor: "rgba(78, 115, 223, 1)",
      pointRadius: 1,
      pointBackgroundColor: "rgba(78, 115, 223, 1)",
      pointBorderColor: "rgba(78, 115, 223, 1)",
      pointHoverRadius: 3,
      pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
      pointHoverBorderColor: "rgba(78, 115, 223, 1)",
      pointHitRadius: 12,
      pointBorderWidth: 2,
      data: values,
    },
    {
      label: "Histórico: ",
      lineTension: 0.3,
      backgroundColor: "rgba(255, 255, 255, 0.01)",
      borderColor: "rgba(28, 200, 138, 1)",
     borderDash: [5, 5],
      pointHitRadius: 0,
      pointRadius: 0,
      data: valueshist,
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
          maxTicksLimit: 12
        }
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
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      titleMarginBottom: 10,
      titleFontColor: '#6e707e',
      titleFontSize: 14,
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      intersect: false,
      mode: 'index',
      caretPadding: 10,
      callbacks: {
        label: function(tooltipItem, chart) {
          var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
          return datasetLabel +  number_format(tooltipItem.yLabel);
        }
      }
    }
  }
});

// Area Chart Example
var ctxDig = document.getElementById("myAreaChart2");
var valueschart2 = document.getElementById("valueschart2").value;
var values2 = valueschart2.split(",");
var labelschart2 = document.getElementById("labelschart2").value;
var labelspag2 = labelschart2.split(",");

var myLineChart2 = new Chart(ctxDig, {
  type: 'line',
  data: {
    labels: labelspag2,
    datasets: [{
      label: "",
      lineTension: 0.3,
      backgroundColor: "rgba(78, 115, 223, 0.05)",
      borderColor: "rgba(78, 115, 223, 1)",
      pointRadius: 1,
      pointBackgroundColor: "rgba(78, 115, 223, 1)",
      pointBorderColor: "rgba(78, 115, 223, 1)",
      pointHoverRadius: 3,
      pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
      pointHoverBorderColor: "rgba(78, 115, 223, 1)",
      pointHitRadius: 12,
      pointBorderWidth: 2,
      data: values2,
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
          maxTicksLimit: 12
        }
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
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      titleMarginBottom: 10,
      titleFontColor: '#6e707e',
      titleFontSize: 14,
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      intersect: false,
      mode: 'index',
      caretPadding: 10,
      callbacks: {
        label: function(tooltipItem, chart) {
          var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
          return datasetLabel + 'Digitaliza\u00e7\u00f5es: ' + number_format(tooltipItem.yLabel);
        }
      }
    }
  }
});

// Area Chart Example
var ctxRegional = document.getElementById("myAreaChart3");
var norte = document.getElementById("norte").value.split(",");
var nordeste = document.getElementById("nordeste").value.split(",");
var leste = document.getElementById("leste").value.split(",");
var centroEste = document.getElementById("centroEste").value.split(",");
var minasGerais = document.getElementById("minasGerais").value.split(",");
var saoPaulo = document.getElementById("saoPaulo").value.split(",");
var sul = document.getElementById("sul").value.split(",");
var labelspag = document.getElementById("dataHora").value.split(",");

var myLineChart3 = new Chart(ctxRegional, {
  type: 'line',
  data: {
    labels: labelspag,
    datasets: [{
     label: "Norte: ",
      lineTension: 0.5,
      backgroundColor: "rgba(255, 255, 240, 0.01)",
      borderColor: "rgba(255, 144, 51, 1)",
      pointRadius: 1,
      pointBackgroundColor: "rgba(255, 144, 51, 1)",
      pointBorderColor: "rgba(255, 144, 51, 1)",
      pointHoverRadius: 3,
      pointHoverBackgroundColor: "rgba(255, 144, 51, 1)",
      pointHoverBorderColor: "rgba(255, 144, 51, 1)",
      pointHitRadius: 12,
      pointBorderWidth: 2,
      data: norte,
    },
    {
      label: "Nordeste: ",
      lineTension: 0.5,
      backgroundColor: "rgba(255, 255, 240, 0.01)",
      borderColor: "rgba(78, 115, 223, 1)",
      pointRadius: 1,
      pointBackgroundColor: "rgba(78, 115, 223, 1)",
      pointBorderColor: "rgba(78, 115, 223, 1)",
      pointHoverRadius: 3,
      pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
      pointHoverBorderColor: "rgba(78, 115, 223, 1)",
      pointHitRadius: 12,
      pointBorderWidth: 2,
      data: nordeste,
    },
    {
      label: "Leste: ",
      lineTension: 0.5,
      backgroundColor: "rgba(255, 255, 240, 0.01)",
      borderColor: "rgba(28, 200, 138, 1)",
      pointRadius: 1,
      pointBackgroundColor: "rgba(78, 115, 223, 1)",
      pointBorderColor: "rgba(28, 200, 138, 1)",
      pointHoverRadius: 3,
      pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
      pointHoverBorderColor: "rgba(28, 200, 138, 1)",
      pointHitRadius: 12,
      pointBorderWidth: 2,
      data: leste,
    }, 
    {
      label: "Centro-Oeste: ",
      lineTension: 0.5,
      backgroundColor: "rgba(255, 255, 240, 0.01)",
      borderColor: "rgba(28, 200, 194, 1)",
      pointRadius: 1,
      pointBackgroundColor: "rgba(78, 115, 223, 1)",
      pointBorderColor: "rgba(28, 200, 194, 1)",
      pointHoverRadius: 3,
      pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
      pointHoverBorderColor: "rgba(28, 200, 194, 1)",
      pointHitRadius: 12,
      pointBorderWidth: 2,
      data: centroEste,
    }, 
    {
      label: "Minas Gerais: ",
      lineTension: 0.5,
      backgroundColor: "rgba(255, 255, 240, 0.01)",
      borderColor: "rgba(168, 28, 200, 1)",
      pointRadius: 1,
      pointBackgroundColor: "rgba(78, 115, 223, 1)",
      pointBorderColor: "rgba(168, 28, 200, 1)",
      pointHoverRadius: 3,
      pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
      pointHoverBorderColor: "rgba(168, 28, 200, 1)",
      pointHitRadius: 12,
      pointBorderWidth: 2,
      data: minasGerais,
    },
    {
      label: "Sao Paulo: ",
      lineTension: 0.5,
      backgroundColor: "rgba(255, 255, 240, 0.01)",
      borderColor: "rgba(200, 186, 28, 1)",
      pointRadius: 1,
      pointBackgroundColor: "rgba(78, 115, 223, 1)",
      pointBorderColor: "rgba(200, 186, 28, 1)",
      pointHoverRadius: 3,
      pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
      pointHoverBorderColor: "rgba(200, 186, 28, 1)",
      pointHitRadius: 12,
      pointBorderWidth: 2,
      data: saoPaulo,
    },
    {
      label: "Sul: ",
      lineTension: 0.5,
      backgroundColor: "rgba(255, 255, 240, 0.01)",
      borderColor: "rgba(200, 186, 28, 1)",
      pointRadius: 1,
      pointBackgroundColor: "rgb(188, 156, 232)",
      pointBorderColor: "rgba(200, 186, 28, 1)",
      pointHoverRadius: 3,
      pointHoverBackgroundColor: "rgb(188, 156, 232)",
      pointHoverBorderColor: "rgba(200, 186, 28, 1)",
      pointHitRadius: 12,
      pointBorderWidth: 2,
      data: sul,
    }
    ],
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
          maxTicksLimit: 12
        }
      }],
      yAxes: [{
        ticks: {
          maxTicksLimit: 7,
          padding: 10,
          beginAtZero: true,
          min: 0,
          // Include a dollar sign in the ticks
          callback: function(value, index, values) {
            return  number_format(value) ;
          }
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
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      titleMarginBottom: 10,
      titleFontColor: '#6e707e',
      titleFontSize: 14,
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      intersect: false,
      mode: 'index',
      caretPadding: 10,
      callbacks: {
        label: function(tooltipItem, chart) {
          var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '' ;
          return datasetLabel + '' + number_format(tooltipItem.yLabel);
        }
      }
    }
  }
});