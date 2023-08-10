const label = document.querySelectorAll(".submit label");
const input = document.querySelectorAll(".submit input");
// const body = document.querySelector("body");
// const info__ship = document.querySelectorAll(".info__ship");
const result = document.querySelector("#result");
const button = document.querySelector(".button button");
const selectState = document.querySelector(".info__ship__state select");

for (let i = 0; i < input.length; i++) {
    input[i].addEventListener("click", () => {
        if (i == 4 || i == 5) {
            label[i + 1].classList.add("hover");
            input[i].focus();
        } else {
            label[i].classList.add("hover");
        }
    });
}

for (let i = 0; i < label.length; i++) {
    label[i].addEventListener("click", () => {
        label[i].classList.add("hover");
        if (i == 5 || i == 6) {
            input[i - 1].focus();
        } else {
            input[i].focus();
        }
    });
}
selectState.value = "";
selectState.addEventListener("click", () => {
    const option = document.querySelector(".select__state");
    if (selectState.value !== "") {
        selectState.removeChild(option);
    }
    label[4].classList.add("hover");
});


button.addEventListener("click", e => {
    // Lấy cặp giá trị
    let q = window.location.search;
    let params = new URLSearchParams(q);
    for (let p of params) {
        console.log(p);
    }
    // let name = params.get("name");
    // console.log(name);
    // e.preventDefault();
    a();
});


function a() {
    if (form.FirstName.value == "") {
        result.innerText = "First Name is required.";
        return false;
    } else if (form.Street.value == "") {
        result.innerText = "Street Address is required.";
        return false;
    } else if (form.City.value == "") {
        result.innerText = "City is required.";
        return false;
    } else if (form.State.value == "") {
        result.innerText = "State is required.";
        return false;
    } else if (form.Zip.value == "") {
        result.innerText = "Zip is required.";
        return false;
    } else if (form.Phone.value == "") {
        result.innerText = "Phone is required.";
        return false;
    }
};

// Q1: State không hoạt động // Done
// Q2: Khi click button submit thì tự động reset // Done
// Q3: Khi click outside thì hiện lặp tức thông báo yêu cầu nhập
// Q4: Khi nhấn nút submit thì hiện đỏ những khung chưa nhập
// Q5: Khi thay thành input type"button" thì ko form ko được nhận