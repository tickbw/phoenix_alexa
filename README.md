# Alexa library for Phoenix

[![Build Status](https://api.travis-ci.org/gabiz/phoenix_alexa.svg)](https://travis-ci.org/gabiz/phoenix_alexa)

## Usage

Add phoenix_alexa as a dependency in your `mix.exs` file.

```elixir
def deps do
  [ { :phoenix_alexa, "~> 0.2.0" } ]
end
```

Update a route with a post request into your alexa controller. 

```elixir
  scope "/", HelloAlexa do
    pipe_through :api

    post "/", AlexaController, :post
  end

```

In the controller add a use statement for `PhoenixAlexa.Controller` and define functions for `launch_request`, `session_end_request` and `intent_request` as follows:

```elixir

defmodule HelloPhoenixAlexa.AlexaController do
  use HelloPhoenixAlexa.Web, :controller
  use PhoenixAlexa.Controller, :post  # param should match route name

  def launch_request(conn, request) do
    response = %Response{} 
        |> set_output_speech(%TextOutputSpeech{text: "Welcome to the Horoscope."}) 

    conn
      |> set_response(response)
  end

  def session_end_request(conn, request) do
    conn
  end

  def intent_request(conn, "GetHoroscope", request) do
    response = case request.request.intent.slots["Sign"]["value"] do
      "Libra" ->
        card = %SimpleCard{}
          |> set_title("Get Horoscope")
          |> set_content("You are going to have an unexpected event today.")

        %Response{} 
          |> set_output_speech(%TextOutputSpeech{text: "You are going to have an unexpected event today."}) 
          |> set_card(card)
          |> set_session_attributes(%{my_key: "my_data"})
          |> set_should_end_session(true)
      _ ->
        %Response{} 
          |> set_output_speech(%TextOutputSpeech{text: "You are going to meet an interesting person."}) 
          |> set_should_end_session(true)
    end

    conn |> set_response(response)
  end
end

```

To authenticate that the request corresponds to your Alexa application add the ValidateApplicationId plug to your router as follows:

```elixir
  pipeline :api do
    plug :accepts, ["json"]
    plug ValidateApplicationId, "amzn1.echo-sdk-ams.app.05dcb1a4-cb45-46c5-a30e-bb3033a0770a"
  end
```
