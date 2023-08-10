    const item__options__line = document.querySelector(".item__options__line");
    const right__option__save = document.querySelector(".right__option__save a");
    const subtotal__price = document.querySelector(".subtotal__price");
    var check = false;

    // Điều kiện để xuất tổng khi checkbox by key: "totalBrutoDefault" in localstorage
    if (check) {
        subtotal__price.innerText = "$" + Number(localStorage.getItem("totalBrutoDefault")).toFixed(2);
        localStorage.setItem("totalBruto", localStorage.getItem("totalBrutoDefault"));
        localStorage.setItem("totalBruto", 0);
        check = true;
    }


    localStorage.setItem("totalBruto", 0);


    // console.log(checkbox.checked);
    // Load tất dữ liệu sản phẩm từ localstorage
    window.addEventListener("load", () => {
        // console.log(localStorage.key(1));
        var total = 0;
        var totalBruto = 0;

        for (let i = 0; i < data.item.length; i++) {
            var id = JSON.parse(JSON.parse(JSON.stringify(data.item[i]))).id;
            // console.log(localStorage.length);
            // console.log(localStorage.key(i));
            for (let j = 0; j < localStorage.length; j++) {
                if (id == localStorage.key(j)) {
                    // console.log(localStorage.key(i));
                    // console.log(i);
                    var takeData = JSON.parse(localStorage.getItem(localStorage.key(j)));
                    console.log(takeData.image);
                    // console.log(localStorage.key(0));
                    item__options__line.insertAdjacentHTML("afterbegin", `<li>
        <div class="item__options__wrapper item__inline">
        <div class="checkbox">
            <input type="checkbox" id="check" value="${id}">
        </div>
        <a class="item__options__image" href="#">
            <div>
                <img src="${takeData.image}" alt="">
            </div>
        </a>
        <div class="item__options__description item__margin">
            <div class="cart__info__left">
                <a href="">
                    <div class="item__options__desc">
                        <strong>${takeData.author}</strong> ${takeData.desc.split(`${takeData.author}`)[1]}
                    </div>
                    <div class="item__options__icon">
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star-half-stroke"></i>
                    </div>
                </a>
                <div class="item__options__price">
                    ${takeData.price}
                    <div class="autoShip__info">
                        <div class="autoShip__info__wrapper">
                            $68.38
                            <div class="autoShip__icon">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                    <g fill-rule="evenodd">
                                        <path fill="#18499B"
                                            d="M19.24 4.26L17.3 6.74c-2.7-2.1-8.4-5.06-13.93 1.07-.45.5-.89 1.06-1.32 1.69L2 9.57h.01a11.5 11.5 0 016.46-1.48c2.83.18 4.05.86 5.8 2.54l-1.94 2.51s4.1 1.8 8.84-.25l-1.93-8.63z">
                                        </path>
                                        <path fill="#F27123"
                                            d="M3.94 20.27l1.92-2.47c2.7 2.09 8.4 5.06 13.93-1.08.45-.5.89-1.05 1.32-1.68l.06-.07h-.01a11.5 11.5 0 01-6.46 1.47c-2.83-.17-4.05-.85-5.8-2.54l1.94-2.5s-4.1-1.8-8.84.25l1.94 8.62z">
                                        </path>
                                    </g>
                                </svg>
                                <a href="#">Autoship</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="cart__info__right">
                <div class="right__options">
                    <select name="" id="" quantity= ${id}>
                        <option value="0" selected="">0</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                        <option value="10">10</option>
                        <option value="11">11</option>
                        <option value="12">12</option>
                    </select>
                </div>
                <div class="right__option__save">
                    <a href="#">Save for Later</a>
                </div>
                <div class="right__option__remove" value="${takeData.id}">
                    <a href="#"><i class="fa-solid fa-trash"></i> Remove</a>
                </div>
            </div>
        </div>
        </div>
        </li>`);

                    // document.querySelectorAll(".right__options select").value = takeData.quantity;
                    // console.log(count);
                    // console.log(quantity);

                    // // console.log(total);

                    // console.log(subtotal__price);
                }
            }

        }





        const select = document.querySelectorAll("select");
        // console.log(select.length);
        var count = 0;
        // Xuất tổng sản phẩm có trong giỏ hàng
        const quantity__total = document.querySelector(".quantity__total");
        quantity__total.innerText = count + " items";
        // for (let i = 0; i < select.length; i++) {
        //     localStorage.setItem("priceTotal" + document.querySelectorAll(".right__option__remove")[i].getAttribute("value"), 0);

        // }

        // Úp dữ liệu số lượng từng sản phẩm lên localstorage
        for (let i = 0; i < select.length; i++) {
            select[i].addEventListener("change", () => {
                // var k = document.querySelectorAll(".right__option__remove")[i].getAttribute("value");
                // console.log(k);
                localStorage.setItem("quantity" + select[i].getAttribute("quantity"), JSON.stringify(select[i].value));
                // var takeData = JSON.parse(localStorage.getItem(k)).price;
                // // console.log(takeData);
                // var priceTotalLine = Number(takeData) * (select[i].value);
                // total = priceTotalLine;
                // localStorage.setItem("priceTotal" + document.querySelectorAll(".right__option__remove")[i].getAttribute("value"), total);
                // localStorage.setItem("priceTotal" + document.querySelectorAll(".right__option__remove")[i].getAttribute("value"), total);
                // console.log(total);
                // console.log();
                // check = true;
                location.reload();
                // console.log("quantity" + select[i].getAttribute("quantity"));
                // loadTotal();
                // subtotal__price.innerText = "$0";
            })
        }

        // Tạo checkbox hiển thị giá
        const inputCheck = document.querySelectorAll(".checkbox input");
        // inputCheck.forEach((e, index) => {
        //     localStorage.setItem("quantity" + inputCheck[index].value, 0);
        // })
        // console.log(localStorage.getItem("checkbox" + inputCheck[1].getAttribute("value")));
        // Dua vo totalBrutal de checkbox
        inputCheck.forEach((e, index) => {
            console.log();
            // for (let i = 0; i < localStorage.length; i++) {
            //     if ("checkbox" + inputCheck[index].getAttribute("value") == localStorage.key(i)) {
            //         inputCheck[index].setAttribute("checked", localStorage.getItem("checkbox" + inputCheck[index].getAttribute("value")));
            //     }
            // }

            e.addEventListener("click", () => {
                // console.log(e.);
                if (inputCheck[index].checked === true) {
                    localStorage.setItem("checkbox" + inputCheck[index].getAttribute("value"), "true");
                    totalBruto = Number(localStorage.getItem("totalBruto")) + JSON.parse(data.item[inputCheck[index].getAttribute("value") - 1]).price * JSON.parse(localStorage.getItem("quantity" + inputCheck[index].getAttribute("value")));
                    // console.log(totalBruto);
                    // console.log(totalBruto);
                    subtotal__price.innerText = "$" + totalBruto.toFixed(2);
                    localStorage.setItem("totalBruto", totalBruto.toFixed(2));
                    count++;
                    quantity__total.innerText = count + " items";
                } else if (inputCheck[index].checked === false) {
                    // console.log(index);
                    localStorage.removeItem("checkbox" + inputCheck[index].getAttribute("value"));
                    totalBruto = Number(localStorage.getItem("totalBruto")) - JSON.parse(data.item[inputCheck[index].getAttribute("value") - 1]).price * JSON.parse(localStorage.getItem("quantity" + inputCheck[index].getAttribute("value")));
                    // console.log(totalBruto);
                    // console.log(totalBruto);
                    subtotal__price.innerText = "$" + totalBruto.toFixed(2);
                    // loadTotal();
                    localStorage.setItem("totalBruto", totalBruto.toFixed(2));
                    count--;
                    quantity__total.innerText = count + " items";
                }
            });
        });

        // window.addEventListener("change", () => {
        //     totalBruto = 0;
        //     for (let i = 0; i < select.length; i++) {
        //         totalBruto += Number(localStorage.getItem("priceTotal" + document.querySelectorAll(".right__option__remove")[i].getAttribute("value")));
        //         localStorage.setItem("totalBruto", totalBruto);
        //         subtotal__price.innerText = "$" + totalBruto.toFixed(2);
        //     }
        // })



        // window.addEventListener("change", () => {
        //     loadTotal();
        // });



        // window.addEventListener("change", () => {
        // totalBruto = 0;
        //     for (let i = 0; i < select.length; i++) {
        //         totalBruto += Number(localStorage.getItem("priceTotal" + i));
        //     }
        //     subtotal__price.innerText = "$" + totalBruto.toFixed(2);
        // })

        // Xóa sản phẩm
        const right__option__remove = document.querySelectorAll(".right__option__remove");

        // console.log("quantity" + right__option__remove[0].getAttribute("value"));

        // console.log(right__option__remove.length);
        for (let i = 0; i < right__option__remove.length; i++) {
            right__option__remove[i].addEventListener("click", () => {
                // console.log(i);
                // console.log(right__option__remove[i]);
                totalBruto = Number(localStorage.getItem("totalBrutoDefault")) - JSON.parse(data.item[right__option__remove[i].getAttribute("value") - 1]).price * JSON.parse(localStorage.getItem("quantity" + right__option__remove[i].getAttribute("value")));
                localStorage.setItem("totalBruto", totalBruto);
                localStorage.setItem("totalBrutoDefault", totalBruto);
                localStorage.removeItem(right__option__remove[i].getAttribute("value"));
                localStorage.removeItem("quantity" + right__option__remove[i].getAttribute("value"));
                // console.log(Number(localStorage.getItem("totalBrutoDefault")));
                console.log(totalBruto);

                location.reload();
                // select.forEach((e, index) => {
                //     select[index].value = localStorage.getItem("quantity" + select[index].getAttribute("value"));
                //     console.log(select[index].value);
                // });
            });
        }

        // nettotal();

        for (let i = 0; i < right__option__remove.length; i++) {
            // console.log(right__option__remove.length);
            // console.log(select[i].getAttribute("quantity"));
            // console.log(right__option__remove[i].getAttribute("value"));
            for (let j = 0; j < localStorage.length; j++) {
                // console.log(localStorage.key(j));
                if (right__option__remove[i].getAttribute("value") == localStorage.key(j)) {
                    // console.log(JSON.parse(localStorage.getItem("quantity" + localStorage.key(j))));
                    select[i].value = JSON.parse(localStorage.getItem("quantity" + localStorage.key(j)));
                    // console.log(right__option__remove[i].getAttribute("value"));
                }
            }
        }
        // loadTotal();
        // loadTotal();
        // console.log(select[0].value);
        function loadTotal() {
            window.addEventListener("change", () => {
                total = 0;
                for (let i = 0; i < select.length; i++) {
                    var k = select[i].getAttribute("quantity")
                    // console.log(k);
                    // console.log("quantity" + k);
                    var quantity = JSON.parse(localStorage.getItem("quantity" + k));
                    var price = JSON.parse(JSON.parse(localStorage.getItem(k)).price.slice(1));
                    // console.log(quantity);
                    console.log(price);
                    total += quantity * price;
                    console.log(subtotal__price.innerText);

                    localStorage.setItem("totalBruto", total)
                    localStorage.setItem("totalBrutoDefault", total)

                }
            });
        }



        // nettotal();


        // window.addEventListener("change", () => {
        // subtotal__price.innerText = localStorage.getItem("totalBruto");

        // })

        // checkbox.addEventListener("click", () => {
        //     if(checkbox.checked == true) {
        //         alert("just check");
        //     }
        // });



        // window.addEventListener("change", () => {  
        //     for (let i = 0; i < option.length; i++) {
        //         option[i].addEventListener("click", () => {
        //             alert("haha");
        //             option[i].addEventListener("change", () => {
        //                 console.log(option[i].value);
        //             })
        //         });
        //     }
        // });
        // console.log(quantity);
    })


    // Q1: 