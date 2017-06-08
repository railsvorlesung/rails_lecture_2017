class StyledFormBuilder < ActionView::Helpers::FormBuilder

  def error_messages_on(attribute)
  end

  def text(*args)
    @template.content_tag(:div, class: "row") do
      @template.concat(
        @template.content_tag(:div, class: "col-md-2") do
          @template.concat(label args.first)
        end
      )
      @template.concat(
        @template.content_tag(:div, class: "col-md-5") do
        @template.concat(
          text_field( *args )
        )
        @template.concat(
          error_message_on args.first
        )
        end
      )
    end
  end # #text
end
