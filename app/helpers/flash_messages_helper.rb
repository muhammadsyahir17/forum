module FlashMessagesHelper

   def display_message(value)

     return content_tag(:p, value) unless value.kind_of?(Array)
     return content_tag(:li, message, class: 'list-styling')

     content_tag :ul do
       value.collect { |message| content_tag(:li, message, class: 'list-styling') }.join.html_safe
     end
   end
 end
