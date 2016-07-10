defmodule Alexa.Test do
  use ExUnit.Case

  test "true" do
#     json = """
# {
#   "session": {
#     "sessionId": "SessionId.80ef8951-172e-4f02-ace8-a7ec847e2d9f",
#     "application": {
#       "applicationId": "amzn1.echo-sdk-ams.app.05dcb1a4-cb45-46c5-a30e-bb3033a0770a"
#     },
#     "attributes": {},
#     "user": {
#       "userId": "amzn1.ask.account.AFP3ZWPOS2BGJR7OWJZ3DHPKMOMNWY4AY66FUR7ILBWANIHQN73QH3G5PC2FJVGDIDA7MY54GGNRGM4SVPKTT3K53SLI232MEFI77TZN7W6LISNFZTTFDSPCLX6OB4ISJDVJB6QZO3XC74US6CH5DQXYCVOODNTUFNI5JNSUWSBDVMWB7JXPVX43P4EUIMHTPZHNRHZDUDENZVI"
#     },
#     "new": false
#   },
#   "request": {
#     "type": "IntentRequest",
#     "requestId": "EdwRequestId.27142539-8af4-430c-8f22-411cfab269bd",
#     "timestamp": "2016-07-07T00:45:08Z",
#     "intent": {
#       "name": "GetHoroscope",
#       "slots": {
#         "Sign": {
#           "name": "Sign",
#           "value": "Libra"
#         },
#         "Date": {
#           "name": "Date"
#         }
#       }
#     },
#     "locale": "en-US"
#   },
#   "version": "1.0"
# }
# """
#     request = Poison.decode!(json, as: %Alexa.Request{})
#     # IO.inspect request

    assert true 
  end
end

 