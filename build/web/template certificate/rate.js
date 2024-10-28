var result = 0;
var rater = document.getElementById('rate');
var stars = Array.from(rater.children);
rater.addEventListener('touchmove', raterEnd);
stars.forEach(function (item) {
    item.addEventListener('mousemove', rateStar.bind(null, item, showResult));

});



function raterEnd(e) {
    e.preventDefault();
    e.stopPropagation();
    var changedTouch = e.changedTouches[0];
    var elem = document.elementFromPoint(changedTouch.clientX, changedTouch.clientY);
    endElem = elem;
    rateStar(elem, showResult);
}


function rateStar(ratedItem, callback) {
    if (stars.includes(ratedItem)) {
        result = parseInt(ratedItem.dataset.score);
        stars.forEach(function (item) {
            var position = parseInt(item.dataset.score);
            if (position === 0) {
                item.style.color = "#ccc";
            } else if (position <= result) {
                item.style.color = "gold";
            } else {
                item.style.color = "#ccc";
            }
        });
    }
    callback();
}
function showResult() {
  document.getElementById('result').innerHTML = result;
  document.getElementById('ratingInput').value = result;

  // Xóa phần submit form ở đây
}
function clickStar(star) {

  rateStar(star, showResult);
  
  document.getElementById('ratingForm').submit();
}

stars.forEach(function(star) {
  star.addEventListener('click', clickStar);
});

