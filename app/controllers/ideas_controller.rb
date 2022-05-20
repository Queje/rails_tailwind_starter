class IdeasController < ApplicationController
    def index
        @ideas = Idea.all
    end

    def show
        @idea = Idea.find(params[:id])
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
        @idea = Idea.find(params[:id])
    end
    
    def update
        @idea = Idea.find(params[:id])

        if @idea.update(ideas_params)
            redirect_to idea_path(@idea.id)
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @idea = Idea.find(params[:id])
        @idea.destroy
    
        redirect_to root_path, status: :see_other
    end
    

    private

    def ideas_params
        params.require(:idea).permit(:name, :description, :picture)
    end
end
