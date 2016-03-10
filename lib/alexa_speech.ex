defmodule Alexa.Speech do

  defmacro __using__(method) do
    quote do
      import Alexa.Speech

      def unquote(method)(conn, params) do
        request = params["request"]

        response = case request["type"] do
          "LaunchRequest" ->
            launchRequest(params)
          "IntentRequest" ->
            intentRequest(request["intent"]["name"], params)
          "SessionEndedRequest" -> 
            sessionEndedRequest(params)  
        end |> log_response

        conn 
          |> Plug.Conn.put_status(response.status) 
          |> json response
      end

    end
  end

  def session_attributes(request) do
    request["session"]["sessionAttributes"]
  end

  def response do
    %{
      "status": 200,
      "version": "1.0",
      "response": %{
        "outputSpeech": %{
          "type": "PlainText",
          "text": ""
        },
        "card": %{
          "type": "Simple",
          "content": "",
          "title": ""
        },
        "reprompt": %{
          "outputSpeech": %{
            "type": "PlainText",
            "text": ""
          }
        },
        "shouldEndSession": false
      },
      "sessionAttributes": %{}
    }
  end

  def set_status(response, status) do
    %{response | "status": status}
  end

  def set_output_speech(response, text, type \\ "PlainText") do
    new_resp_field = %{response[:response] | "outputSpeech": %{"type": type, "text": text} }
    %{response | "response": new_resp_field}
  end

  def set_card(response, content, title, type \\ "Simple") do
    new_resp_field = %{response[:response] | "card": %{"type": type, "content": content, "title": title} }
    %{response | "response": new_resp_field}    
  end

  def set_reprompt(response, text, type \\ "PlainText") do
    new_output_speech = %{response[:response][:reprompt] | "outputSpeech": %{"type": type, "text": text} }
    new_resp_field = %{response[:response] | "reprompt": new_output_speech }
    %{response | "response": new_resp_field}    
  end 

  def set_should_end_session(response, value) do
    new_resp_field = %{ response[:response] | "shouldEndSession": value }
    %{response | "response": new_resp_field}    
  end 

  def set_session_attributes(response, session_attributes) do
    %{response | "sessionAttributes": session_attributes}
  end

  def log_response(response) do
    IO.puts "Response = #{inspect response}"
    response
  end

end