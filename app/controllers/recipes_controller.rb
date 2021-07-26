class RecipesController < ApplicationController
    def new
        @recipe = Recipe.new
    end

    def show
        @recipe = Recipe.find_by_id(params[:id])
    end

    def edit
        @recipe = Recipe.find_by_id(params[:id])
    end
    
    def create 
        byebug
        @recipe = Recipe.new(recipe_params)
        if @recipe.save
         redirect_to recipe_path(@recipe)
        else
            render :new 
        end
    end
   
    def update
        @recipe = Recipe.find(params[:id])
    
        @recipe.update(recipe_params)
    
        if @recipe.save
          redirect_to @recipe
        else
          render :edit
        end
      end

    private

    def recipe_params
        params.require(:recipe).permit(:name, :ingredients_ids => [])
    end
end
