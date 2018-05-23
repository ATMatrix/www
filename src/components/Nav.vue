<template>
  <nav>
    <!-- 大屏 -->
    <div class="nav-containor">
      <div class="logo">
        <img :src="logo" alt="">
      </div>
      <ul class="nav-list">
        <template v-for="(nav, idx) in navs">
          <li 
            :key="nav"
            :class="{ active: activeNav === idx }"
            @click="gotoAnchor(idx)"
          >
            <a :href="`#${ nav.toLowerCase() }`">
              {{ $t(`nav.${ nav }`).toUpperCase() }}
            </a>
          </li>
        </template>
        <li @click="languageLayerShow = !languageLayerShow">
          <span>{{ languageSelected }}</span>
          <ul 
            class="language-select-layer"
            v-show="languageLayerShow">
            <li @click="changeLanguage('zh')">中文</li>
            <li @click="changeLanguage('en')">ENGLISH</li>
          </ul>
        </li>
        <i class="slide-bar" :style="{ transform: `translate3d(${ activeNav * 88}px, 0, 0)` }"></i>
      </ul>
    </div>

    <!-- 小屏 -->
    <div class="menu-containor">
      <div class="bar">
        <div class="logo">
          <img :src="logo" alt="">
        </div>
        <div class="icon">
          <span class="icon-menu" @click="menuShow = true"></span>
        </div>
      </div>
      <transition name="fade">
        <div class="menu-layer" v-show="menuShow">
          <div 
            class="cover"
            v-on:touchmove.prevent 
            @click="menuShow = false"></div>
          <transition name="slide">
            <div class="menu" v-show="menuShow">
              <div class="containor">
                <div class="menu-cover" v-on:touchmove.prevent></div>
                <div class="menu-bar">
                  <img :src="logo" alt="">
                </div>
                <ul class="menu-list">
                  <template v-for="(nav, idx) in navs">
                    <li 
                      :key="nav"
                      :class="{ touch: idx === touchIndex }"
                      v-on:touchstart="touchIndex = idx"
                      v-on:touchend="touchIndex = -1"
                      v-on:touchcancel="touchIndex = -1"
                      @click="closeMenu"
                    >
                      <a :href="`#${ nav.toLowerCase() }`">
                        {{ $t(`nav.${ nav }`).toUpperCase() }}
                      </a>
                    </li>
                  </template>
                  <li 
                    @click="changeLanguage('zh')"
                    :class="{ touch: 5 === touchIndex }"
                    v-on:touchstart="touchIndex = 5"
                    v-on:touchend="touchIndex = -1"
                    v-on:touchcancel="touchIndex = -1">中文</li>
                  <li 
                    @click="changeLanguage('en')"
                    :class="{ touch: 6 === touchIndex }"
                    v-on:touchstart="touchIndex = 6"
                    v-on:touchend="touchIndex = -1"
                    v-on:touchcancel="touchIndex = -1">ENGLISH</li>
                </ul>
              </div>
              <footer>
                <span>Copyright © {{ new Date().getFullYear() }}</span>
              </footer>
            </div>
          </transition>
        </div>
      </transition>
    </div>
  </nav>
</template>

<script>
// import { isMobile } from "@/utils/util.js";

import logo from "@/assets/images/logo.png";

const navs = ["Atmatrix", "Solutions", "Benefits", "Usecases", "Team"];

export default {
  name: "Nav",
  data() {
    return {
      navs,
      logo,
      activeNav: 0,
      touchIndex: -1,
      scrollTop: "",
      marginTop: "47px",
      menuShow: false,
      languageLayerShow: false
    };
  },
  computed: {
    languageSelected() {
      return this.$i18n.locale === "en" ? "ENGLISH" : "中文";
    }
  },
  mounted() {
    // if (!isMobile()) {
    //   this.scrollTop = document.querySelector('.header').getBoundingClientRect().height;
    //   window.addEventListener('scroll', this.scrollHandle);
    // }
  },
  methods: {
    scrollHandle(e) {
      if (this.scrollTop <= e.target.documentElement.scrollTop) {
        this.marginTop = "0";
      } else if (e.target.documentElement.scrollTop === 0) {
        this.marginTop = "47px";
      }
    },
    gotoAnchor(index) {
      this.activeNav = index;
    },
    closeMenu() {
      this.menuShow = false;
    },
    changeLanguage(locale) {
      this.$i18n.locale = locale;
      this.closeMenu();
    }
  }
};
</script>

<style lang="less" scoped>
@import "../assets/style/theme.less";

@font_color_white: #ffffff;
@font_color_blue: #02cbff;

.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.3s;
}
.fade-enter, .fade-leave-to /* .fade-leave-active below version 2.1.8 */ {
  opacity: 0;
}

.slide-enter-active,
.slide-leave-active {
  transform: translate3d(0, 0, 0);
  transition: all 0.3s cubic-bezier(0.4, 0, 0, 1);
}
.slide-enter, .slide-leave-to /* .fade-leave-active below version 2.1.8 */ {
  transform: translate3d(-100%, 0, 0);
}

