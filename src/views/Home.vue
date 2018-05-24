<template>
  <div class="home" id="atmatrix">
    <div class="design" v-if="env === 'development'">
      <!-- <img src="@/assets/images/design.jpg" alt=""> -->
    </div>

    <!-- navigation -->
    <Nav class="navigation" />

    <!-- header -->
    <section class="header">
      <div class="content">
        <div class="text-wrapper">
          <p class="title">{{ $t("header.col1") }}</p>
          <p class="title">{{ $t("header.col2") }}</p>
          <p class="des">{{ $t("header.describle") }}</p>
          <p class="details">{{ $t("header.details") }}</p>
          <div class="btn">
            <a href="#contact">{{ $t("header.btnText") }}</a>
          </div>
        </div>
        <div class="img-wrapper">
          <img :src="insets.inset0" alt="">
        </div>
      </div>
    </section>

    <!-- solutions -->
    <section id="solutions" class="solutions">
      <div class="content">
        <div class="cube top-left"></div>
        <div class="cube bottom-right"></div>
        <div class="bg-shadow wide"></div>
        <div class="bg-shadow narrow"></div>

        <h1>{{ solutions.title }}</h1>
        <section 
          v-for="(content, index) in solutionsContent"
          :key="index"
        >
          <div class="box-title">
            <h2>{{ common[ index === 0 ? 'blockchain' : 'ai'] }}</h2>
          </div>
          <div class="box-wrapper">
            <div 
              v-for="box in content"
              :key="box.title"
              class="box"
            >
              <div class="bulb">
                <img :src="insets.light1" alt="">
              </div>
              <div>
                <h3>{{ box.title }}</h3>
                <p>{{ box.content }}</p>
              </div>
            </div>
          </div>
        </section>
        <div class="inset">
          <img :src="insets.inset1" alt="">
        </div>
      </div>
    </section>

    <!-- benefits -->
    <section id="benefits" class="benefits">
      <div class="content">
        <h1>{{ benefits.title }}</h1>
        <section 
          v-for="(content, index) in benefitsContent"
          :key="index"
        >
          <div class="box-title">
            <h2>{{ common[ index === 0 ? 'blockchain' : 'ai'] }}</h2>
          </div>
          <div class="box-wrapper">
            <div 
              v-for="box in content"
              :key="box.title"
              class="box"
            >
              <div class="bulb">
                <img :src="insets.light2" alt="">
              </div>
              <div>
                <h3>{{ box.title }}</h3>
                <p>{{ box.content }}</p>
              </div>
            </div>
          </div>
        </section>
        <div class="inset">
          <img :src="insets.inset2" alt="">
        </div>
      </div>
    </section>

    <!-- user cases -->
    <section id="usecases" class="case">
      <div class="content">
        <div class="cube top-right"></div>
        <div class="cube bottom-left"></div>
        <div class="bg-shadow wide"></div>
        <div class="bg-shadow narrow"></div>

        <h1>{{ cases.title }}</h1>
        <div 
          class="containor" 
          v-for="(content, index) in casesContent"
          :key="index"
        >
          <div class="box-title">
            <h2>{{ common[ index === 0 ? 'blockchain' : 'ai'] }}</h2>
          </div>
          <div class="box-wrapper">
            <div 
              class="box" 
              :class="{ ai: index === 1 }"
              v-for="(box, idx) in content" 
              :key="box.title"
            >
              <h3>{{ box.title }}</h3>
              <p v-for="(t, i) in box.content" :key="i">
                {{ t }}
              </p>
              
              <div 
                v-if="index === 0"
                class="sexangle left"
                :class="{
                  top: idx % 2 === 0,
                  bottom: idx % 2 !== 0,
                  green: idx === 0,
                  blue: idx === 1,
                  orange: idx === 2,
                  yellow: idx === 3,
                }"
              ></div>
              <template v-else>
                <div class="sexangle toleft green"></div>
                <div class="sexangle toright blue"></div>
              </template>

            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- img division -->
    <section id="division" class="division">
      <img :src="insets.inset3" alt="">
    </section>

    <!-- team -->
    <section id="team" class="team">
      <div class="content">
        <div class="bg-shadow wide"></div>
        <div class="bg-shadow narrow"></div>

        <h1>{{ team.title }}</h1>
        <div 
          class="containor"
          v-for="(c, i) in teamContent"
          :key="i"
        >
          <div class="box-title">
            <h2 v-if="i === 1">{{ team.adviser }}</h2>
          </div>
          <div class="box-wrapper">
            <div class="box" v-for="p in c" :key="p.key">
              <div class="avatar">
                <img :src="avatars[p.key]" alt="">
              </div>
              <h3>{{ p.name }}</h3>
              <div class="position" v-if="p.position">
                <label>{{ p.position }}</label>
              </div>
              <p>{{ p.des }}</p>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- contact -->
    <section id="contact" class="contact">
      <div class="content">
        <div class="contact-form">
          <h1>{{ `${ contact.contact } ${ contact.form }` }}</h1>
          <form 
            ref="contactForm"
            method="POST"
            :action="postUrl"
            enctype="application/x-www-form-urlencoded"
          >
            <div class="input-wrapper">
              <input name="name" type="text" :placeholder="contact.name" v-model="name">
            </div>
            <div class="input-wrapper">
              <input name="email" type="email" :placeholder="contact.mail" v-model="email">
            </div>
            <div class="input-wrapper">
              <input name="phone" type="text" :placeholder="contact.theme" v-model="telephone">
            </div>

            <div class="input-wrapper">
              <textarea 
                rows="5"
                name="message"
                :placeholder="contact.message"
                v-model="message"
              ></textarea>
            </div>

            <div class="submit">
              <input type="hidden" name="hs_context" :value="hs_context">
              <button type="submit">{{ contact.submit }}</button>
            </div>
          </form>
        </div>
        <div class="line"></div>
        <div class="keep-updated">
          <h1>{{ `${ subscribe.keep } ${ subscribe.updated }` }}</h1>
            <form 
              ref="form"
              :action="actionUrl"
              method="post" 
              target="_blank"
              class="wrapper"
            >
              <input
                v-model="subscribeEmail"
                type="email" 
                name="EMAIL" 
                :placeholder="subscribe.email">
              <a @click="subscribeHandle">{{ subscribe.subscrible }}</a>
            </form>
            <p class="tips">{{ subscribe.tips }}</p>
            <ul>
              <li 
                v-for="item in icons"
                :key="item.key"
              >
                <a v-if="item.key === 'mail'" :href="`mailto:${ item.link }`" target="_blank">
                  <span :class="`icon-${ item.key }`"></span>
                  <p>{{ item.show }}</p>
                </a>
                <a v-else-if="item.link" :href="item.link" target="_blank">
                  <span :class="`icon-${ item.key }`"></span>
                  <p>{{ item.show }}</p>
                </a>
                <div 
                  v-else 
                  class="icon-item" 
                  @click="item.key === 'wechat' && (qrShow = !qrShow)"
                >
                  <div 
                    class="qr-wrapper" 
                    :class="{ show: item.key === 'wechat' && qrShow }">
                    <img src="@/assets/images/qr.jpeg" alt="">
                  </div>
                  <span :class="`icon-${ item.key }`"></span>
                  <p>{{ item.show }}</p>
                </div>
              </li>
            </ul>
        </div>
      </div>
      <div class="foot">
        <span>Copyright © {{ new Date().getFullYear() }}</span>
      </div>
    </section>
  </div>
