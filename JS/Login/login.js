const buttonSignIn = document.querySelector(".btn__sign__in");
const input = document.querySelectorAll(".login__left__info input");
const label = document.querySelectorAll(".login__left__info label");
const result = document.querySelectorAll(".result");

var count = 0;
buttonSignIn.addEventListener("click", () => {
    // alert("haha");
    input.forEach((e, index) => {
        if (e.value !== "") {
            count++;
        }
        console.log(count);
        if (count == 2) {
            // alert("Signin successfully!");
        }

        if (input[index].value == "" && label[index].innerText == "Email Address") {
            result[index].innerText = "Email Address is required!";
        } else if (input[index].value == "" && label[index].innerText == "Password") {
            result[index].innerText = "Password is required!";
        }
    });

    var user = {
        id: input[0].value,
        password: input[1].value
    }
    console.log(user.id);
    for (let i = 0; i < localStorage.length; i++) {
        if (user.id == localStorage.key(i)) {
            // alert("Id and Password not correct!");
            if(user.password == JSON.parse(localStorage.getItem(user.id)).password) {
                alert("Login successfully!");
            } else {
                alert("Id and Password not correct!");
            }
        }
    }

});


input.forEach((e, index) => {
    e.addEventListener("click", () => {
        check(index);
        label[index].setAttribute("id", "liEmail__hover" + index);
    });
    e.addEventListener("mouseover", () => {
        label[index].setAttribute("id", "liEmail__hover" + index);
        document.querySelectorAll(".login__left__info input")[index].classList.add("login__hover__input");
    });

    e.addEventListener("mouseout", () => {
        // label[index].removeAttribute("id", "liEmail__hover" + index);
        document.querySelectorAll(".login__left__info input")[index].classList.remove("login__hover__input");
    });
});


label.forEach((e, index) => {
    e.addEventListener("click", () => {
        check(index);
        label[index].setAttribute("id", "liEmail__hover" + index);
    });

    e.addEventListener("mouseover", () => {
        label[index].setAttribute("id", "liEmail__hover" + index);
    });

    e.addEventListener("mouseout", () => {
        // label[index].removeAttribute("id", "liEmail__hover" + index);
    });
});

function check(index) {
    window.addEventListener("click", (e) => {
        // console.log(e.target);
        if (e.target !== label[index] && e.target !== input[index]) {
            if (input[index].value == "") {
                result[index].innerText = `${label[index].innerText} is required.`;
                // input[index].classList.add("input__hover");
                // alert("trong");
                label[index].removeAttribute("id", "liEmail__hover" + index);
            } else {
                // input[index].classList.remove("input__hover");
                result[index].innerText = "";
            }
        }
    });
}


