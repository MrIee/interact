class PuzzlesController < ApplicationController
    before_action :check_if_logged_in, :only => [:new]

    def test
    end

    def show
        @puzzle = Puzzle.find_by :title => params[:title]
        js :url => @puzzle.path, :size => params[:size]
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
        puzzle_details[:public_id] = req["public_id"]

        @puzzle = Puzzle.new puzzle_details
        if @puzzle.save
            redirect_to("/users/#{@current_user.id}/puzzles")
        else
            Cloudinary::Uploader.destroy(req["public_id"])
            render :new
        end
    end

    def destroy
        puzzle = Puzzle.find params[:id]
        puzzle.destroy

        redirect_to("/users/#{@current_user.id}/puzzles")
    end

    private
    def puzzle_params
        params.require(:puzzle).permit(:title)
    end

    def check_if_logged_in
        redirect_to root_path unless @current_user.present?
    end
end
