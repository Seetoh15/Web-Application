document.addEventListener('DOMContentLoaded', function () {
    const quizContainer = document.querySelector('.centered-form');

    if (quizContainer) {
        const submitButton = quizContainer.querySelector('#submitQuizForm');

        if (submitButton) {
            submitButton.addEventListener('click', function (event) {
                event.preventDefault();

                const correctAnswers = {
                    1: 'Joyful',
                    2: 'Run',
                    3: 'Went',
                    4: 'The mouse was chased by the cat.',
                    5: 'Modern',
                    6: 'I went to the store, and I bought some milk.',
                    7: 'Quick',
                    8: 'It\'s raining outside.',
                    9: 'All of the above',
                    10: 'She doesn\'t like to read.'
                };

                let correctCount = 0;
                let totalQuestions = 10;

                for (let i = 1; i <= totalQuestions; i++) {
                    const selectedAnswer = quizContainer.querySelector(`input[name="${i}"]:checked`);
                    const labels = quizContainer.querySelectorAll(`input[name="${i}"] + label`);

                    labels.forEach(label => {
                        if (label.textContent === correctAnswers[i]) {
                            label.style.color = 'green';
                        } else {
                            label.style.color = 'red';
                        }
                    });

                    if (selectedAnswer) {
                        const selectedValue = selectedAnswer.value;

                        if (selectedValue === correctAnswers[i]) {
                            correctCount++;
                        }

                        const radioButtons = quizContainer.querySelectorAll(`input[name="${i}"]`);
                        radioButtons.forEach(button => {
                            button.disabled = true;
                        });
                    }
                }

                const percentage = (correctCount / totalQuestions) * 100;
                const percentageDisplay = quizContainer.querySelector('#percentageDisplay');
                percentageDisplay.innerHTML = `You got ${correctCount} out of ${totalQuestions} correct (${percentage.toFixed(2)}%)<br>`;

                if (percentage >= 50) {
                    percentageDisplay.style.color = 'green';
                } else {
                    percentageDisplay.style.color = 'red';
                }
            });
        }
    }
});