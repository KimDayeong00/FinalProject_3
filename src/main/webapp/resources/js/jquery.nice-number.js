(function ($) {
  $.fn.niceNumber = function(options) {
    var settings = $.extend({
      autoSize: true,
      autoSizeBuffer: 1,
      buttonDecrement: '-',
      buttonIncrement: "+",
      buttonPosition: 'around'
    }, options);

    return this.each(function(){
      var currentInput = this,
          $currentInput = $(currentInput),
          attrMax = null,
          attrMin = null,
          plusprice = price;

      // Handle max and min values
      if (
        typeof $currentInput.attr('max') !== typeof undefined
        && $currentInput.attr('max') !== false
      ) {
        attrMax = parseFloat($currentInput.attr('max'));
      }

      if (
        typeof $currentInput.attr('min') !== typeof undefined
        && $currentInput.attr('min') !== false
      ) {
        attrMin = parseFloat($currentInput.attr('min'));
      }

      // Fix issue with initial value being < min
      if (
        attrMin
        && !currentInput.value
      ) {
        $currentInput.val(attrMin);
      }

      // Generate container
      var $inputContainer = $('<div/>',{
          class: 'nice-number'
        })
        .insertAfter(currentInput);

      // Generate interval (object so it is passed by reference)
      var interval = {};
      
      // 추가 금액
      var total = 0;
      var plusprice = 0;
      // Generate buttons
      var $minusButton = $('<button/>')
        .attr('type', 'button')
        .attr('id','minusBtn')
        .css({'background-color':'#f0efe8','border':'none','width':'23px','outline':'0'})
        .html(settings.buttonDecrement)
        .on('mousedown mouseup mouseleave', function(event){
          changeInterval(event.type, interval, function(){
            if (
              attrMin == null
              || attrMin < parseFloat(currentInput.value)
            ) {
              currentInput.value--;//input number 증가
              // 일반견 감소될 때 금액 계산
              total = parseInt($("#plusprice").text());
              plusprice = parseInt($(".basicprice").text());
              total -= plusprice; 
              if(total<0){
            	  total=0;
              }
              $("#plusprice").text(total);
              
            //부가세 계산
              var overprice = 0;
            	  if($("#overpriceSpan").text()!=""){
            		  overprice = parseInt($("#overpriceSpan").text());
            	  }
              var plusprice1 = parseInt($("#plusprice").text());
              var plusprice2 = parseInt($("#plusprice2").text());
              var allprice = parseInt(overprice+plusprice1+plusprice2);
              var tax = parseInt(allprice*0.1);
              $(".tax").text(tax);
              
              //총합계 계산
              var finalprice = allprice+tax;
              $(".totalprice").text(finalprice);
            }
          });

          // Trigger the input event here to avoid event spam
          if (
            event.type == 'mouseup'
            || event.type == 'mouseleave'
          ) {
            $currentInput.trigger('input');
          }
        });

      var $plusButton = $('<button/>')
        .attr('type', 'button')
        .attr('id','plusBtn')
        .css({'background-color':'#f0efe8','border':'none','width':'23px','outline':'0'})
        .html(settings.buttonIncrement)
        .on('mousedown mouseup mouseleave', function(event){
          changeInterval(event.type, interval, function(){
            if (
              attrMax == null
              || attrMax > parseFloat(currentInput.value)
            ) {
              currentInput.value++; //input number 증가
              // 일반견 추가될 때 추가 금액 계산
              total = parseInt($("#plusprice").text());
              plusprice = parseInt($(".basicprice").text());
              total += plusprice; 
              $("#plusprice").text(total);
              
              //부가세 계산
              var overprice = 0;
            	  if($("#overpriceSpan").text()!=""){
            		  overprice = parseInt($("#overpriceSpan").text());
            	  }
              var plusprice1 = parseInt($("#plusprice").text());
              var plusprice2 = parseInt($("#plusprice2").text());
              var allprice = parseInt(overprice+plusprice1+plusprice2);
              var tax = parseInt(allprice*0.1);
              $(".tax").text(tax);
              
              //총합계 계산
              var finalprice = allprice+tax;
              $(".totalprice").text(finalprice);
            }
          });

          // Trigger the input event here to avoid event spam
          if (
            event.type == 'mouseup'
            || event.type == 'mouseleave'
          ) {
            $currentInput.trigger('input');
            
          }
        });

      // Append elements
      switch (settings.buttonPosition) {
        case 'left':
          $minusButton.appendTo($inputContainer);
          $plusButton.appendTo($inputContainer);
          $currentInput.appendTo($inputContainer);
          break;
        case 'right':
          $currentInput.appendTo($inputContainer);
          $minusButton.appendTo($inputContainer);
          $plusButton.appendTo($inputContainer);
          break;
        case 'around':
        default:
          $minusButton.appendTo($inputContainer);
          $currentInput.appendTo($inputContainer);
          $plusButton.appendTo($inputContainer);
          break;
      }

      // Nicely size input
      if (settings.autoSize) {
        $currentInput.width(
          $currentInput.val().length+settings.autoSizeBuffer+"ch"
        );
        $currentInput.on('keyup input',function(){
          $currentInput.animate({
            'width': $currentInput.val().length+settings.autoSizeBuffer+"ch"
          }, 200);
        });
      }
    });
  };

  function changeInterval(eventType, interval, callback) {
    if (eventType == "mousedown") {
      interval.timeout = setTimeout(function(){
        interval.actualInterval = setInterval(function(){
          callback();
        }, 100);
      }, 200);
      callback();
    } else {
      if (interval.timeout) {
        clearTimeout(interval.timeout);
      }
      if (interval.actualInterval) {
        clearInterval(interval.actualInterval);
      }
    }
  }
}(jQuery));
