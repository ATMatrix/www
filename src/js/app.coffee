console.log "hello world"

clearTyper = ->
  $('#inSlider').slideUp();
  # $('#about').addClass('m-t-lg');

startTyper = ->
  $('.typewrite').each (i, elem) ->
    toRotate = $(elem).data('type')
    period = $(elem).data('period')

    try
      data = JSON.parse(toRotate)
    catch e
      data = toRotate

    if toRotate
      $(elem).data 'instance', (new TxtType elem, data, period, clearTyper)

  # continue arrow
  $('#continue').on 'click', ->
    $('.typewrite').each (i, elem) ->
      $(elem).data('instance').destroy()



drawAllowcationChart = (locale = "zh-CN") ->
  data =
    datasets: [
      data: [30,15,5,30,20],
      backgroundColor: ["#FFE8C6", "#4F2F1B", "#6A3E23","#3B2820","#D0A081"],
      label: ["My Radar chart"]
    ],
    labels: if locale == "en" then [ " ICO 1st", " Business Development", " Academic Research", " ICO 2nd", " Angels & Team"] else [" 一期ICO"," 商业落地部署"," 学术研究"," 二期ICO"," 天使投资人、团队"
    ]

  options =
    segmentStrokeWidth: 2,
    responsive: true

  if document.getElementById("allocationChart")
    ctx3 = document.getElementById("allocationChart").getContext("2d");
    new Chart(ctx3, {type: 'pie', data: data, options: options});

window.set_locale = (locale) ->
  if locale == 'en'
    window.location.href= 'http://atmatrix.org/en.html';
  else
    window.location.href= 'http://atmatrix.org/';



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

initIaccept = ->
  if $('#iaccept')
    $('#iaccept').on 'click', ->
      if $('#iaccept:checked').length > 0
        $('#goIco').removeClass('disabled')
      else
        $('#goIco').addClass('disabled')

initCheckBalance = ->
  if $('#check-balance')
    $('#check-balance').on 'submit', ->
      addr = $('#ethAddress').val()

      if !!addr
        $('#check-balance').attr 'action', "//etherscan.io/address/#{addr}#tokentxns"
      else
        return false

checkICOStatus = ->
  if $('.ico-status') and Date.now() > 1503057600000
    $('.ico-status.coming').hide();
    $('.ico-status.progress').show();
    $('.ico-status.finished').hide();
  else
    $('.ico-status.coming').show();
    $('.ico-status.progress').hide();
    $('.ico-status.finished').hide();

# typer
startTyper()

# wow
new WOW().init()

drawAllowcationChart(lang)

initIaccept()
initCheckBalance()
checkICOStatus()

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