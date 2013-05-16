module BluesFlingFourHelper

  def registration_link(options = {})
    link_to 'Register now!', '#', class: "btn btn-warning btn-large", onclick: %(open("http://bluesflingfusion.dancecamps.org/booking.php","","toolbar=yes, location=no, directories=no, menubar=no, scrollbars=yes, resizable=yes, copyhistory=no, width=840, height=550"); return false;)
    # link_to 'Registration is now closed', '#', class: 'btn btn-primary btn-large', onclick: "return false;", disabled: true
  end

  def navbar_links
    base_url_options = { controller: "blues_fling_four" }

    links = [
      # ["Home",                      { action: "index" }.reverse_merge(base_url_options)],
      ["Instructors",               { action: "instructors" }.reverse_merge(base_url_options)],
      ["Schedule",                  { action: "schedule" }.reverse_merge(base_url_options)],
      ["Pricing and Registration",  { action: "registration" }.reverse_merge(base_url_options)],
      ["Volunteer",                 { action: "volunteer" }.reverse_merge(base_url_options)],
      ["FAQ",                       { action: "faq" }.reverse_merge(base_url_options)]
    ]

    parsed_links = links.collect do |link_options|
      active =
        if link_options[1].is_a? Hash
          params[:action] == link_options[1][:action]
        else
          false
        end

      content_tag :li, link_to(*link_options), class: "#{'active' if active}"
    end

    parsed_links.join(content_tag(:li, "", class: "divider-vertical")).html_safe
  end

end
