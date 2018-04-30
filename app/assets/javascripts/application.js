//= require touch-emulator
//= require rails-ujs
//= require_tree .

// 'use strict';

// var tinderContainer = document.querySelector('.tinder');
// var allCards = document.querySelectorAll('.tinder--card');
// var nope = document.getElementById('nope');
// var love = document.getElementById('love');

// function initCards(card, index) {
//   var newCards = document.querySelectorAll('.tinder--card:not(.removed)');

//   newCards.forEach(function (card, index) {
//     card.style.zIndex = allCards.length - index;
//     card.style.transform = 'scale(' + (20 - index) / 20 + ') translateY(-' + 30 * index + 'px)';
//     card.style.opacity = (10 - index) / 10;
//   });

//   tinderContainer.classList.add('loaded');
// }

// initCards();

// allCards.forEach(function (el) {
//   var hammertime = new Hammer(el);

//   hammertime.on('pan', function (event) {
//     el.classList.add('moving');
//   });

//   hammertime.on('pan', function (event) {
//     if (event.deltaX === 0) return;
//     if (event.center.x === 0 && event.center.y === 0) return;

//     tinderContainer.classList.toggle('tinder_love', event.deltaX > 0);
//     tinderContainer.classList.toggle('tinder_nope', event.deltaX < 0);

//     var xMulti = event.deltaX * 0.03;
//     var yMulti = event.deltaY / 80;
//     var rotate = xMulti * yMulti;

//     event.target.style.transform = 'translate(' + event.deltaX + 'px, ' + event.deltaY + 'px) rotate(' + rotate + 'deg)';
//   });

//   hammertime.on('panend', function (event) {
//     el.classList.remove('moving');
//     tinderContainer.classList.remove('tinder_love');
//     tinderContainer.classList.remove('tinder_nope');

//     var moveOutWidth = document.body.clientWidth;
//     var keep = Math.abs(event.deltaX) < 80 || Math.abs(event.velocityX) < 0.5;

//     event.target.classList.toggle('removed', !keep);

//     if (keep) {
//       event.target.style.transform = '';
//     } else {
//       var endX = Math.max(Math.abs(event.velocityX) * moveOutWidth, moveOutWidth);
//       var toX = event.deltaX > 0 ? endX : -endX;
//       var endY = Math.abs(event.velocityY) * moveOutWidth;
//       var toY = event.deltaY > 0 ? endY : -endY;
//       var xMulti = event.deltaX * 0.03;
//       var yMulti = event.deltaY / 80;
//       var rotate = xMulti * yMulti;

//       event.target.style.transform = 'translate(' + toX + 'px, ' + (toY + event.deltaY) + 'px) rotate(' + rotate + 'deg)';
//       initCards();
//     }
//   });
// });

// function createButtonListener(love) {
//   return function (event) {
//     var cards = document.querySelectorAll('.tinder--card:not(.removed)');
//     var moveOutWidth = document.body.clientWidth * 1.5;

//     if (!cards.length) return false;

//     var card = cards[0];

//     card.classList.add('removed');

//     if (love) {
//       card.style.transform = 'translate(' + moveOutWidth + 'px, -100px) rotate(-30deg)';
//     } else {
//       card.style.transform = 'translate(-' + moveOutWidth + 'px, -100px) rotate(30deg)';
//     }

//     initCards();

//     event.preventDefault();
//   };
// }

// var nopeListener = createButtonListener(false);
// var loveListener = createButtonListener(true);

// nope.addEventListener('click', nopeListener);
// love.addEventListener('click', loveListener);



const config = {
  /**
   * Invoked in the event of dragmove.
   * Returns a value between 0 and 1 indicating the completeness of the throw out condition.
   * Ration of the absolute distance from the original card position and element width.
   *
   * @param {number} xOffset Distance from the dragStart.
   * @param {number} yOffset Distance from the dragStart.
   * @param {HTMLElement} element Element.
   * @returns {number}
   */
  throwOutConfidence: (xOffset, yOffset, element) => {
    const xConfidence = Math.min(Math.abs(xOffset) / element.offsetWidth, 1);
    const yConfidence = Math.min(Math.abs(yOffset) / element.offsetHeight, 1);

    var confidence = Math.max(xConfidence, yConfidence);
    console.log(confidence);

    var confidenceNew = confidence + 0.6;
    if (confidenceNew > 1) confidenceNew = 1;


    return confidenceNew;
  }
};


document.addEventListener('DOMContentLoaded', function () {
    // var stack;

    // stack = window.swing.Stack(config);

    // [].forEach.call(document.querySelectorAll('.tinder--card'), function (targetElement) {
    //     stack.createCard(targetElement);

    //     targetElement.classList.add('in-deck');
    // });

    // stack.on('throwout', function (e) {
    //     console.log(e.target.innerText || e.target.textContent, 'has been thrown out of the stack to the', e.throwDirection, 'direction.');

    //     e.target.classList.remove('in-deck');
    // });

    // stack.on('throwin', function (e) {
    //     console.log(e.target.innerText || e.target.textContent, 'has been thrown into the stack from the', e.throwDirection, 'direction.');

    //     e.target.classList.add('in-deck');
    // });
});


// document.getElementById("tinder--card").addEventListener("click", link_to_index);
