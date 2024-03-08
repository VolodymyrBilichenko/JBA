const CategoryMenu = document.querySelector('.categories__list__head');
const CategoryBody = document.querySelector('.categories__list__body');

CategoryMenu.addEventListener('click', () => {
    CategoryBody.classList.toggle('categories__list__body_active')
})

// form option

const FromInput = document.getElementById('search-input');
const FormOption = document.querySelector('.form__options');

FromInput.addEventListener('input', () => {
    if (FromInput.value.length > 0) {
        FormOption.classList.add('active')
    } else {
        FormOption.classList.remove('active')
    }
})


// swiper




var swiperWebinars = new Swiper(".our__webinars-slider", {
    slidesPerView: 1,
    spaceBetween: 0,
    centeredSlides: true,
    navigation: {
        nextEl: ".swiper-butt-next",
        prevEl: ".swiper-butt-prev",
    },
    effect: "creative",
    loop: true,
    // mousewheel: {
    //     releaseOnEdges: true,
    // },
    creativeEffect: {
        // limitProgress: 3,
        prev: {
            translate: ['-100%', 100, -800], //([horizontal, vertical, depth])
        },
        next: {
            translate: ['100%', 100, -800], //([horizontal, vertical, depth])
        },
    },
    breakpoints: {
        320: {
            slidesPerView: 1, spaceBetween: 24,
            creativeEffect: {
                // limitProgress: 3,
                prev: {
                    translate: 0, //([horizontal, vertical, depth])
                },
                next: {
                    translate: 0, //([horizontal, vertical, depth])
                },
            }
        },
        768: {
            slidesPerView: 2, spaceBetween: 24,
            creativeEffect: {
                // limitProgress: 3,
                prev: {
                    translate: ['-100%', 100, -800], //([horizontal, vertical, depth])
                },
                next: {
                    translate: ['100%', 100, -800], //([horizontal, vertical, depth])
                },
            }
        }, 992: {
            slidesPerView: 2, spaceBetween: 24,
        }, 1199: {
            slidesPerView: 2,
        },
    }
});