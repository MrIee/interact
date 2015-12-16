class PuzzlesController < ApplicationController
    def test
    end

    def show
        @puzzle = Puzzle.find_by :title => params[:title]
    end

    def index
        @puzzle = Puzzle.all
    end

    def new
        @puzzle = Puzzle.new
    end

    def create
        req = Cloudinary::Uploader.upload params[:file]

        puzzle_details = puzzle_params
        puzzle_details[:user_id] = @current_user.id
        puzzle_details[:path] = req["url"]
        puzzle_details[:height] = req["height"]
        puzzle_details[:width] = req["width"]

        puzzle = Puzzle.create puzzle_details

        redirect_to root_path
    end

    def user
        
    end

    private
        def puzzle_params
            params.require(:puzzle).permit(:title)
        end
end
