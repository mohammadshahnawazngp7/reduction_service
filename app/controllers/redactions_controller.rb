# frozen_string_literal: true

# Style/Documentation- Top Level Documentation
class RedactionsController < ApplicationController
  before_action :load_redacted_words

  def identify
    render plain: 'Redaction Service'
  end

  def redact
    text = params[:text]
    log_original_text(text)
    redacted_text = redact_text(text)
    render plain: redacted_text
  end

  private

  def load_redacted_words
    @redacted_words = ENV['REDACTED_WORDS']&.split(',') || %w[Dog Cat Snake Dolphin Mammal]
  end

  def redact_text(text)
    @redacted_words.each do |word|
      text.gsub!(/\b#{word}\b/i, 'REDACTED')
    end
    text
  end

  def log_original_text(text)
    File.open(Rails.root.join('log', 'redaction.log'), 'a') do |file|
      file.puts("[#{Time.now}] #{text}")
    end
  end
end
