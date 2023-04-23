/*jshint new: true */
/*global $, jQuery, document, window, navigator, GMaps, google*/
/* ==========================================================================
Document Ready Function
========================================================================== */
jQuery(document).ready(function () {

    'use strict';
    var onMobile, revapi, formInput, sformInput, map;
    /* ==========================================================================
    ScrollTo
    ========================================================================== */
    $('a.scrollto').click(function (event) {
        $('html, body').scrollTo(this.hash, this.hash, {gap: {y: -60}, animation:  {easing: 'easeInOutCubic', duration: 1700}});
        event.preventDefault();

        if ($('.navbar-collapse').hasClass('in')) {
			$('.navbar-collapse').removeClass('in').addClass('collapse');
		}

	});
    /* ==========================================================================
    Data Spy
    ========================================================================== */
    $('body').attr('data-spy', 'scroll').attr('data-target', '#nav-wrapper').attr('data-offset', '61');
    /* ==========================================================================
    ToolTip
    ========================================================================== */
    $("a[data-rel=tooltip]").tooltip();
    /* ==========================================================================
    Revolution Slider
    ========================================================================== */
    revapi = jQuery('.tp-banner').revolution({
        delay: 9000,
        startwidth: 1170,
        startheight: 500,
        hideThumbs: 10,
        fullWidth: "on",
        forceFullWidth: "on",
        lazyload: "on",
        navigationStyle: "none"
    });


    /* ==========================================================================
    on mobile?
    ========================================================================== */
	onMobile = false;
    if (/Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent)) { onMobile = true; }

    if (onMobile === true) {
        $("a[data-rel=tooltip]").tooltip('destroy');
        jQuery('#intro-section').css("background-attachment", "scroll");
    }

    if (onMobile === false) {
        /* ==========================================================================
        Parallex
        ========================================================================== */
        jQuery('#intro-section').parallax("50%", -0.4);
    }


    /* ==========================================================================
    Count To
    ========================================================================== */
    $("#counters-section [data-to]").each(function () {
        var $this = $(this);
        $this.waypoint(function () {
            $this.countTo({speed: 3000});
        }, {offset: '100%', triggerOnce: true});
    });


    /* ==========================================================================
    Fancy Box
    ========================================================================== */
    $(".fancybox").fancybox({
        helpers : {
            overlay : {
                speedOut : 0,
                locked: false
            }
        }
    });

    $(".fancybox-media").fancybox({
        helpers : {
            media : {},
            overlay : {
                speedOut : 0,
                locked: false
            }
        }
    });


    /* ==========================================================================
    Clients Slider
    ========================================================================== */
    $('#owl-clients').owlCarousel({
        items : 6,
        itemsDesktop : [1000, 5],
        itemsDesktopSmall : [768, 4],
        itemsTablet: [520, 2],
        itemsMobile: [320, 2],
        lazyLoad : true,
        pagination: false,
        autoPlay: 5000
    });


    /* ==========================================================================
    Skill Chart
    ========================================================================== */
    $('.skill-chart-lg').waypoint(function () {
        $(".skill-chart-lg").knob({
            readOnly: true,
            fgColor: "#ffffff",
            bgColor: "rgba(255, 255, 255, 0.5)",
            thickness: 0.2,
            width: "190",
            height: "190"
        });
        $('.skill-chart-lg').each(function () {
            var $this, myVal;
            $this = $(this);
            myVal = $this.attr("data-rel");
            $({
                value: 0
            }).animate({
                value: myVal
            }, {
                duration: 3000,
                easing: 'swing',
                step: function () {
                    $this.val(Math.ceil(this.value)).trigger('change');
                }
            });
        });
    }, { offset: '100%', triggerOnce: true });

    $('.skill-chart').waypoint(function () {
        $(".skill-chart").knob({
            readOnly: true,
            fgColor: "#ffffff",
            bgColor: "rgba(255, 255, 255, 0.5)",
            thickness: 0.2,
            width: "160",
            height: "160"
        });
        $('.skill-chart').each(function () {
            var $this, myVal;
            $this = $(this);
            myVal = $this.attr("data-rel");
            $({
                value: 0
            }).animate({
                value: myVal
            }, {
                duration: 3000,
                easing: 'swing',
                step: function () {
                    $this.val(Math.ceil(this.value)).trigger('change');
                }
            });
        });
    }, { offset: '100%', triggerOnce: true });



    /* ==========================================================================
    Map
    ========================================================================== */
    /*map = new GMaps({
        el: '#map',
        scrollwheel: false,
        lat: 29.983775,
        lng: 31.167161
    });
    map.addMarker({
        lat: 29.983775,
        lng: 31.167161,
        icon: "images/marker.png"
    });*/


    /* ==========================================================================
    Subscribe
    ========================================================================== */
    $('form#sform').submit(function () {
        $('form#sform .serror').remove();
        $('form#sform .ssuccess').remove();
        var shasError = false;
        $('.srequiredField').each(function () {
            if (jQuery.trim($(this).val()) === '') {
                $(this).parent().append('<span class="serror"><i class="fa fa-exclamation-triangle"></i></span>');
                shasError = true;
            } else if ($(this).hasClass('email')) {
                var emailReg = /^([\w-\.]+@([\w]+\.)+[\w]{2,4})?$/;
                if (!emailReg.test(jQuery.trim($(this).val()))) {
                    $(this).parent().append('<span class="serror"><i class="fa fa-exclamation-triangle"></i></span>');
                    shasError = true;
                }
            }
        });
        if (!shasError) {
            sformInput = $(this).serialize();
            $.post($(this).attr('action'), sformInput, function (data) {
                $('form#sform').append('<span class="ssuccess"><i class="fa fa-check"></i></span>');
            });
            $('.srequiredField').val('');
        }
        return false;
    });
    $('form#sform input').focus(function () {
        $('form#sform .serror').remove();
        $('form#sform .ssuccess').remove();
    });

    /***============================================
     * 
     * @type login form
     */
    $("#loginform").validate({
        rules : {
        cedula : {
        required : true
        },
        password : {
        required : true
        }
        },
        messages : {
        cedula : {
        required : 'Requerido!'
        },
        password : {
        required : 'Requerido!'
        }
        },
        submitHandler: function(form) {
        $.ajax({
        type: 'POST',
        url: 'login.php',
        dataType: 'json',
        resetForm: true,
        data: $(form).serialize(),
        beforeSend: function() {
            $("#loginform").find("button").button('loading');
            $("#resultado").removeClass('alert alert-danger');
            $('#resultado').hide();
            }
        })
        .done(function(response) {
        console.log(response);
        if (response.suceed) {
            $("#resultado").removeClass('alert alert-danger');
            $("#resultado").addClass('alert alert-success');
            $("#resultado").html("<strong>Listo! Ha sido identificado con éxito,</strong><br>espere unos segundos....");
            window.location = 'enlinea/';
            //$('#loginform')[0].reset();
        } else {
            $("#resultado").removeClass('alert alert-success');
            $("#resultado").addClass('alert alert-danger');
        }
            $("#resultado").text(response.mensaje);
            $('#resultado').slideDown('fast');
        })
        .fail(function(data) {
        $("#resultado").removeClass('alert alert-success');
        $("#resultado").addClass('alert alert-danger');
        $("#resultado").html("<strong>Ups! Ha ocurrido un error.</strong><br>Si el problema persiste póngase en contacto a través de nuestros números telefónicos.");
        $('#resultado').slideDown('fast');
        $("#loginform").find("button").button('reset');
        })
        .complete(function() {
        $("#loginform").find("button").button('reset');
        });
        },
        errorPlacement : function(error, element) {
        error.insertAfter(element);
        }
        });

}); // JavaScript Document

