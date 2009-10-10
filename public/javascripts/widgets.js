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


(function() {
    var Event = YAHOO.util.Event,
        Dom   = YAHOO.util.Dom,
        lang  = YAHOO.lang,
        slider,
        bg="slider-bg", thumb="slider-thumb",
        valuearea="slider-value", hiddenfield="slider-converted-value";

    // The slider can move 0 pixels up
    var topConstraint = 0;

    // The slider can move 200 pixels down
    var bottomConstraint = 200;

    // Custom scale factor for converting the pixel offset into a real value
    var scaleFactor = 0.075;

    // The amount the slider moves when the value is changed with the arrow
    // keys
    var keyIncrement = 6.7;

    var tickSize = 6.7;

    Event.onDOMReady(function() {

        slider = YAHOO.widget.Slider.getHorizSlider(bg,
                         thumb, topConstraint, bottomConstraint, tickSize);

        // Sliders with ticks can be animated without YAHOO.util.Anim
        slider.animate = true;

        slider.getRealValue = function() {
            return Math.round(this.getValue() * scaleFactor);
        }

        slider.subscribe("change", function(offsetFromStart) {

            var valnode = Dom.get(valuearea);
            var fld = Dom.get(hiddenfield);

            actualValue = slider.getRealValue();

            // Display the pixel value of the control
            valnode.innerHTML = actualValue;
            //valnode.html(slider.getRealValue());

            
            fld.value = actualValue;

            
            // Update the title attribute on the background.  This helps assistive
            // technology to communicate the state change
            Dom.get(bg).title = actualValue + "minutes ago" ;

        });

        slider.subscribe("slideStart", function() {
                YAHOO.log("slideStart fired", "warn");
            });

        slider.subscribe("slideEnd", function() {
                YAHOO.log("slideEnd fired", "warn");
				map.clearOverlays();
				doStuff(thexml);
            });

        // Listen for keystrokes on the form field that displays the
        // control's value.  While not provided by default, having a
        // form field with the slider is a good way to help keep your
        // application accessible.
        Event.on(textfield, "keydown", function(e) {

            // set the value when the 'return' key is detected
            if (Event.getCharCode(e) === 13) {
                var v = parseFloat(this.value, 10);
                v = (lang.isNumber(v)) ? v : 0;

                // convert the real value into a pixel offset
                slider.setValue(Math.round(v/scaleFactor));
            }
        });

        // Use setValue to reset the value to white:
        Event.on("putval", "click", function(e) {
            slider.setValue(100, false); //false here means to animate if possible
        });

        // Use the "get" method to get the current offset from the slider's start
        // position in pixels.  By applying the scale factor, we can translate this
        // into a "real value
        Event.on("getval", "click", function(e) {
            YAHOO.log("Current value: "   + slider.getValue() + "\n" +
                      "Converted value: " + slider.getRealValue(), "info", "example");
        });
    });
})();
