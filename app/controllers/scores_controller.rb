class ScoresController < ApplicationController
    def index
        if params[:filter] && params[:s]
            if params[:filter] == "username"
                @scores = Score.joins(:user).where("#{params[:filter]} ILIKE ?", "%#{params[:s]}%").order(puzzle_size: :asc, puzzle_score: :asc)
            elsif params[:filter] == "title"
                @scores = Score.joins(:puzzle).where("#{params[:filter]} ILIKE ?", "%#{params[:s]}%").order(puzzle_size: :asc, puzzle_score: :asc)
            elsif params[:filter] == "puzzle_size"
                @scores = Score.where("#{params[:filter]} = ?", params[:s].to_i).order(puzzle_size: :asc, puzzle_score: :asc)
            end
        else
            @scores = Score.all.order(puzzle_size: :asc, puzzle_score: :asc)
        end
    end

    def create
        @score = Score.new score_params
        if @score.save
            puzzle = Puzzle.find params[:score]["puzzle_id"]
            redirect_to("#{puzzles_path}/#{puzzle.title}/#{ params[:score]["puzzle_size"] }")
        end
    end

    private
    def score_params
        params.require(:score).permit(:user_id, :puzzle_id, :puzzle_score, :puzzle_size)
    end
end
