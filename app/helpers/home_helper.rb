module HomeHelper

  def registration_link
    # link_to 'Register now!', '#', class: 'btn btn-primary btn-large', onclick: %(open("http://bluesfling3.dancecamps.org/booking.php","","toolbar=yes, location=no, directories=no, menubar=no, scrollbars=yes, resizable=yes, copyhistory=no, width=840, height=550"); return false;)
    link_to 'Registration is now closed', '#', class: 'btn btn-primary btn-large', onclick: "return false;", disabled: true
  end

end
