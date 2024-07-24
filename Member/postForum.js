document.getElementById('btnSubmit').addEventListener('click', function () {
    const title = document.getElementById('txtTitle').value.trim();
    const content = document.getElementById('txtContent').value.trim();

    if (title && content) {
        const postItem = document.createElement('div');
        postItem.classList.add('post-item');
        postItem.innerHTML = `
                    <h3>${title}</h3>
                    <p>${content}</p>
                    <small>Posted by User on ${new Date().toLocaleString()}</small>
                `;

        document.getElementById('postsList').prepend(postItem);

        // Clear the form fields
        document.getElementById('txtTitle').value = '';
        document.getElementById('txtContent').value = '';
    }
});