</template>

<script>
import { verifyMail } from "@/utils/util";
import axios from 'axios';

import Nav from "@/components/Nav.vue";

import inset0 from "@/assets/images/inset-0.png";
import inset1 from "@/assets/images/inset-1.png";
import inset2 from "@/assets/images/inset-2.png";
import inset3 from "@/assets/images/inset-3.png";
import light1 from "@/assets/images/light-1.png";
import light2 from "@/assets/images/light-2.png";

import ceo from "@/assets/images/avatars/ceo.jpg";
import cto from "@/assets/images/avatars/cto.jpg";
import csa from "@/assets/images/avatars/csa.jpg";
import ced from "@/assets/images/avatars/ced.jpg";
import meinahong from "@/assets/images/avatars/meinahong.jpg";
import zhupp from "@/assets/images/avatars/zhupp.jpg";
import huang from "@/assets/images/avatars/huang.jpg";
import ganzx from "@/assets/images/avatars/ganzx.png";
import guxf from "@/assets/images/avatars/guxf.png";

const getIcons = locale => [
  {
    key: "github",
    show: "Github",
    link: "https://github.com/ATMatrix"
  },
  // {
  //   key: "telegram",
  //   show: "Telegram",
  //   link:
  //     locale === "en"
  //       ? "https://t.me/ATN_Blockchain_EN"
  //       : "https://t.me/ATN_Blockchain"
  // },
  {
    key: "wechat",
    show: "ATMatrix"
  },
  // {
  //   key: "qq",
  //   show: "652509213"
  // },
  {
    key: "mail",
    show: "Email",
    link: "contact@atmatrix.org"
  }
];

