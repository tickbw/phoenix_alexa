# Alexa library for Phoenix

## Usage

Add Alexa as a dependency in your `mix.exs` file.

```elixir
def deps do
  [ { :alexa, git: "https://github.com/gabiz/alexa" } ]
end
```

Update a route with a post request into your alexa controller. 

```elixir
  scope "/", HelloAlexa do
    pipe_through :api

    post "/", AlexaController, :post
  end

```

In the controller add a use statement for `Alexa.Speech` and define functions for `launchRequest`, `sessionEndRequest` and `intentRequest` as follows:

```elixir

defmodule HelloAlexa.AlexaController do
  use HelloAlexa.Web, :controller
  use Alexa.Speech, :post

  def launchRequest(_params) do
    response() 
      |> set_output_speech("Welcome to the programming oracle. Ask me what are the best programming languages.") 
  end

  def sessionEndedRequest(_params) do
    response()   
  end

  def intentRequest("GetBestLanguages", params) do    
    response()
      |> set_output_speech("the best programming languages are Erlang and Elixir.") 
  end
end

```

