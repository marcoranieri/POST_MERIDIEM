'use strict';

function setCookie(name,value,days) {
    var expires = "";
    if (days) {
        var date = new Date();
        date.setTime(date.getTime() + (days*24*60*60*1000));
        expires = "; expires=" + date.toUTCString();
    }
    document.cookie = name + "=" + (value || "")  + expires + "; path=/";
}
function getCookie(name) {
    var nameEQ = name + "=";
    var ca = document.cookie.split(';');
    for(var i=0;i < ca.length;i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') c = c.substring(1,c.length);
        if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
    }
    return null;
}
function eraseCookie(name) {
    document.cookie = name+'=; Max-Age=-99999999;';
}


if (document.location.href.indexOf("intro") !== -1) {
  eraseCookie("intro");
}


var tinderContainer = document.querySelector('.tinder');
var allCards = document.querySelectorAll('.tinder--card');
var nope = document.getElementById('nope');
var love = document.getElementById('love');

$(window).on('load', function(){
  if (!getCookie("intro")) {
    $('.tinder--cards').addClass('arbi');
    $('#Swipe-horizontal_1').show().addClass('marco');
  }

  setCookie("intro", "done");
});

setTimeout(function(){
  $('.tinder--cards').removeClass('arbi');
  $('#Swipe-horizontal_1').remove();
}, 3000);

function initCards(card, index) {
  var newCards = document.querySelectorAll('.tinder--card:not(.removed)');
  newCards.forEach(function (card, index) {
    card.style.zIndex = allCards.length - index;
    card.style.transform = 'scale(' + (20 - index) / 20 + ') translateY(-' + 30 * index + 'px)';
    card.style.opacity = (10 - index) / 10;
  });
  if (tinderContainer) tinderContainer.classList.add('loaded');
}
initCards();
allCards.forEach(function (el) {
  var hammertime = new Hammer(el);
  hammertime.on('pan', function (event) {
    el.classList.add('moving');
  });
  hammertime.on('pan', function (event) {
    if (event.deltaX === 0) return;
    if (event.center.x === 0 && event.center.y === 0) return;
    tinderContainer.classList.toggle('tinder_love', event.deltaX > 0);
    tinderContainer.classList.toggle('tinder_nope', event.deltaX < 0);
    var xMulti = event.deltaX * 0.03;
    var yMulti = event.deltaY / 80;
    var rotate = xMulti * yMulti;
    event.target.style.transform = 'translate(' + event.deltaX + 'px, ' + event.deltaY + 'px) rotate(' + rotate + 'deg)';
  });


  hammertime.on('panend', function (event) {

    el.classList.remove('moving');
    tinderContainer.classList.remove('tinder_love');
    tinderContainer.classList.remove('tinder_nope');
    var moveOutWidth = document.body.clientWidth;
    var keep = Math.abs(event.deltaX) < 80 || Math.abs(event.velocityX) < 0.5;
    event.target.classList.toggle('removed', !keep);

    if (keep) {
      event.target.style.transform = '';
    } else {
      var endX = Math.max(Math.abs(event.velocityX) * moveOutWidth, moveOutWidth);
      var toX = event.deltaX > 0 ? endX : -endX;
      var endY = Math.abs(event.velocityY) * moveOutWidth;
      var toY = event.deltaY > 0 ? endY : -endY;
      var xMulti = event.deltaX * 0.03;
      var yMulti = event.deltaY / 80;
      var rotate = xMulti * yMulti;

      var path = '';

      var updateCounter = function () {
            $.ajax({
              url: "places/",
              type: 'GET',
              dataType: "html",
              success: function(data) {
                // result = $(data).filter(".badge");
                // console.log(data);
                // console.log(result);
                var html = $.parseHTML(data);
                let bad = $(html).find('.badge')[0].innerText;
                $(".badge").text(bad);
              }
            });
      };

      setTimeout(function () {
        var link = event.target.querySelector('a');

        if (link)  {
          path = link.getAttribute("href");
          var thenum = path.replace( /^\D+/g, '');
          event.target.style.transform = 'translate(' + toX + 'px, ' + (toY + event.deltaY) + 'px) rotate(' + rotate + 'deg)';

          var allcardsRemoved = document.querySelectorAll('.tinder--card.removed');

          if (allcardsRemoved.length === allCards.length) {
            $('.last-card').show();
          }

          if (event.deltaX > 0) {
            $.ajax({
              url: '/places/'+ thenum +'/matches',
              type: 'post',
              data: { username: window.username, status: "yes"},
              success: function () {
                updateCounter();
              }
            });

            // let bae = document.querySelector(".badge").innerText;
            // bae.innerText + 1;


          } else {
            $.ajax({
              url: '/places/'+ thenum +'/matches',
              type: 'post',
              data: { username: window.username, status: "no"},
              success: function () {
                updateCounter();
              }
            }); // ajax closing
          }; // second else


            }

          }, 500);


    }; // first else
    initCards();
  });
});
function createButtonListener(love) {
  return function (event) {
    var cards = document.querySelectorAll('.tinder--card:not(.removed)');
    var moveOutWidth = document.body.clientWidth * 1.5;
    if (!cards.length) return false;
    var card = cards[0];
    card.classList.add('removed');
    if (love) {
      card.style.transform = 'translate(' + moveOutWidth + 'px, -100px) rotate(-30deg)';
    } else {
      card.style.transform = 'translate(-' + moveOutWidth + 'px, -100px) rotate(30deg)';
    }
    initCards();
    event.preventDefault();
  };
}
// document.addEventListener('DOMContentLoaded', function () {
//   var nopeListener = createButtonListener(false);
//   var loveListener = createButtonListener(true);
//   nope.addEventListener('click', nopeListener);
//   love.addEventListener('click', loveListener);
// });
