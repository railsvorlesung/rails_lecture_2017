module ApplicationHelper

  def current_model_name
    if Object.const_defined? controller_name.singularize.classify
      return controller_name.singularize.classify.constantize.model_name.human
    end
    return ''
  end # #current_model_name

  #
  # Common flash key are:
  # * errors
  # * success
  # * info
  # * notice
  # flash[:errors]
  def flash_dom_class(flash_name)
    bootstrap_class = case
                      when /errors/
                        'danger'
                      else
                        flash_name
                      end

    return "alert alert-#{bootstrap_class}"
  end # #flash_dom_class
end
