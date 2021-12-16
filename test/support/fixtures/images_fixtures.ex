defmodule Jpeg2video.ImagesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Jpeg2video.Images` context.
  """

  @doc """
  Generate a image.
  """
  def image_fixture(attrs \\ %{}) do
    {:ok, image} =
      attrs
      |> Enum.into(%{

      })
      |> Jpeg2video.Images.create_image()

    image
  end
end
