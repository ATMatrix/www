console.log "hello world"

startTyper = ->
  $('.typewrite').each (i, elem) ->
    toRotate = $(elem).data('type')
    period = $(elem).data('period')

    try
      data = JSON.parse(toRotate)
    catch e
      data = toRotate

    if toRotate
      new TxtType elem, data, period

drawAllowcationChart = ->
  data =
    datasets: [
      data: [30,15,5,30,20],
      backgroundColor: ["#FFE8C6", "#4F2F1B", "#6A3E23","#3B2820","#D0A081"],
      label: ["My Radar chart"]
    ],
    labels: [
        " 一期ICO"," 商业落地部署"," 学术研究"," 二期ICO"," 天使投资人、团队"
    ]

  options =
    segmentStrokeWidth: 2,
    responsive: true

  ctx3 = document.getElementById("allocationChart").getContext("2d");
  new Chart(ctx3, {type: 'pie', data: data, options: options});

# init scroll spy
$('body').scrollspy
  target: '.navbar-fixed-top',
  offset: 80

$('a.page-scroll').bind 'click', (event) ->
  link = $(this)

  $('html, body').stop().animate
      scrollTop: $(link.attr('href')).offset().top - 50
  , 500
  event.preventDefault();
  $("#navbar").collapse('hide');


# typer
startTyper()

# wow
new WOW().init()

drawAllowcationChart()

`
var cbpAnimatedHeader = (function() {
        var docElem = document.documentElement,
                header = document.querySelector( '.navbar-default' ),
                didScroll = false,
                changeHeaderOn = 200;
        function init() {
            window.addEventListener( 'scroll', function( event ) {
                if( !didScroll ) {
                    didScroll = true;
                    setTimeout( scrollPage, 250 );
                }
            }, false );
        }
        function scrollPage() {
            var sy = scrollY();
            if ( sy >= changeHeaderOn ) {
                $(header).addClass('navbar-scroll')
            }
            else {
                $(header).removeClass('navbar-scroll')
            }
            didScroll = false;
        }
        function scrollY() {
            return window.pageYOffset || docElem.scrollTop;
        }
        init();

    })();
`