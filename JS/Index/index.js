const banner__big = document.querySelectorAll(".banner-big img");
const items__pre = document.querySelector(".items__pre");
const items__next = document.querySelector(".items__next");
const items__pause__play = document.querySelector(".items__pause__play");
const items__circle = document.querySelectorAll(".items__circle");
var isPause = false;

// console.log(isPaused);
var countSlide = 0;
var countClick = 0;
items__pre.addEventListener("click", () => {

    countClick -= 1;
    if (countClick < 0) {
        countClick = banner__big.length - 1;
        countSlide = countClick;
    }
    countSlide = countClick;

    console.log(countClick);
    banner__big.forEach((image, index) => {
        image.style.display = "none";
        items__circle.forEach((e, index) => {
            e.innerHTML = `<i class="fa-regular fa-circle"></i>`;
        });
    });

    banner__big[countClick].style.display = "block";
    items__circle[countClick].innerHTML = `<i class="fa-solid fa-circle"></i>`
});


items__next.addEventListener("click", () => {
    countClick += 1;

    if (countClick == banner__big.length) {
        countClick = 0;
        countSlide = countClick;
    }
    countSlide = countClick;
    banner__big.forEach((image, index) => {
        image.style.display = "none";
        items__circle.forEach((e, index) => {
            e.innerHTML = `<i class="fa-regular fa-circle"></i>`;
        });
    });

    banner__big[countClick].style.display = "block";
    items__circle[countClick].innerHTML = `<i class="fa-solid fa-circle"></i>`
});

items__pause__play.addEventListener("click", (e) => {
    // e.preventDefault();
    if (items__pause__play.innerHTML == `<i class="fa-solid fa-pause"></i>`) {
        isPause = true;
        items__pause__play.innerHTML = `<i class="fa-solid fa-play"></i>`
    } else if (items__pause__play.innerHTML == `<i class="fa-solid fa-play"></i>`) {
        isPause = false;
        items__pause__play.innerHTML = `<i class="fa-solid fa-pause"></i>`
    }
});

items__circle.forEach((e, index) => {
    e.addEventListener("click", () => {
        banner__big.forEach(e => {
            e.style.display = "none";
            items__circle.forEach((e, index) => {
                e.innerHTML = `<i class="fa-regular fa-circle"></i>`;
            });
        })
        // countSlide = index;
        // console.log(countSlide);
        banner__big[index].style.display = "block";
        items__circle[index].innerHTML = `<i class="fa-solid fa-circle"></i>`
        countSlide = index;
    });
});


banner__big[0].style.display = "block";

window.setInterval(() => {
    // console.log(isPause);
    if (!isPause) {
        if (countSlide == banner__big.length) {
            countSlide = 0;
        }
        banner__big.forEach((image, index) => {
            image.style.display = "none";
            if (index == countSlide) {
                banner__big[index].style.display = "block";
            }
        });
        // console.log(countSlide);

        items__circle.forEach((e, index) => {
            e.innerHTML = `<i class="fa-regular fa-circle"></i>`;
            if (index == countSlide) {
                items__circle[index].innerHTML = `<i class="fa-solid fa-circle"></i>`;
            }
        });
        countSlide++;
        countClick = countSlide - 1;
    }
}, 2000);