module ApplicationHelper

  def map_image(location, options = {})
    options.reverse_merge!({
      markers: location,
      center: location,
      zoom: 15,
      size: '300x200',
      sensor: 'false'
    })

    image = tag(:img, src: "http://maps.googleapis.com/maps/api/staticmap?#{options.to_param}")
    link_to image, map_link(location), target: '_blank'
  end

  def map_link(location)
    "http://maps.google.com/maps?q=#{location}&hl=en"
  end

  def asset_url(asset)
    "#{request.protocol}#{request.host_with_port}#{asset_path(asset)}"
  end

end
