defmodule Alexa.Speech do

  defmacro __using__(method) do
    quote do
      import Alexa.{Speech, Response}
      alias Alexa.{Request, Response, TextOutputSpeech, SsmlOutputSpeech}
      alias Alexa.{SimpleCard, StandardCard, LinkAccountCard}

      def set_response(conn, status \\ 200, response) do
        conn
          |> Plug.Conn.put_resp_content_type("application/json")
          |> Plug.Conn.resp(status, Poison.encode!(response))
      end

      def handle_request(conn, request) do
        case request.request.type do
          "LaunchRequest" ->
            launchRequest(conn, request)
          "IntentRequest" ->
            intentRequest(conn, request.request.intent.name, request)
          "SessionEndedRequest" -> 
            sessionEndedRequest(conn, request)
              |> set_response(%{})
        end
          |> Plug.Conn.send_resp()
      end

      def unquote(method)(conn, params) do
        case Poison.Decode.decode(params, as: %Alexa.Request{}) do
          %Alexa.Request{} = request -> handle_request(conn, request)
          _ -> 
            conn
              |> Plug.Conn.put_resp_content_type("application/json")
              |> Plug.Conn.send_resp(500, Poison.encode!(%{error: "Internal Error"}))
        end

      end

      def launchRequest(conn, _request) do
        conn |> set_response(%Response{})
      end

      def sessionEndedRequest(conn, request) do
        conn
      end

      def intentRequest(conn, _, request) do
        conn |> set_response(%Response{})
      end

      defoverridable [launchRequest: 2, intentRequest: 3, sessionEndedRequest: 2]

    end
  end

  # def log_response(response) do
  #   Logger.info "Response = #{inspect response}"
  #   response
  # end

end