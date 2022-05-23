class IdeasController < ApplicationController
    before_action :find_idea_id, only: %i[show edit update destroy]
    before_action :authenticate_user!, only: %i[new create edit update destroy]

    def index
        @ideas = Idea.all
    end

    def show
        
    end

    def new
        @idea = Idea.new
    end
    
    def create
        @idea = Idea.new(ideas_params)

        if @idea.save
            redirect_to root_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        
    end
    
    def update

        if @idea.update(ideas_params)
            redirect_to idea_path(@idea.id)
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @idea.destroy
    
        redirect_to root_path, status: :see_other
    end
    

    private

    def find_idea_id
        @idea = Idea.find(params[:id])
    end

    def ideas_params
        params.require(:idea).permit(:name, :description, :picture)
    end
end
