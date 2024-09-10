# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RedactionsController, type: :controller do
  describe 'GET #identify' do
    it 'returns Redaction Service' do
      get :identify
      expect(response.body).to eq('Redaction Service')
    end
  end

  describe 'POST #redact' do
    it 'redacts defined words' do
      post :redact, params: { text: 'A dog and a cat' }
      expect(response.body).to eq('A REDACTED and a REDACTED')
    end

    it 'logs the original text' do
      expect do
        post :redact, params: { text: 'A dog and a snake' }
      end.to(change { File.read(Rails.root.join('log', 'redaction.log')) })
    end
  end
end
