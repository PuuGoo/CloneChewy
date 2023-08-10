const items__big__image = document.querySelectorAll(".items__big__image img");
const items__pre = document.querySelector(".items__pre");
const items__next = document.querySelector(".items__next");
const items__small__image = document.querySelectorAll(".items__small__image img");
const items__first = document.querySelector(".items__first");
const items__last = document.querySelector(".items__last");
const items__cart = document.querySelector(".items__cart");
const item__options__image = document.querySelector(".item__options__image img");
const item__options__line = document.querySelector(".item__options__line");
const items__info__price__main = document.querySelector(".items__info__price__main");
const items__info__price__sub = document.querySelector(".items__info__price__sub");
const items__info__name = document.querySelector(".items__info__name");
const items__info__author = document.querySelector(".items__info__author a");
const flavor = document.querySelectorAll(".flavor div");
const size = document.querySelectorAll(".size div");
const size__title = document.querySelectorAll(".size__title");
const size__price = document.querySelectorAll(".size__price");
items__small__image[0].classList.add("hover");
// console.log(items__info__name__flavor.innerText);
var id = location.search.split("?")[1];
// console.log(sizeDiv);
var countFlavor = 0;
var countSize = 0;
flavor.forEach(e => {
    e.setAttribute("value", "off");
    if(e.getAttribute("value") == "off") {
        countFlavor++;
    }
});
flavor.forEach((e, index) => {
    e.addEventListener("click", () => {
        countFlavor = 0;
        flavor.forEach(e => {
            e.setAttribute("value", "off");
        });
        flavor[index].setAttribute("value", "on");
        document.querySelector(".resultFlavor").innerText = "";
        countFlavor++;
    });
});

size.forEach(e => {
    e.setAttribute("value", "off");
    if(e.getAttribute("value") == "off") {
        countSize++;
    }
});
size.forEach((e, index) => {
    e.addEventListener("click", () => {
        countSize = 0;
        size.forEach(e => {
            e.setAttribute("value", "off");
        });
        size[index].setAttribute("value", "on");
        document.querySelector(".resultSize").innerText = "";
        countSize++;
    });
});

localStorage.setItem("data", JSON.stringify(data.item));
const item = JSON.parse(localStorage.getItem("data"));
// console.log(JSON.parse(item[0]).sizeTitle[0].slice(0,2));
// console.log(JSON.parse(item[0]).image[1].imageFlavor2[0]);
for (let i = 0; i < item.length; i++) {
    var item1 = JSON.parse(item[i]);
    if (item1.id === id) {
        for (let i = 0; i < items__big__image.length; i++) {
            items__big__image[i].src = item1.image[0].imageFlavor1[i];
            items__small__image[i].src = item1.image[0].imageFlavor1[i];
        }
        items__info__author.innerText = item1.name;
        items__info__price__main.innerText = "$" + item1.price;
        items__info__price__sub.innerText = item1.unitPrice;
        items__info__name.innerText = item1.description[0];
        // console.log(item1.image[1].imageFlavor2.length);
        flavor.forEach((e, index) => {
            flavor[index].innerText = item1.flavor[index];
            // items__info__name__flavor.innerText = item1.flavor[index];
            e.addEventListener("click", () => {
                // console.log(e);
                // console.log(flavor[index].innerText);
                // console.log(item1.flavor[index]);

                if (flavor[index].innerText == item1.flavor[0]) {
                    items__info__name.innerText = item1.description[index];
                    flavor.forEach(e => {
                        e.classList.remove("flavor__hover");
                    })
                    flavor[index].classList.add("flavor__hover");
                    for (let i = 0; i < item1.image[index].imageFlavor1.length; i++) {
                        items__big__image[i].src = item1.image[0].imageFlavor1[i];
                        items__small__image[i].src = item1.image[0].imageFlavor1[i];
                    }
                } else {
                    // console.log(item1.image[index].imageFlavor2.length);
                    // console.log(index);
                    flavor.forEach(e => {
                        e.classList.remove("flavor__hover");
                    })
                    flavor[index].classList.add("flavor__hover");
                    items__info__name.innerText = item1.description[index];
                    for (let i = 0; i < item1.image[index].imageFlavor2.length; i++) {
                        // console.log(index);
                        // console.log(item1.image[index].imageFlavor2[i]);
                        items__big__image[i].src = item1.image[index].imageFlavor2[i];
                        items__small__image[i].src = item1.image[index].imageFlavor2[i];
                    }
                }
            });
        });

        size.forEach((e, index) => {
            e.addEventListener("click", () => {
                var priceChange = Math.round(item1.sizeQuantity[index]*item1.sizePrice[index]) - 0.02;
                items__info__price__main.innerText = "$" + priceChange;
                items__info__price__sub.innerText = "(" + item1.sizeUnitPrice[index] + ")"; 
                size.forEach(e => {
                    e.classList.remove("size__number__hover");
                });
                e.classList.add("size__number__hover");
            })
        });

        size__title.forEach((e, index) => {
            size__title[index].innerText = item1.sizeTitle[index];
        });
        size__price.forEach((e, index) => {
            size__price[index].innerText = item1.sizeUnitPrice[index];
        });
        break;
    }
}

