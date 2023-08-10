const buttonSignIn = document.querySelector(".primary-btn");
const input = document.querySelectorAll(".register__info__action input");
const label = document.querySelectorAll(".register__info__action label");
const result = document.querySelectorAll(".result");


var count = 0;
buttonSignIn.addEventListener("click", () => {
    // alert("haha");
    input.forEach((e,index) => {
        if(e.value !== "") {
            count++;
        }
        console.log(count);
        if(count == 2) {
            alert("Create account successfully!");
        }

        if(input[index].value == "" && label[index].innerText == "Full Name") {
            result[index].innerText = "Full Name is required!";
        } else if (input[index].value == "" && label[index].innerText == "Email Address") {
            result[index].innerText = "Email Address is required!";
        } else if (input[index].value == "" && label[index].innerText == "Password(At least 8 characters)") {
            result[index].innerText = "Password(At least 8 characters) is required!";
        } else if (input[index].value == "" && label[index].innerText == "Confirm Password") {
            result[index].innerText = "Confirm Password is required!";
        }
    });

    var user = {
        id: input[1].value,
        password: input[2].value
    }
    localStorage.setItem(user.id, JSON.stringify(user));
});


input.forEach((e, index) => {
    e.addEventListener("click", () => {
        check(index);
        label[index].setAttribute("id", "liEmail__hover" + index);
    });
    e.addEventListener("mouseover", () => {
        label[index].setAttribute("id", "liEmail__hover" + index);
        document.querySelectorAll(".register__info input")[index].classList.add("login__hover__input");
    });

    e.addEventListener("mouseout", () => {
        // label[index].removeAttribute("id", "liEmail__hover" + index);
        document.querySelectorAll(".register__info input")[index].classList.remove("login__hover__input");
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
        label[index].removeAttribute("id", "liEmail__hover" + index);
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