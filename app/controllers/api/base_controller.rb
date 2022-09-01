module Api
  class Api::BaseController < ApplicationController

    protect_from_forgery unless: -> { request.format.json? }

    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ActionController::UnknownFormat, with: :unknown_format
    rescue_from ActionController::InvalidCrossOriginRequest, with: :invalid_request
    rescue_from ActionController::RoutingError, with: :routing_error

    private

    def record_not_found
      render json: { errors: [{ message: "Reocrd not Found" }] }, status: :not_found
    end

    def unknown_format
      render json: { errors: [{ message: "Unknown Format" }] }, status: :unprocessable_entity
    end

    def invalid_request
      render json: { errors: [{ message: "Invalid Cross Origin Request" }] }, status: :unprocessable_entity
    end

    def invalid_request
      render json: { errors: [{ message: "Routing Error" }] }, status: :unprocessable_entity
    end

  end
end
