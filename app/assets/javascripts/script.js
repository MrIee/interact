var rand = function(min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
}

var PuzzlesController = Paloma.controller('Puzzles');
var UsersController = Paloma.controller('Users');

PuzzlesController.prototype.show = function(){
    var ruby = this;

    $("#timer").timer({
        format: "%M:%S"
    });

    var Puzzle = {
        canvas: $("#canvas-pieces"),
        imagePath: "url(" + ruby.params['url'] + ")",
        size: ruby.params["size"],
        gridSize: ruby.params["size"] * ruby.params["size"],
        pieceScore: 0,

        run: function() {
            console.log(this.gridSize)
            //============== create puzzle and board pieces ===============
            this.createPieces();
            this.createBoard();
            this.makePuzzleDraggable();
            this.makePuzzleDropzones();
        },

        createPieces: function() {

            var canvasPos = this.canvas.position();
            var canvasHeight = this.canvas.height();
            var canvasWidth = this.canvas.width();
            var randTop, randLeft = 0;

            for (var i = 0; i < this.size; i++ ) {

                for (var j = 0; j < this.size; j++ ) {

                    var $puzzlePiece = $("<div/>");
                    $puzzlePiece.addClass("puzzle-piece")
                    $puzzlePiece.attr("data-position", i + "" + j);
                    $puzzlePiece.attr("data-placed", false);

                    $puzzlePiece.width( Math.ceil( canvasWidth / this.size ) );
                    $puzzlePiece.height( Math.ceil( canvasHeight / this.size ) );

                    randTop = Math.floor(rand(canvasPos.top, canvasHeight - $puzzlePiece.height() ) );
                    randLeft = Math.floor(canvasPos.left + rand(canvasPos.left, canvasWidth - $puzzlePiece.width() ) );

                    $puzzlePiece.css({
                        position: "absolute",
                        backgroundImage: this.imagePath,

                        backgroundPosition: Math.ceil( -j * (canvasWidth / this.size) ) + "px " + Math.ceil( -i * (canvasHeight / this.size) ) + "px",

                        transform: "translate(" + randLeft + "px, " + randTop + "px)",
                        zIndex: 10
                    });

                    $puzzlePiece[0].setAttribute("data-x", randLeft);
                    $puzzlePiece[0].setAttribute("data-y", randTop);

                    this.canvas.append($puzzlePiece);
                }
            }
        },

        createBoard: function() {

            var canvasHeight = this.canvas.height();
            var canvasWidth = this.canvas.width();

            for (var i = 0; i < this.size; i++ ) {

                for (var j = 0; j < this.size; j++ ) {

                    var $boardPiece = $("<div/>");
                    $boardPiece.addClass("dropzone");
                    $boardPiece.attr("data-position", i + "" + j);

                    $boardPiece.width( Math.floor( canvasWidth / this.size ) );
                    $boardPiece.height( Math.floor( canvasHeight / this.size ) );
                    $boardPiece.css({
                        opacity: "0.1",
                        position: "absolute",
                        backgroundImage: this.imagePath,

                        backgroundPosition: Math.ceil( -j * (canvasWidth / this.size) ) + "px " + Math.ceil( -i * (canvasHeight / this.size) ) + "px",

                        transform: "translate(" + Math.ceil( j * (canvasWidth / this.size) + canvasWidth ) + "px, " + Math.ceil( i * (canvasHeight / this.size) ) + "px)"
                    });

                    this.canvas.append($boardPiece);
                }
            }
        },

        //================ Drag Move ==================
        dragMoveListener: function(event) {
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
        },

        makePuzzleDraggable: function() {
            interact(".puzzle-piece").draggable({
                inertia: true,
                restrict: {
                    restriction: "#canvas",
                    elementRect: { top: 0, left: 0, bottom: 1, right: 1 }
                },

                autoScroll: true,
                onmove: this.dragMoveListener
            });
        },

        //============== Drop Zone ===============
        makePuzzleDropzones: function() {
            var puzzle = this;

            interact('.dropzone').dropzone({
                // only accept elements matching this CSS selector
                accept: '.puzzle-piece',
                // Require a 50% element overlap for a drop to be possible
                overlap: 0.5,

                // listen for drop related events:
                ondragenter: function (event) {
                    var draggableElement = event.relatedTarget,
                        dropzoneElement = event.target;
                    dropzoneElement.classList.add('dropzone-hover-bg');
                },
                ondragleave: function (event) {
                    var draggableElement = event.relatedTarget,
                        dropzoneElement = event.target;
                    dropzoneElement.classList.remove('dropzone-hover-bg');
                },
                ondrop: function (event) {
                    var draggableElement = event.relatedTarget,
                        dropzoneElement = event.target;

                    $(draggableElement).css("transform",  $(dropzoneElement).css("transform"));

                    if ( $(draggableElement).attr("data-position") === $(dropzoneElement).attr("data-position") ) {

                        if ( $(draggableElement).hasClass("placed") ) { return };

                        $(draggableElement).addClass("placed");
                        $(draggableElement).removeClass("puzzle-piece");
                        $(dropzoneElement).removeClass("dropzone-hover-bg");
                        $(dropzoneElement).addClass("dropzone-correct-bg");
                        puzzle.pieceScore++;
                        console.log(puzzle.gridSize);
                        if (puzzle.pieceScore === puzzle.gridSize) {
                            puzzle.puzzleWin();
                        }
                    }
                },
                ondropdeactivate: function (event) {
                    var draggableElement = event.relatedTarget,
                        dropzoneElement = event.target;
                }
            });
        },

        puzzleWin: function() {
            $("#timer").timer("pause");
            $("#time").html( $("#timer").html() );
            $("#puzzle_score").val( $("#timer").html() );
            $('#winModal').modal('show');
        }
    };

    
    $("#puzzle-goBack").on("click", function() {
        $(location).attr( "href", $("#puzzle-goBack").attr("data-backUrl") );
    });

    $("#puzzle-reload").on("click", function() {
        location.reload();
    });

    $(document).ready(function() {
        Puzzle.run();
    });
    
};


PuzzlesController.prototype.index = function(){
    $play = $("#puzzle-play");

    $("input:radio[name='puzzle-title']").on("change", function() {
        $play.attr("data-title", $(this).val() );
    });

    $("#grid-size").on("change", function() {
        $play.attr("data-size", $(this).val() );
    });

    $play.on("mouseenter", function(event) {
        $(this).attr("href", $(this).attr("data-path") + "/" + $(this).attr("data-title") + "/" + $(this).attr("data-size") );
    });
};

UsersController.prototype.show_puzzles = function(){
    $(".my-puzzle-play").each(function() {

        var $play = $(this);

        $( "#grid-size-" + $play.attr("id") ).on("change", function() {
            $play.attr( "data-size", $(this).val() );
        });

        $play.on("mouseenter", function(event) {
            $play.attr("href", $play.attr("data-path") + "/" + $play.attr("data-size") );
        });

    });
};

$(document).ready(function() {
    $(".alert-danger").fadeIn();
});