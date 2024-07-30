document.addEventListener('DOMContentLoaded', (event) => {
    var popup = document.getElementById("popup");
    var btn = document.getElementById("popupBtn");
    var span = document.getElementsByClassName("close")[0];

    btn.onclick = function (event) {
        event.preventDefault();
        popup.style.display = "block";
    }

    span.onclick = function () {
        popup.style.display = "none";
    }

    window.onclick = function (event) {
        if (event.target == popup) {
            popup.style.display = "none";
        }
    }
});