nav {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  z-index: 9999;
  background: linear-gradient(90deg, #02c9ff 0, #4ab4fd 50%, #4ab4fd 100%);

  .nav-containor {
    max-width: 1640px;
    height: 80px;
    margin: 0 auto;
    padding: 0 184px;
    box-sizing: border-box;
    display: flex;
    align-items: center;
    justify-content: space-between;
    transition: all 0.4s cubic-bezier(0.4, 0, 0, 1);

    .nav-list {
      height: 100%;
      margin: 0;
      padding-left: 32px;
      display: flex;
      justify-content: space-around;
      position: relative;

      .active {
        font-weight: 600;
      }

      li {
        cursor: pointer;
      }

      & > li {
        height: 100%;
        width: 88px;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 12px;
        color: @font_color_white;
        transition: all 0.3s cubic-bezier(0.4, 0, 0, 1);

        a {
          display: flex;
          align-items: center;
          justify-content: center;
          width: 100%;
          height: 100%;
          font-size: 12px;
          color: @font_color_white;
          cursor: pointer;
        }

        &:last-of-type {
          position: relative;
        }
      }

      .language-select-layer {
        width: 100%;
        padding-left: 0;
        margin: 0;
        position: absolute;
        left: 0;
        top: 56px;
        background: @font_color_white;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);

        li {
          width: 100%;
          height: 36px;
          display: flex;
          align-items: center;
          justify-content: center;
          color: @font_color_blue;
          border-bottom: 1px solid @font_color_blue;

          &:last-of-type {
            border: none;
          }
        }
      }

      .slide-bar {
        display: block;
        position: absolute;
        left: 32px;
        bottom: 1px;
        width: 88px;
        height: 4px;
        background: @font_color_white;
        border-radius: 2px;
        transition: all 0.3s cubic-bezier(0.4, 0, 0, 1);
      }
    }
  }

  .menu-containor {
    display: none;
  }
}

@media screen and (max-width: 1640px) {
  nav {
    .nav-containor {
      padding: 0 10vw;
    }
  }
}

@media screen and (max-width: 1640px) {
  nav {
    .nav-containor {
      padding: 0 8vw;
    }
  }
}

@media screen and (max-width: 992px) {
  nav {
    .nav-containor {
      padding: 0 5vw;
    }
  }
}

@media screen and (max-width: 768px) {
  nav {
    .nav-containor {
      height: 72px;
      padding: 0 2vw;
    }
  }
}

@media screen and (max-width: 540px) {
  nav {
    .nav-containor {
      display: none;
    }

    .menu-containor {
      width: 100%;
      height: 48px;
      display: block;

      .bar {
        height: 100%;
        display: flex;
        align-items: center;
        justify-content: space-between;

        .logo {
          padding-left: 2vw;

          img {
            width: 100%;
            height: 100%;
            transform: scale3d(0.8, 0.8, 1);
          }
        }

        .icon {
          height: 100%;
          padding: 0 2vw;
          display: flex;
          align-items: center;

          span {
            font-size: 32px;
          }
        }
      }

      .menu-layer {
        width: 100%;
        height: 100%;
        position: fixed;
        top: 0;
        bottom: 0;

        .cover {
          width: 100%;
          height: 100%;
          position: absolute;
          top: 0;
          bottom: 0;
          background: rgba(25, 25, 25, 0.8);
        }

        .menu {
          width: 62%;
          position: absolute;
          top: 0;
          bottom: 0;
          background: @font_color_white;
          box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
          transition: all 0.4s cubic-bezier(0.4, 0, 0, 1);
          display: flex;
          flex-direction: column;
          justify-content: space-between;

          .menu-cover {
            position: absolute;
            top: 0;
            right: 0;
            width: 100%;
            height: 100%;
            background: transparent;
          }

          .containor {
            .menu-bar {
              width: 100%;
              height: 48px;
              position: relative;
              text-align: center;
              background: linear-gradient(
                90deg,
                #02c9ff 0,
                #4ab4fd 50%,
                #4ab4fd 100%
              );

              img {
                height: 100%;
                transform: scale3d(0.8, 0.8, 1);
              }
            }

            .menu-list {
              padding-left: 0;
              margin: 0;
              position: relative;

              .touch {
                background: linear-gradient(
                  90deg,
                  #02c9ff 0,
                  #4ab4fd 50%,
                  #4ab4fd 100%
                );
                color: @font_color_white!important;
              }

              li {
                height: 48px;
                display: flex;
                align-items: center;
                justify-content: center;
                border-bottom: 1px solid rgba(173, 173, 173, 0.1);
                background: transparent;
                color: @font_color_black;
                user-select: none;

                a {
                  width: 100%;
                  height: 100%;
                  display: flex;
                  align-items: center;
                  justify-content: center;
                  color: @font_color_black;
                }
              }
            }
          }

          footer {
            padding: 10px 0;
            text-align: center;

            span {
              font-size: 12px;
              color: @font_color_light_gray;
            }
          }
        }
      }
    }
  }
}
</style>
