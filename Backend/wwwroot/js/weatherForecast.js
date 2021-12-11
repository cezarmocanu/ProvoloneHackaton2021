$(document).ready(function () {
    // see https://api.jquery.com/click/
    $.ajax({
        url: `/WeatherForecast`,
        success: function (data) {
            let tommorow = data[0];
            console.log(tommorow);
            $('#date').replaceWith(tommorow);
            $('#temperature').replaceWith(tommorow.temperature, ' C');
            $('#summary').replaceWith(tommorow.summary);

        },
        error: function () {
            alert(`Failed to load data`);
        }
    })
}});