class PuzzlesController < ApplicationController
    def test
    end

    def puzzle
        @puzzle = Puzzle.find_by :title => params[:title]
    end
end
