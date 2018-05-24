<template>
  <div class="thanks">
    <h1>Thank You</h1>
    <p>Thank you for contacting ATMatrix. We will get back to you as soon as possible.</p>
    <p>we will return the last page after <span>{{ timeCount }}</span> seconds.</p>
  </div>
</template>

<script>
export default {
  data () {
    return {
      timeCount: 5,
      timer: null,
    }
  },
  mounted () {
    this.init()
  },
  methods: {
    init () {
      this.timer = setInterval(() => {
        this.timeCount--;

        if (this.timeCount === 0) {
          this.$router.go(-1)
        }
      }, 1000)
    }
  },
  beforeDestroy () {
    clearInterval(this.timer);
    this.timer = null;
  }
}
</script>


<style lang="less" scoped>
.thanks {
  padding-top: 200px;

  h1, p {
    text-align: center;
  }

  span {
    font-size: 18px;
    font-weight: 700;
  }
}
</style>
