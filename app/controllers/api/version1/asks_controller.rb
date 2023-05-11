module Api
  module Version1
    class AsksController < ApplicationController
      skip_before_action :verify_authenticity_token

      def index
        @asks = Ask.all.order('created_at DESC')
        render json: @asks
      end

      def new
        @ask = Ask.new
      end

      def show
        @ask = Ask.find(params[:id])
        render json: @ask
      end

      def create
        @answer = ChatCallerSvc.call(params[:title])
        @ask = Ask.new(title: ask_params[:title], body: "#{@answer}")

        if @ask.save
          render json: @ask
        else
          render json: @event.errors, status: :unprocessable_entity
        end

      end

      def destroy
        @ask = Ask.find(params[:id])
        @ask.destroy
        head :no_content, status: :ok
      end

      private

      def ask_params
        params.require(:ask).permit(:title)
      end

    end
  end
end