class ScoresController < ApplicationController
    def index
        @scores = Score.all
    end

    def create
        @score = Score.new score_params
        @score.save
        puzzle = Puzzle.find params[:score]["puzzle_id"]
        redirect_to("#{puzzles_path}/#{puzzle.title}/#{ params[:score]["puzzle_size"] }")
    end

    private
    def score_params
    params.require(:score).permit(:user_id, :puzzle_id, :puzzle_score, :puzzle_size)
    end
end
