Bluesfling::Application.routes.draw do

  match 'blues-fling-4(/:action)', controller: "blues_fling_four", action: /(instructors|schedule|private_lessons|registration|contact_us|faq)/

  match 'blues-fling-3(/:action)', controller: "blues_fling_three", action: /(instructors|schedule|private_lessons|registration|contact_us)/

  # Change this to set the current event.
  current_event = "blues_fling_four"

  get 'instructors'     => "#{current_event}#instructors"
  get 'schedule'        => "#{current_event}#schedule"
  get 'private_lessons' => "#{current_event}#private_lessons"
  get 'registration'    => "#{current_event}#registration"
  get 'faq'             => "#{current_event}#faq"
  get 'contact_us'      => "#{current_event}#contact_us"

  root :to => "#{current_event}#index"
end
