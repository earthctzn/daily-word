# The Idea

I will build a gem that will provide the user with a Word of the Day along with the definition, example use cases, and pronunciation. The gem will have a CLI that will allow the user to view past Words of the Day.

## The Plan
1. Plan the Gem. Imagine the CLI
2. Start with the project structure. I used Bundler.
3. Start with the entry point - the file run
4. Force that.

### Behavior
I'd like the app to start with: 
1. `greeting` the user.
2. Display the word of day `wod` with full attributes i.e date, definition, example use cases, and pronunciation. (I would like Pronunciation to be clickable to listen to the audio clip.)
3. Ask the user for input.
4. Show a list of month-year dates
5. ask for input
6. based on input display list of words for that month
7. ask for input
8. based on input scrape the missing data for the word and save it then display all data.
9. ask for input

need to work out how to find by date and recycle methods 

