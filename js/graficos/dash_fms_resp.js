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
var recebidos = document.getElementById("recebidos").value.split(",");
var processados = document.getElementById("processados").value.split(",");
var arquivados = document.getElementById("arquivados").value.split(",");
var labelspag = document.getElementById("labelschart").value.split(",");
var limites = document.getElementById("limiteschart").value.split(",");

    



var myLineChart = new Chart(ctx, {
  type: 'line',
  data: {
    labels: labelspag,
    datasets: [{
      label: "Recebidos: ",
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
      data: recebidos,
    },
    {
      label: "Processados: ",
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
     
      data: processados,
    },
    {
      label: "Arquivados: ",
      lineTension: 0.5,
      backgroundColor: "rgba(255, 255, 240, 0.01)",
      borderColor: "rgba(28, 200, 138, 1)",
      pointRadius: 1,
      pointBackgroundColor: "rgba(28, 200, 138, 1)",
      pointBorderColor: "rgba(28, 200, 138, 1)",
      pointHoverRadius: 3,
      pointHoverBackgroundColor: "rgba(28, 200, 138, 1)",
      pointHoverBorderColor: "rgba(28, 200, 138, 1)",
      pointHitRadius: 12,
      pointBorderWidth: 2,
     
      data: arquivados,
    },
    {
      label: "Limite: ",
      lineTension: 0.3,
      backgroundColor: "rgba(255, 255, 255, 0.1)",
      borderColor: "rgba(255, 255, 0, 1)",
      borderDash: [5, 5],
      pointHitRadius: 0,
      pointRadius: 0,
     
      data: limites,
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

// Area Chart Example
var fila = document.getElementById("fila").value.split(",");
var filaeba = document.getElementById("filaeba").value.split(",");
var labelspag5 = document.getElementById("labelschart5").value.split(",");

// Area Chart Example
var ctxDig = document.getElementById("myAreaChart2");
var valueschart2 = document.getElementById("valueschart2").value;
var values2 = valueschart2.split(",");
var labelschart2 = document.getElementById("labelschart2").value;
var labelspag2 = labelschart2.split(",");
var limites2 = document.getElementById("limiteschart2").value.split(",");

var myLineChart2 = new Chart(ctxDig, {
  type: 'line',
  data: {
    labels: labelspag2,
    datasets: [{
      label: "Valor: ",
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
    },
    {
      label: "Limite: ",
      lineTension: 0.3,
      backgroundColor: "rgba(255, 255, 255, 0.1)",
      borderColor: "rgba(255, 255, 0, 1)",
      borderDash: [5, 5],
      pointHitRadius: 0,
      pointRadius: 0,
     
      data: limites2,
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
          return datasetLabel + '' + number_format(tooltipItem.yLabel) + '';
        }
      }
    }
  }
})


// Area Chart Example
var ctxDig3 = document.getElementById("myAreaChart3");
var valueschart3 = document.getElementById("valueschart3").value;
var values3 = valueschart3.split(",");
var labelschart3 = document.getElementById("labelschart3").value;
var labelspag3 = labelschart3.split(",");
var limites3 = document.getElementById("limiteschart3").value.split(",");

var myLineChart3 = new Chart(ctxDig3, {
  type: 'line',
  data: {
    labels: labelspag3,
    datasets: [{
      label: "Valor: ",
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
      data: values3,
    },
    {
      label: "Limite: ",
      lineTension: 0.3,
      backgroundColor: "rgba(255, 255, 0, 0.1)",
      borderColor: "rgba(255, 255, 0, 1)",
      borderDash: [5, 5],
      pointHitRadius: 0,
      pointRadius: 0,
     
      data: limites3,
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
          return datasetLabel + '' + number_format(tooltipItem.yLabel) + '';
        }
      }
    }
  }
})

// Area Chart Example
var ctxDig4 = document.getElementById("myAreaChart4");
var valueschart4 = document.getElementById("valueschart4").value;
var values4 = valueschart4.split(",");
var labelschart4 = document.getElementById("labelschart4").value;
var labelspag4 = labelschart4.split(",");
var limites4 = document.getElementById("limiteschart4").value.split(",");

var myLineChart4 = new Chart(ctxDig4, {
  type: 'line',
  data: {
    labels: labelspag4,
    datasets: [{
      label: "Valor: ",
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
      data: values4,
    },
    {
      label: "Limite: ",
      lineTension: 0.3,
      backgroundColor: "rgba(255, 255, 0, 0.1)",
      borderColor: "rgba(255, 255, 0, 1)",
      borderDash: [5, 5],
      pointHitRadius: 0,
      pointRadius: 0,
     
      data: limites4,
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
          return datasetLabel + '' + number_format(tooltipItem.yLabel) + '';
        }
      }
    }
  }
})

;