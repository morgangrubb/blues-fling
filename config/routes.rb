Bluesfling::Application.routes.draw do

  match 'blues-fling-4(/:action)', controller: "blues_fling_four", action: /(index|sample|left-sidebar|no-sidebar|right-sidebar)/

  match 'blues-fling-3(/:action)', controller: "blues_fling_three", action: /(instructors|schedule|private_lessons|registration|contact_us)/

  # get 'instructors' => 'home#instructors'
  # get 'schedule' => 'home#schedule'
  # get 'private_lessons' => 'home#private_lessons'
  # get 'registration' => 'home#registration'
  # get 'contact_us' => 'home#contact_us'

  root :to => 'blues_fling_four#index'
end
