import "./application"
import "../src/home"

const btnMenu = document.querySelector('.btn-menu');
const navbarNav = document.querySelector('.navbar-nav');

btnMenu.addEventListener('click', () => {
    btnMenu.classList.toggle('opened');
    navbarNav.classList.toggle('opened');
});