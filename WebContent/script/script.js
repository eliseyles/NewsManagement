let checkBoxes = document.getElementsByTagName("input");
let button = document.getElementById("deleteBtn");

function f() {
    console.log("Start")
    console.log(checkBoxes.length)
    let counter = 0;
    for (let i = 0; i < checkBoxes.length; i++) {
        console.log(checkBoxes[i].checked)
        if (checkBoxes[i].checked) {
            counter++;
            console.log("checked")
        }
    }
    if (counter > 0) {
        button.hidden = false;
        console.log("hidden false" + counter.toString());
    } else {
        button.hidden = true;
        console.log("hidden true" + counter.toString());
    }
}

document.addEventListener("change", f);

