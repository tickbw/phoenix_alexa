defmodule PhoenixAlexa.Response do
  alias PhoenixAlexa.{Response, TextOutputSpeech, SsmlOutputSpeech}
  alias PhoenixAlexa.{SimpleCard, StandardCard, LinkAccountCard}

  defstruct version: "1.0",
            sessionAttributes: %{},
            response: %{
              shouldEndSession: false
            }

  # def session_attributes(response) do
  #   response[:sessionAttributes]
  # end

  def set_session_attributes(response, sessionAttributes) do
    # response = response || %{}
    # Map.put(response, :sessionAttributes, sessionAttributes)
    %Response{response | sessionAttributes: sessionAttributes}
  end

  def set_output_speech(response, %TextOutputSpeech{} = outputspeech) do
    %Response{response | response: (response.response |> Map.put(:outputSpeech, outputspeech))}     
  end
  def set_output_speech(response, %SsmlOutputSpeech{} = outputspeech) do
    %Response{response | response: (response.response |> Map.put(:outputSpeech, outputspeech))}     
  end

  def set_card(response, %SimpleCard{} = card) do
    %Response{response | response: (response.response |> Map.put(:card, card))}
  end
  def set_card(response, %StandardCard{} = card) do
    %Response{response | response: (response.response |> Map.put(:card, card))}
  end
  def set_card(response, %LinkAccountCard{} = card) do
    %Response{response | response: (response.response |> Map.put(:card, card))}
  end

  def set_reprompt(response, %TextOutputSpeech{} = outputspeech) do
    %Response{response | response: (response.response |> Map.put(:reprompt, %{outputSpeech: outputspeech}))}
  end
  def set_reprompt(response, %SsmlOutputSpeech{} = outputspeech) do
    %Response{response | response: (response.response |> Map.put(:reprompt, %{outputSpeech: outputspeech}))}
  end

  def set_should_end_session(response, shouldEndSession) do
    %Response{response | response: %{response.response | shouldEndSession: shouldEndSession}}
  end
end