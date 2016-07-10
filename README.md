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

  def launchRequest(conn, request) do
    response = %Response{} 
        |> set_output_speech(%TextOutputSpeech{text: "Welcome to the Horoscope."}) 

    conn
      |> set_response(response)
  end

  def sessionEndedRequest(conn, request) do
    conn
  end

  def intentRequest(conn, "GetHoroscope", request) do
    response = case request.request.intent.slots["Sign"]["value"] do
      "Libra" ->
        card = %SimpleCard{}
          |> SimpleCard.set_title("Get Horoscope")
          |> SimpleCard.set_content("You are going to have an unexpected event today.")

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

