module BluesFlingFourHelper

  def registration_link
    link_to 'Register now!', '#', class: 'button button-big', onclick: %(open("http://bluesflingfusion.dancecamps.org/booking.php","","toolbar=yes, location=no, directories=no, menubar=no, scrollbars=yes, resizable=yes, copyhistory=no, width=840, height=550"); return false;)
    # link_to 'Registration is now closed', '#', class: 'btn btn-primary btn-large', onclick: "return false;", disabled: true
  end

end
