require_relative "../lib/DailyWord/version"
require_relative "../lib/concerns/findable"
require_relative "../lib/concerns/saveable"
require_relative "../lib/models/cli"
require_relative "../lib/models/scraper"
require_relative "../lib/models/word"



require "nokogiri"
require "open-uri"
require "bundler/setup"
Bundler.require(:default)

