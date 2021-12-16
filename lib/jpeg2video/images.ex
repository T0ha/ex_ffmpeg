defmodule Jpeg2video.Images do
  @moduledoc """
  The Images context.
  """

  alias Jpeg2video.Repo


  @doc """
  Returns the list of images.

  ## Examples

      iex> list_images()
      [%Image{}, ...]

  """
  def list_images do
    raise "TODO"
  end

  @doc """
  Gets a single image.

  Raises if the Image does not exist.

  ## Examples

      iex> get_image!(123)
      %Image{}

  """
  def get_image!(id), do: raise "TODO"

  @doc """
  Creates a image.

  ## Examples

      iex> create_image(%{field: value})
      {:ok, %Image{}}

      iex> create_image(%{field: bad_value})
      {:error, ...}

  """
  def create_image(attrs \\ %{}) do
    raise "TODO"
  end

  @doc """
  Updates a image.

  ## Examples

      iex> update_image(image, %{field: new_value})
      {:ok, %Image{}}

      iex> update_image(image, %{field: bad_value})
      {:error, ...}

  """
  def update_image(image, attrs) do
    raise "TODO"
  end

  @doc """
  Deletes a Image.

  ## Examples

      iex> delete_image(image)
      {:ok, %Image{}}

      iex> delete_image(image)
      {:error, ...}

  """
  def delete_image(image) do
    raise "TODO"
  end

  @doc """
  Returns a data structure for tracking image changes.

  ## Examples

      iex> change_image(image)
      %Todo{...}

  """
  def change_image(image, _attrs \\ %{}) do
    raise "TODO"
  end
end
