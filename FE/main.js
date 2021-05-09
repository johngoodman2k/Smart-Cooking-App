const showMoreBtn = document.querySelector('.show-more-btn');
const text = document.querySelector('.text');

showMoreBtn.addEventListener('click', (e) => {
    text.classList.toggle('read-more');
})