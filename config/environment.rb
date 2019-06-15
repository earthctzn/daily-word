require_relative "../lib/DailyWord/version"
require_relative "../lib/concerns/findable"
require_relative "../lib/concerns/saveable"
require_relative "../lib/cli"
require_relative "../lib/scraper"
require_relative "../lib/word"



require "nokogiri"
require "open-uri"
require "bundler/setup"
Bundler.require(:default)