export default {
  components: {
    Nav,
  },
  data() {
    return {
      env: process.env.NODE_ENV,
      insets: { inset0, inset1, inset2, inset3, light1, light2 },
      avatars: { ceo, cto, csa, ced, meinahong, zhupp, huang, ganzx, guxf },
      subscribeEmail: "",
      name: "",
      email: "",
      telephone: "",
      message: "",
      qrShow: false,
      zhFormId: '341c26d0-99e6-4014-b8f9-d0574b3ed144',
      enFormId: '0cb790aa-cb23-4985-bb59-bf603f4dd7a9',
      portalId: '4124422',
      hs_context: JSON.stringify({
          "redirectUrl": location.origin + '/thanks',    
      }),
    };
  },
  computed: {
    common() {
      return this.$t("common");
    },
    locale () {
      return this.$i18n.locale;
    },
    actionUrl() {
      const baseUrl =
        "//atmatrix.us16.list-manage.com/subscribe/post?u=891cb58e64f257626680a69d3&amp;id=";

      return `${baseUrl}${
        this.$i18n.locale === "zh" ? "65e18a5191" : "8aeeaa67e5"
      }`;
    },
    postUrl () {
      const url = `https://forms.hubspot.com/uploads/form/v2/${ this.portalId }`;
      const hs_context = {
          "redirectUrl": location.host + '/thanks',    
      }   
      
      return `${ url }/${ this.locale === 'en' ? this.enFormId : this.zhFormId}`;
    },
    solutions() {
      return this.$t("solutions");
    },
    solutionsContent() {
      return [this.solutions.blockchain, this.solutions.ai];
    },
    benefits() {
      return this.$t("benefits");
    },
    benefitsContent() {
      return [this.benefits.b, this.benefits.a];
    },
    cases() {
      return this.$t("cases");
    },
    casesContent() {
      return [this.cases.b, this.cases.a];
    },
    team() {
      return this.$t("team");
    },
    teamContent() {
      return [this.team.t, this.team.a];
    },
    contact() {
      return this.$t("contact");
    },
    subscribe() {
      return this.$t("subscribe");
    },
    icons() {
      return getIcons(this.$i18n.locale);
    }
  },
  methods: {
    subscribeHandle() {
      if (!verifyMail(this.subscribeEmail)) {
        alert(this.$t("errMsg.notMail"));
        return;
      }

      this.$refs.form.submit();
    },
    _submit () {
      this.$refs.contactForm.submit(e => this.onSubmit(e));
    },
    onSubmit(e) {
      axios.post(this.postUrl, {
        firstname: this.name,
        email: this.email,
        phone: this.telephone,
        message: this.message
      }, {
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      }).then(res => {
        console.log(res)
      }).catch(err => {
        console.log(err)
      })
    }
  },
};
</script>


<style lang="less" scoped>
@import "../assets/style/style.less";
@import "../assets/style/style_1640px.less";
@import "../assets/style/style_1200px.less";
@import "../assets/style/style_992px.less";
@import "../assets/style/style_768px.less";
@import "../assets/style/style_540px.less";
</style>
