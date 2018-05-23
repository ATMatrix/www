import Vue from "vue";
import App from "./App.vue";
import router from "./router";
import VueI18n from "vue-i18n";

import "normalize.css";
import "./assets/style/base.less";
import "./assets/iconfont/style.css";

import zh from "./i18n/zh";
import en from "./i18n/en";

const env = process.env.NODE_ENV;

Vue.config.productionTip = env === "development" ? false : true;
Vue.use(VueI18n);

// "en"、"en-US"、"fr"、"es-ES"、"zh-cn"、"zh-CN"
const browserLanguage = (
  navigator.language || navigator.browserLanguage
).toLowerCase();
const i18n = new VueI18n({
  locale:
    env !== "development" && browserLanguage.indexOf("zh") > -1 ? "zh" : "en",
  messages: { zh, en }
});

new Vue({
  router,
  i18n,
  render: h => h(App)
}).$mount("#app");
