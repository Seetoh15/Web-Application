function showAlert(courseName) {
    alert("You selected " + courseName + "!");
    }

function addEventListeners() {
    document.getElementById('englishButton').addEventListener('click', function () {
        showAlert('English');
    });
document.getElementById('mathematicsButton').addEventListener('click', function () {
    showAlert('Mathematics');
        });
    }

window.onload = addEventListeners;
