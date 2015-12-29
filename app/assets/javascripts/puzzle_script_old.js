// PuzzlesController.prototype.show = function(){

//     $("#timer").timer({
//         format: "%M:%S"
//     });

//     var createPieces = function(image, size, canvas) {

//         var canvasPos = canvas.position();
//         var canvasHeight = canvas.height();
//         var canvasWidth = canvas.width();
//         var randTop, randLeft = 0;

//         for (var i = 0; i < size; i++ ) {

//             for (var j = 0; j < size; j++ ) {

//                 var $puzzlePiece = $("<div/>");
//                 $puzzlePiece.addClass("puzzle-piece")
//                 $puzzlePiece.attr("data-position", i + "" + j);
//                 $puzzlePiece.attr("data-placed", false);

//                 $puzzlePiece.width( Math.ceil( canvasWidth / size ) );
//                 $puzzlePiece.height( Math.ceil( canvasHeight / size ) );

//                 randTop = Math.floor(rand(canvasPos.top, canvasHeight - $puzzlePiece.height() ) );
//                 randLeft = Math.floor(canvasPos.left + rand(canvasPos.left, canvasWidth - $puzzlePiece.width() ) );

//                 $puzzlePiece.css({
//                     position: "absolute",
//                     backgroundImage: image,

//                     backgroundPosition: Math.ceil( -j * (canvasWidth / size) ) + "px " + Math.ceil( -i * (canvasHeight / size) ) + "px",

//                     transform: "translate(" + randLeft + "px, " + randTop + "px)",
//                     zIndex: 10
//                 });

//                 $puzzlePiece[0].setAttribute("data-x", randLeft);
//                 $puzzlePiece[0].setAttribute("data-y", randTop);

//                 $("#canvas-pieces").append($puzzlePiece);
//             }
//         }
//     }

//     var createBoard = function(image, size, canvas) {

//         var canvasHeight = canvas.height();
//         var canvasWidth = canvas.width();

//         for (var i = 0; i < size; i++ ) {

//             for (var j = 0; j < size; j++ ) {

//                 var $boardPiece = $("<div/>");
//                 $boardPiece.addClass("dropzone");
//                 $boardPiece.attr("data-position", i + "" + j);

//                 $boardPiece.width( Math.floor( canvasWidth / size ) );
//                 $boardPiece.height( Math.floor( canvasHeight / size ) );
//                 $boardPiece.css({
//                     opacity: "0.1",
//                     position: "absolute",
//                     backgroundImage: image,

//                     backgroundPosition: Math.ceil( -j * (canvasWidth / size) ) + "px " + Math.ceil( -i * (canvasHeight / size) ) + "px",

//                     transform: "translate(" + Math.ceil( j * (canvasWidth / size) + canvasWidth ) + "px, " + Math.ceil( i * (canvasHeight / size) ) + "px)"
//                 });

//                 $("#canvas-pieces").append($boardPiece);
//             }

//         }
//     }

//     var runPuzzle = function(image, size) {

//         // var size = $( "#grid-size" ).val();
//         gridSize = size * size;
//         pieceScore = 0;

//         // var image = "url(/assets/batman-logo/Batman-Logo.gif)";
//         // image = image || "url( <%#= asset_path 'Batman-Logo.gif' %> )";

//         var canvas = $("#canvas-pieces");

//         //============== create puzzle and board pieces ===============
        
//         createPieces(image, size, canvas);
//         createBoard(image, size, canvas);
        

//         //================ Drag Move ==================
//         var dragMoveListener = function(event) {
//             var target = event.target,
//                 // keep the dragged position in the data-x/data-y attributes
//                 x = (parseFloat(target.getAttribute('data-x')) || 0) + event.dx,
//                 y = (parseFloat(target.getAttribute('data-y')) || 0) + event.dy;

//             // translate the element
//             target.style.transform =
//               'translate(' + x + 'px, ' + y + 'px)';

//             // update the posiion attributes
//             target.setAttribute('data-x', x);
//             target.setAttribute('data-y', y);
//         }

//         interact(".puzzle-piece")
//             .draggable({
//                 inertia: true,
//                 restrict: {
//                     restriction: "#canvas",
//                     elementRect: { top: 0, left: 0, bottom: 1, right: 1 }
//                 },

//                 autoScroll: true,
//                 onmove: dragMoveListener
//             });

//         // this is used later in the resizing and gesture demos
//         window.dragMoveListener = dragMoveListener;
          

//         //============== Drop Zone ===============
//         interact('.dropzone').dropzone({
//             // only accept elements matching this CSS selector
//             accept: '.puzzle-piece',
//             // Require a 50% element overlap for a drop to be possible
//             overlap: 0.5,

//             // listen for drop related events:
//             ondragenter: function (event) {
//                 var draggableElement = event.relatedTarget,
//                     dropzoneElement = event.target;
//                 dropzoneElement.classList.add('dropzone-hover-bg');
//             },
//             ondragleave: function (event) {
//                 var draggableElement = event.relatedTarget,
//                     dropzoneElement = event.target;
//                 dropzoneElement.classList.remove('dropzone-hover-bg');
//             },
//             ondrop: function (event) {
//                 var draggableElement = event.relatedTarget,
//                     dropzoneElement = event.target;

//                 $(draggableElement).css("transform",  $(dropzoneElement).css("transform"));

//                 if ( $(draggableElement).attr("data-position") === $(dropzoneElement).attr("data-position") ) {

//                     if ( $(draggableElement).hasClass("placed") ) { return };

//                     $(draggableElement).addClass("placed");
//                     $(draggableElement).removeClass("puzzle-piece");
//                     $(dropzoneElement).removeClass("dropzone-hover-bg");
//                     $(dropzoneElement).addClass("dropzone-correct-bg");
//                     pieceScore++;

//                     if (pieceScore === gridSize) {
//                         $("#timer").timer("pause");
//                         $("#time").html( $("#timer").html() );
//                         $("#puzzle_score").val( $("#timer").html() );
//                         $('#winModal').modal('show');
//                     }
//                 }
//             },
//             ondropdeactivate: function (event) {
//                 var draggableElement = event.relatedTarget,
//                     dropzoneElement = event.target;
//             }
//         });

//     };

//     $("#puzzle-goBack").on("click", function() {
//         $(location).attr( "href", $("#puzzle-goBack").attr("data-backUrl") );
//     });

//     $("#puzzle-reload").on("click", function() {
//         location.reload();
//     });

//     var url = "url(" + this.params['url'] + ")";
//     var size = this.params["size"];

//     $(document).ready(function() {
//         runPuzzle(url, size);
//     });
    
// };