/* ==========================================================================
Window Load
========================================================================== */
jQuery(window).load(function () {
    'use strict';
    var $portfolioitems;
    /* ==========================================================================
    Portfolio Grid
    ========================================================================== */
    $portfolioitems = $('.portfolio-grid');
    $portfolioitems.isotope({
        filter: '*',
        animationOptions: {
            duration: 850,
            easing: 'linear',
            queue: false
        }
    });

    $('.portfolioFilter a').click(function () {
        $('.portfolioFilter a').removeClass('selected');
        $(this).addClass('selected');
        var selector = $(this).attr('data-filter');
        $portfolioitems.isotope({
            filter: selector,
            animationOptions: {
                duration: 850,
                easing: 'linear',
                queue: false
            }
        });
        return false;
    });



});

/* ==========================================================================
Window Scroll
========================================================================== */
jQuery(window).scroll(function () {
    'use strict';
    if (jQuery(document).scrollTop() >= 130) {
        jQuery('#nav-wrapper').addClass('tinyheader');
    } else {
        jQuery('#nav-wrapper').removeClass('tinyheader');
    }
    if (jQuery(document).scrollTop() >= 35) {
        jQuery('#nav-wrapper').addClass('tiny');
        jQuery('#top-header').addClass('hide-top-header');
    } else {
        jQuery('#nav-wrapper').removeClass('tiny');
        jQuery('#top-header').removeClass('hide-top-header');
    }
});