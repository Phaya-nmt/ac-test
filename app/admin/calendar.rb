ActiveAdmin.register_page "Calendar" do
  content do
    form partial: 'calendar'
  end
  Arbre::Context.new do
    h2 "Why is Arbre awesome?"

    ul do
      li "The DOM is implemented in ruby"
      li "You can create object oriented views"
      li "Templates suck"
    end
  end

end
