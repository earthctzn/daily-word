require_relative "DailyWord/version"
require_relative "./cli"
require_relative "./scraper"
require_relative "./word"
require "nokogiri"
require "open-uri"
require "bundler/setup"
Bundler.require(:default)
