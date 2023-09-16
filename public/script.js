//nav toggle
let links = document.querySelectorAll(".nav-link");

links.forEach((link) => {
  link.addEventListener("click", () => {
    links.forEach((item) => item.classList.remove("active"));
    link.classList.add("active");
  });
});

let slideIndex = 0;
showSlides();

function showSlides() {
  let slides = document.getElementsByClassName("slide1");
  for (let i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";
  }
  if (slideIndex >= slides.length) {
    slideIndex = 0;
  }
  if (slideIndex < 0) {
    slideIndex = slides.length - 1;
  }
  slides[slideIndex].style.display = "block";
}

// Previous and Next controls
document.querySelector(".prev1").addEventListener("click", () => {
  slideIndex--;
  showSlides();
});

document.querySelector(".next1").addEventListener("click", () => {
  slideIndex++;
  showSlides();
});

/*SQL SECTION */
let slideIndex2 = 0;
showSlides2();

function showSlides2() {
  let slides = document.getElementsByClassName("slide2");
  for (let i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";
  }
  if (slideIndex2 >= slides.length) {
    slideIndex2 = 0;
  }
  if (slideIndex2 < 0) {
    slideIndex2 = slides.length - 1;
  }
  slides[slideIndex2].style.display = "block";
}

// Previous and Next controls
document.querySelector(".prev2").addEventListener("click", () => {
  slideIndex2--;
  showSlides2();
});

document.querySelector(".next2").addEventListener("click", () => {
  slideIndex2++;
  showSlides2();
});

/*Resources SECTION */
let slideIndex3 = 0;
showSlides3();

function showSlides3() {
  let slides = document.getElementsByClassName("slide3");
  for (let i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";
  }
  if (slideIndex3 >= slides.length) {
    slideIndex3 = 0;
  }
  if (slideIndex3 < 0) {
    slideIndex3 = slides.length - 1;
  }
  slides[slideIndex3].style.display = "block";
}

// Previous and Next controls
document.querySelector(".prev3").addEventListener("click", () => {
  slideIndex3--;
  showSlides3();
});

document.querySelector(".next3").addEventListener("click", () => {
  slideIndex3++;
  showSlides3();
});
