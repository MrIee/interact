$(".puzzles.test").ready(function() {
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

    interact(".drag-box")
        .draggable({
            inertia: true,
            restrict: {
                restriction: "parent",
                elementRect: { top: 0, left: 0, bottom: 1, right: 1 }
            },

            autoScroll: true,
            onmove: dragMoveListener
        });

    // this is used later in the resizing and gesture demos
      window.dragMoveListener = dragMoveListener;




    interact('.dropzone').dropzone({
    // only accept elements matching this CSS selector
    accept: '.drag-box',
    // Require a 75% element overlap for a drop to be possible
    overlap: 0.5,

    // listen for drop related events:

    ondropactivate: function (event) {
        // add active dropzone feedback
        //event.target.classList.add('drop-active');
    },
    ondragenter: function (event) {
        var draggableElement = event.relatedTarget,
            dropzoneElement = event.target;

        // feedback the possibility of a drop
        dropzoneElement.classList.add('dropzone-bg');
        draggableElement.classList.add('can-drop');
        draggableElement.textContent = 'Dragged in'
    },
    ondragleave: function (event) {
            // remove the drop feedback style
            event.target.classList.remove('dropzone-bg');
            event.relatedTarget.classList.remove('can-drop');
            event.relatedTarget.textContent = 'Dragged out';
    },
    ondrop: function (event) {
        var draggableElement = event.relatedTarget,
            dropzoneElement = event.target;

        draggableElement.textContent = 'Dropped';
        $(draggableElement).css("transform",  $(dropzoneElement).css("transform"));
    },
    ondropdeactivate: function (event) {
        // remove active dropzone feedback
        event.target.classList.remove('drop-active');
        event.target.classList.remove('drop-target');
    }
    });


});