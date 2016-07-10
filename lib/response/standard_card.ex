defmodule PhoenixAlexa.StandardCard do
  alias PhoenixAlexa.StandardCard

  defstruct type: "Standard",
            title: nil,
            text: nil,
            image: %{
              smallImageUrl: "",
              largeImageUrl: ""
            }

  def set_title(card, title) do
    %StandardCard{card | title: title}
  end
  def set_text(card, text) do
    %StandardCard{card | text: text} 
  end
  def set_small_image_url(card, image_url) do
    %StandardCard{card | image: %{ card.image | smallImageUrl: image_url}} 
  end
  def set_large_image_url(card, image_url) do
    %StandardCard{card | image: %{ card.image | largeImageUrl: image_url}} 
  end
end