items__big__image.forEach(e => {
    e.style.display = "none";
});

items__big__image[0].style.display = "block";

var count = 0;

for (let i = 0; i < items__small__image.length; i++) {
    items__small__image[i].addEventListener("click", () => {
        items__big__image.forEach(e => {
            e.style.display = "none";
        });
        items__big__image[i].style.display = "block";
        items__small__image.forEach(e => {
            e.classList.remove("hover");
        });
        items__small__image[i].classList.add("hover");
    });
}


items__pre.addEventListener("click", () => {
    count += -1;
    if (count < 0) {
        count = items__big__image.length - 1;
    }
    items__big__image.forEach(e => {
        e.style.display = "none";
    });
    items__small__image.forEach(e => {
        e.classList.remove("hover");
    });
    items__big__image[count].style.display = "block";
    items__small__image[count].classList.add("hover");
});

items__next.addEventListener("click", () => {
    count += 1;
    if (count == items__big__image.length) {
        count = 0;
    }
    items__big__image.forEach(e => {
        e.style.display = "none";
    });
    items__small__image.forEach(e => {
        e.classList.remove("hover");
    });
    items__big__image[count].style.display = "block";
    items__small__image[count].classList.add("hover");
});

items__first.addEventListener("click", () => {
    count = 0;
    items__big__image.forEach(e => {
        e.style.display = "none";
    });
    items__small__image.forEach(e => {
        e.classList.remove("hover");
    });
    items__big__image[count].style.display = "block";
    items__small__image[count].classList.add("hover");
});

items__last.addEventListener("click", () => {
    count = items__big__image.length - 1;
    items__big__image.forEach(e => {
        e.style.display = "none";
    });
    items__small__image.forEach(e => {
        e.classList.remove("hover");
    });
    items__big__image[count].style.display = "block";
    items__small__image[count].classList.add("hover");
});

// var item1 = JSON.parse(item[id - 1]);


// console.log(item);  

// var peoples = [
//     { "attr1": "bob", "attr2": "pizza" },
//     { "attr1": "john", "attr2": "sushi" },
//     { "attr1": "larry", "attr2": "hummus" }
//   ];

//   var index = item.map(function(o) { return o.id; }).indexOf("1");
//   console.log("index of 'john': " + index);

//   var index = peoples.map((o) => o.attr1).indexOf("larry");
//   console.log("index of 'larry': " + index);

//   var index = peoples.map(function(o) { return o.attr1; }).indexOf("fred");
//   console.log("index of 'fred': " + index);

//   var index = peoples.map((o) => o.attr2).indexOf("pizza");
//   console.log("index of 'pizza' in 'attr2': " + index);
const items__quantity__select = document.querySelectorAll(".items__quantity select");
window.addEventListener("change", () => {
    items__quantity__select.forEach((e, index) => {
        e.addEventListener("click", () => {
            console.log(items__quantity__select[index].value);
        });
    });
});

items__cart.addEventListener("click", (e) => {
    e.preventDefault();
    var itemList = {
        id: id,
        author:document.querySelector(".items__info__author a").innerText,
        image: document.querySelectorAll(".items__big__image img")[id - 1].src,
        desc: document.querySelector(".items__info__name").innerText,
        price: document.querySelector(".items__info__price__main").innerText,
        quantity: document.querySelector(".items__quantity select").value
    }
    // console.log(item1);
    // console.log(item1);
    if(countFlavor == 2 && countSize == 3) {
        document.querySelector(".resultFlavor").innerText = "Please select Flavor!";
        document.querySelector(".resultSize").innerText = "Please select Size!";
        // alert();
        countFlavor = 0;
    } else if(countFlavor == 1 && countSize == 3) {
        document.querySelector(".resultSize").innerText = "Please select Size!";
    } else if(countFlavor == 2 && countSize == 1) {
        document.querySelector(".resultFlavor").innerText = "Please select Flavor!";
    } else {
        document.querySelector(".resultFlavor").innerText = "";
        document.querySelector(".resultSize").innerText = "";
    }

    if(countFlavor != 2 && countSize != 3) {
        alert("Add item successfully!");
    }
    // if(countSize == 3) {

    //     // alert();
    //     countSize = 0;
    // } else {
    //     document.querySelector(".resultSize").innerText = "";
    // }
    localStorage.setItem(id, JSON.stringify(itemList));
    localStorage.setItem("quantity" + id, itemList.quantity);
});

// function check(age) {
//     return age = 4;
// }
// items__cart.addEventListener("click", () => {
//     // item__options__image.src = "./ImageAboutItems/Pedigree/Pedigree__1.webp";
//     // items__big__image[1].src = "./ImageAboutItems/Pedigree/Pedigree__1.webp";
//     item__options__line.insertAdjacentHTML("afterend", ``)
// });


// item__options__image.addEventListener("click", () => {
//     alert("haha");
// });

// const right__option__save = document.querySelector(".right__option__save");

// right__option__save.addEventListener("click", () => {
//     alert("haha");
// });