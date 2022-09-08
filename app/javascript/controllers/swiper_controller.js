// Connects to data-controller="swiper"
import Carousel from 'stimulus-carousel'

export default class extends Carousel {
  // You can set default options in this getter.
  get defaultOptions() {
    return {
      loop: true,
      loopAdditionSlides: 2,
      on: {
        init: function(e) {
          this.commence = true;
        },
        slidePrevTransitionEnd: function (e) {
          let activeIndex = e.activeIndex;
          let slidesLen = e.slides.length;
          if (e.params.loop) {
            switch (e.activeIndex) {
              case 0:
                activeIndex = slidesLen - 3;
                break;
              case slidesLen - 1:
                activeIndex = 0;
                break;
              default:
                --activeIndex;
            }
          }

          const activeSlide = e.slides[e.previousIndex]
          const agreeButton = activeSlide.querySelector(".agree")
          const csrfToken = document.querySelector("[name='csrf-token']").content
          fetch(agreeButton.href, {
            headers: {Accept: "application/json", "X-CSRF-Token": csrfToken},
            method: "POST",
          })

          if (e.isBeginning) {
            e.removeSlide(e.previousIndex - 1);
            e.slideTo(activeIndex, 10, false);
          } else {
            e.removeSlide(e.realIndex + 1);
          }
          e.updateSlides();
        },

        slideNextTransitionEnd: function (e) {
          if(this.commence === undefined) {
            return;
          }

          const amount = e.slides.length - e.loopedSlides * 2;
          let activeIndex = e.activeIndex;
          let slidesLen = e.slides.length;
          if (e.params.loop) {
            switch (e.activeIndex) {
              case 0:
                activeIndex = slidesLen - 3;
                break;
              case slidesLen - 1:
                activeIndex = 0;
                break;
              default:
                --activeIndex;
            }
          }

          if (!e.isEnd) {
            e.removeSlide(e.realIndex - 1);
            e.updateSlides();
          }

          if (e.isEnd) {
            e.removeSlide(amount - 1);
            e.updateSlides();
          }

          if (amount === 1) {
            e.removeSlide(0);
            e.updateSlides();
          }
        },
      },
    };
  }
}
