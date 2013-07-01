module BluesFlingFourHelper

  def registration_link(options = {})
    link_to 'Register now!', '#', class: "btn btn-warning btn-large", onclick: %(open("http://bluesflingfusion.dancecamps.org/booking.php","","toolbar=yes, location=no, directories=no, menubar=no, scrollbars=yes, resizable=yes, copyhistory=no, width=840, height=550"); return false;)
    # link_to 'Registration is now closed', '#', class: 'btn btn-primary btn-large', onclick: "return false;", disabled: true
  end

  def navbar_links
    base_url_options = { controller: "blues_fling_four" }

    links = [
      # ["Home",                      { action: "index" }.reverse_merge(base_url_options)],
      ["Blues & Fusion",            { action: "about" }.reverse_merge(base_url_options)],
      ["Instructors",               { action: "instructors" }.reverse_merge(base_url_options)],
      ["Classes",                   { action: "classes" }.reverse_merge(base_url_options)],
      ["Parties",                   { action: "dances" }.reverse_merge(base_url_options)],
      ["Schedule",                  { action: "schedule" }.reverse_merge(base_url_options)],
      ["Registration",              { action: "registration" }.reverse_merge(base_url_options)],
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

  def class_block(id, title, time, &block)
    description = capture(&block)
    render "class_block", id: id, title: title, description: description, time: time
  end

  def link_to_academie_duello
    link_to("Academie Duello", action: "venues", controller: "blues_fling_four", anchor: "academy_duello") +
      " @ ".html_safe +
      link_to("412 W Hastings St", "https://maps.google.com/maps?f=q&source=embed&hl=en&q=Academie+Duello,+412+W+Hastings+St,+Vancouver,+Greater+Vancouver,+British+Columbia+V6B+1L1,+Canada&sll=49.257735,-123.123904&sspn=0.144751,0.344009&t=m&ie=UTF8&geocode=FZYB8AId3Xep-A&split=0&hq=&hnear=Academie+Duello,+412+W+Hastings+St,+Vancouver,+British+Columbia+V6B+1L1,+Canada&ll=49.283484,-123.11142&spn=0.013997,0.036478&z=14&iwloc=A", target: "_blank")
  end

  def link_to_russian_hall
    link_to("Russian Hall", action: "venues", controller: "blues_fling_four", anchor: "russian_hall") +
      " @ ".html_safe +
      link_to("600 Campbell Ave", "https://maps.google.com/maps?f=q&source=embed&hl=en&geocode=&q=Russian+Hall&aq=&sll=49.278417,-123.084691&sspn=0.009043,0.01972&t=m&ie=UTF8&hq=Russian+Hall&hnear=&cid=12599577414497173462&ll=49.278781,-123.084297&spn=0.009799,0.018239&z=15", target: "_blank")
  end

  def link_to_one_thousand_rivers
    link_to("1000 Rivers Academy", action: "venues", controller: "blues_fling_four", anchor: "one_thousand_rivers") +
      " @ ".html_safe +
      link_to("54 E 4th Ave", "https://maps.google.com/maps?f=q&source=embed&hl=en&geocode=&q=One+Thousand+Rivers,+Vancouver,+BC,+Canada&aq=0&oq=one+thousand+rivers&sll=49.264815,-123.058514&sspn=0.072365,0.172005&ie=UTF8&hq=One+Thousand+Rivers,&hnear=Vancouver,+Greater+Vancouver,+British+Columbia,+Canada&t=m&ll=49.267345,-123.102884&spn=0.013462,0.024294", target: "_blank")
  end

end
