/* justGage charts */

$(function() {
    "use strict";
    var g5;

    window.onload = function() {

        var g5 = new JustGage({
            id: "g5",
            value: getRandomInt(0, 200),
            min: 0,
            max: 200,
            title: "1일 커피찌꺼기 발생량",
            label: "TON"
        });

        setInterval(function() {
            g5.refresh(getRandomInt(0, 50));

        }, 2500);
    };
});
