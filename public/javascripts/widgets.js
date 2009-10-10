function updateWeather(zipcode) {
    $.ajax({
        type: "GET",
        url: "/main/get_weather?zipcode="+zipcode,
        dataType: "text",
        success: function(data) {
              $("#weather_info").html(data);
        }
    });
}

function twitterWidget(){
      new TWTR.Widget({
search: '#powertrends',
id: 'twtr-search-widget',
loop: true,
title: 'Power Trends',
subject: 'Cape Cod, MA',
width: 250,
height: 300,
theme: {
shell: {
background: '#ad3030',
color: '#ffffff'
},
tweets: {
background: '#ffffff',
color: '#444444',
links: '#1985b5'
}
}
}).render().start();
}