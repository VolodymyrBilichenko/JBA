const CategoryMenu = document.querySelector('.categories__list__head');
const CategoryBody = document.querySelector('.categories__list__body');

CategoryMenu.addEventListener('click', () => {
    CategoryBody.classList.toggle('categories__list__body_active')
})