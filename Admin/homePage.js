$(document).ready(function () {
    $.ajax({
        type: "POST",
        url: "homePage.aspx/GetUserCounts",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            console.log("Data received:", response);
            const counts = response.d;
            updateBarChart(counts);
        },
        error: function (error) {
            console.error("Error fetching user counts: ", error);
        }
    });
});

function updateBarChart(counts) {
    console.log("Updating chart with counts:", counts);
    const barChartOptions = {
        series: [
            {
                data: counts,
            },
        ],
        chart: {
            type: 'bar',
            height: 350,
            toolbar: {
                show: false,
            },
        },
        colors: ['red', '#cc3c43', '#4f35a1'],
        plotOptions: {
            bar: {
                distributed: true,
                borderRadius: 4,
                horizontal: false,
                columnWidth: '40%',
            },
        },
        dataLabels: {
            enabled: false,
        },
        legend: {
            show: false,
        },
        xaxis: {
            categories: ['Educator', 'Member', 'Admin'],
        },
        yaxis: {
            title: {
                text: 'Count',
            },
        },
    };

    const barChart = new ApexCharts(
        document.querySelector('#bar-chart'),
        barChartOptions
    );
    barChart.render();
}

