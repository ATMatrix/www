var TxtType = function(el, toRotate, period, onFinished) {
        this.toRotate = toRotate;
        this.el = el;
        this.loopNum = 0;
        this.period = parseInt(period, 10) || 2000;
        this.txt = '';
        this.tick();
        this.isDeleting = false;
        this.it = null;
        this.onFinished = onFinished
    };

    TxtType.prototype.destroy = function(){
      clearInterval(this.it);
      if (this.onFinished)
        this.onFinished()
    }

    TxtType.prototype.tick = function() {
        var i = this.loopNum % this.toRotate.length;
        var fullTxt = this.toRotate[i];

        if (this.isDeleting) {
          this.txt = fullTxt.substring(0, this.txt.length - 1);
        } else {
          this.txt = fullTxt.substring(0, this.txt.length + 1);
        }

        this.el.innerHTML = '<span class="wrap">'+this.txt+'</span>';

        var that = this;
        var delta = 200 - Math.random() * 100;

        if (this.isDeleting) { delta /= 2; }

        if (!this.isDeleting && this.txt === fullTxt) {
          delta = this.period;
          this.isDeleting = true;
        } else if (this.isDeleting && this.txt === '') {
          this.isDeleting = false;
          this.loopNum++;
          delta = 500;
        }

        rotateNum = this.toRotate.length;
        this.it = setTimeout(function() {
          if (that.loopNum >= rotateNum) {
            clearInterval(that.it);
            that.onFinished();
          } else {
            that.tick();
          }

        }, delta);
    };

    window.TxtType = TxtType;