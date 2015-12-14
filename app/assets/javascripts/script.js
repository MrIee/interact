$(".puzzles.puzzle").ready(function() {

    var rand = function(min, max) {
      return Math.floor(Math.random() * (max - min + 1)) + min;
    }

    var z = 0;
    var canvas = $("#canvas-pieces").position();
    var canvasHeight = $("#canvas-pieces").height();
    var canvasWidth = $("#canvas-pieces").width();
    var randTop, randLeft = 0

    $(".puzzle-piece").load(function() {
        randTop = Math.floor(rand(0, canvasHeight - $(this).height() ) );
        randLeft = Math.floor(canvas.left + rand(canvas.left, canvasWidth - $(this).width() ) );

        $(this).css({
            top: randTop + "px",
            left: randLeft + "px"
        });

        z++;

    });


    var dragMoveListener = function(event) {
        var target = event.target,
            // keep the dragged position in the data-x/data-y attributes
            x = (parseFloat(target.getAttribute('data-x')) || 0) + event.dx,
            y = (parseFloat(target.getAttribute('data-y')) || 0) + event.dy;

        // translate the element
        target.style.transform =
          'translate(' + x + 'px, ' + y + 'px)';

        // update the posiion attributes
        target.setAttribute('data-x', x);
        target.setAttribute('data-y', y);
    }

    interact(".puzzle-piece")
        .draggable({
            inertia: true,
            restrict: {
                restriction: "#canvas",
                elementRect: { top: 0, left: 0, bottom: 1, right: 1 }
            },

            autoScroll: true,
            onmove: dragMoveListener
        });

    // this is used later in the resizing and gesture demos
      window.dragMoveListener = dragMoveListener;

});