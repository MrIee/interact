class PuzzlesController < ApplicationController
    def test
    end

    def show
        @puzzle = Puzzle.find_by :title => params[:title]
    end

    def index
        @puzzle = Puzzle.all
    end
end
