# Welcome To Find Feelings

A Ruby on Rails application that promotes introspection and creativity through the use of the OpenAI API.

## How It's Made:
**Tech Used**: HTML/ERB, Tailwind, Ruby on Rails, SQLite, OpenAI

* Ruby version used: 3.1.2

## Getting Started
- `brew install ruby-build rbenv`
- Clone this repository
- `rbenv init`
- Configure your shell to load rbenv
  - Zsh: `echo 'eval "$(~/.rbenv/bin/rbenv init - zsh)"' >> ~/.zshrc`
  - bash: `echo 'eval "$(rbenv init - bash)"' >> ~/.bash_profile`
  - Restart the shell
- Installing Ruby
  ```
    #install Ruby
    rbenv install 3.1.2
    
    #set the default Ruby version for this directory
    rbenv local 3.1.2
    ```
- Install Rails
  ```
  gem install rails
  ```
- Install gems with
  ```
  bundle install
  ```
- Create the DB with `rails db:migrate`
- get access to OpenAI API
  - head to https://platform.openai.com/signup
  - account > API keys > create new secret key
  - in the terminal run:
    ``` 
    EDITOR="code --wait" bin/rails credentials:edit
    ```
  - within the editor that opens, paste the secret key:
    ```
    chatgpt_api_key: {secret key}
    ```

### To Deploy Locally
  `bin/rails server` and go to http://localhost:3000/

### To Test
`rails test`

## Optimizations
- Authentication to allow users to sign in and save their own collections
- Thorough testing
- Further optimization of OpenAI query parameters for better responses
- Creation of tailwind components to decrease bloat