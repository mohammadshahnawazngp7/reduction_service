# frozen_string_literal: true

Rails.application.routes.draw do
  get '/redact', to: 'redactions#identify'
  post '/redact', to: 'redactions#redact'
end
