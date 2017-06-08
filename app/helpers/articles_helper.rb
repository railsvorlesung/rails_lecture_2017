module ArticlesHelper

  def link_button(*args)
    if args.last.kind_of?(Hash)
      args.last[:class] ||= ''
      args.last[:class] << ' btn btn-xs'
    else
      args.push({class: 'btn btn-default btn-xs'})
    end
    link_to(*args)   
  end # #link_button

  def new_article_button
    link_to new_article_path do 
      concat(
        content_tag(:span, nil, {
          :class => "glyphicon glyphicon-plus", 
          'aria-hidden' => true
        })
      )
      concat(
        t('.new')
      ) 
     end 
  end # #new_article_button
end
