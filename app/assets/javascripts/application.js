//= require rails-ujs
//= require_tree .
// require hammer.min


// console.log("hello");
// var config = {
//   *
//    * Invoked in the event of dragmove.
//    * Returns a value between 0 and 1 indicating the completeness of the throw out condition.
//    * Ration of the absolute distance from the original card position and element width.
//    *
//    * @param {number} xOffset Distance from the dragStart.
//    * @param {number} yOffset Distance from the dragStart.
//    * @param {HTMLElement} element Element.
//    * @returns {number}

//    throwOutConfidence: (xOffset, yOffset, element) => {
//     const xConfidence = Math.min(Math.abs(xOffset) / element.offsetWidth, 1);
//     const yConfidence = Math.min(Math.abs(yOffset) / element.offsetHeight, 1);

//     var confidence = Math.max(xConfidence, yConfidence);
//     console.log(confidence);

//     var confidenceNew = confidence + 0.6;
//     if (confidenceNew > 1) confidenceNew = 1;


//     return confidenceNew;
//   }
// };


// document.addEventListener('DOMContentLoaded', function () {
//   var stack;

//   stack = window.swing.Stack(config);

//   [].forEach.call(document.querySelectorAll('.tinder--card'), function (targetElement) {
//     stack.createCard(targetElement);

//     targetElement.classList.add('in-deck');
//   });

//   stack.on('throwout', function (e) {
//     console.log(e.target.innerText || e.target.textContent, 'has been thrown out of the stack to the', e.throwDirection, 'direction.');
//     var thestring = e.target.querySelector('a').getAttribute("href");
//     var thenum = thestring.replace( /^\D+/g, '');
//     console.log(thenum);


//   var test = e.throwDirection.toString();
//   console.log(test);

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


    var confidenceNew = confidence + 0.6;
    if (confidenceNew > 1) confidenceNew = 1;


    return confidenceNew;
  }
};


document.addEventListener('DOMContentLoaded', function () {
  // var stack;

  // stack = window.swing.Stack(config);

  // [].forEach.call(document.querySelectorAll('.tinder--card'), function (targetElement) {
  //   stack.createCard(targetElement);

  //   targetElement.classList.add('in-deck');
  // });

  // stack.on('throwout', function (e) {
  //   console.log(e.target.innerText || e.target.textContent, 'has been thrown out of the stack to the', e.throwDirection, 'direction.');

  //   e.target.classList.remove('in-deck');
  // });

  // stack.on('throwin', function (e) {
  //   console.log(e.target.innerText || e.target.textContent, 'has been thrown into the stack from the', e.throwDirection, 'direction.');

  //   e.target.classList.add('in-deck');
  // });


    // shw more:
    $('.expandable .text-show-more').click(function (e) {
      e.preventDefault();

      var button = $(e.currentTarget);
      var all = button.parent().find(".text-all");
      var showLess = button.parent().find(".text-show-less");

      all.show();
      showLess.show();
      button.hide();
    });

    $('.expandable .text-show-less').click(function (e) {
      e.preventDefault();

      var button = $(e.currentTarget);
      var all = button.parent().find(".text-all");
      var showMore = button.parent().find(".text-show-more");

      all.hide();
      showMore.show();
      button.hide();
    });


    var selectorSrc = "data-src";
    var images = document.querySelectorAll("["+selectorSrc+"]");

    images.forEach(function(image) {
    //  image.src = image.dataset.src;
    });

});


//document.getElementById("tinder--card").addEventListener("click", link_to_index);
