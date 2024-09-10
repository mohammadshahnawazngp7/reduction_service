# Redaction Service  

## Build Instructions
### Prerequisites
- `ruby -v 3.0.0`
- `rails -v 7.1.4`

## Clone the Repository
`git clone https://github.com/mohammadshahnawazngp7/reduction_service`   

### Install Dependencies:   
`bundle install`   

### Set up Environment     
- Create a .env file for configuring the list of words to be redacted. Here is an example `.env` file:   
    `REDACTED_WORDS="Dog,Cat,Snake,Dolphin,Mammal"`   

### Start the Server   

`rails server -p 8080` 
  

## Running the Application      
### Endpoints:    
- GET /redact:    
`Returns a string: "Redaction Service".`    
- #### curl  
  `curl --location 'http://localhost:8080/redact'
`    
- POST /redact:    
`Accepts text in the request body and returns the redacted text.`      
- #### curl
  `curl --location 'http://localhost:8080/redact' \
--header 'Content-Type: text/plain' \
--data 'A dog, a monkey or a dolphin are all mammals. A snake, however, is not a mammal, it is a reptile.'`     
- #### Response:

`"A REDACTED, a monkey or a REDACTED are all REDACTEDs. A REDACTED, however, is not a REDACTED, it is a reptile."`      
     
## Testing   
### Running Tests    
To run the test suite: `bundle exec rspec`     

### Running Rubocop    
To check for code style issues and ensure the code is properly formatted:    
`bundle exec rubocop`     

#    
  
Thank you for reviewing this project. If you have any questions, please feel free to ask.
