class PuzzlesController < ApplicationController
    before_action :check_if_logged_in, :only => [:new]

    def index
        if params[:filter] && params[:s]
            if params[:filter] == "username"
                @puzzle = Puzzle.joins(:user).where("#{params[:filter]} ILIKE ?", "%#{params[:s]}%").paginate(page: params[:page])
            else
                @puzzle = Puzzle.where("#{params[:filter]} ILIKE ?", "%#{params[:s]}%").paginate(page: params[:page])
            end
        else
            @puzzle = Puzzle.paginate(page: params[:page])
        end
    end

    def show
        @puzzle = Puzzle.find_by :title => params[:title]
        js :url => @puzzle.path, :size => params[:size]
    end

    def new
        @puzzle = Puzzle.new
    end

    def create
        req = Cloudinary::Uploader.upload(params[:file], :width => 600, :height => 400, :crop => :limit)
        
        puzzle_details = puzzle_params
        puzzle_details[:user_id] = @current_user.id
        puzzle_details[:path] = req["url"]
        puzzle_details[:height] = req["height"]
        puzzle_details[:width] = req["width"]
        puzzle_details[:public_id] = req["public_id"]

        @puzzle = Puzzle.new puzzle_details

        if @puzzle.save

            redirect_to("/users/puzzles")
        else
            Cloudinary::Uploader.destroy(req["public_id"])
            render :new
        end
    end

    def destroy
        puzzle = Puzzle.where(:id => params[:ids])
        puzzle.destroy_all

        Cloudinary::Api.delete_resources(params[:delete])

        redirect_to(users_puzzles_path)
    end

    private
    def puzzle_params
        params.require(:puzzle).permit(:title)
    end

    def check_if_logged_in
        redirect_to root_path unless @current_user.present?
    end
end
