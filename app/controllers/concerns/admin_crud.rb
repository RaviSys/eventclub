# frozen_string_literal: true

module Concerns::AdminCrud
  extend ActiveSupport::Concern

  included do
    before_action :set_resource, only: %w[show edit update destroy]

    def index
      @q = resource_class.ransack(params[:q])
      results = @q.result.order(id: :desc).page(params[:page]).per(10)
      instance_variable_set("@#{plural_resource_name}", results)
      respond_to do |format|
        format.html
      end
    end

    def new
      set_resource(resource_class.new)
    end

    def create
      set_resource(resource_class.new(resource_params))
      if get_resource.save
        redirect_to send("admin_#{plural_resource_name}_path"), flash: success
      else
        render :new
      end
    end

    def edit; end

    def update
      if get_resource.update(resource_params)
        redirect_to send("admin_#{plural_resource_name}_path"), flash: success
      else
        render :edit
      end
    end

    def show; end

    def destroy
      message = get_resource&.destroy ? success : error
      redirect_to send("admin_#{plural_resource_name}_path"), flash: message
    end

    private

    def resource_class
      @resource_class ||= resource_name.classify.constantize
    end

    def resource_name
      @resource_name ||= controller_name.singularize
    end

    def plural_resource_name
      resource_name.pluralize
    end

    def resource_params
      send("#{resource_name}_params")
    end

    def set_resource(resource = nil)
      resource ||= resource_class.find(params[:id])
      instance_variable_set("@#{resource_name}", resource)
    end

    def get_resource
      instance_variable_get("@#{resource_name}")
    end

    def success
      name = { 'create': 'created', 'destroy': 'deleted', 'update': 'updated' }
      { success: t('admin.success', resource: resource_name.titleize, action: name[action_name.to_sym]) }
    end

    def error
      { error: t('admin.error', resource: resource_name) }
    end
  end
end
