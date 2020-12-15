defmodule Input do
  def read(file_path) do
    {:ok, body} = File.read(file_path)
    String.split(body)
  end

  def read(file_path, delimiter) do
    {:ok, body} = File.read(file_path)
    String.split(body, delimiter)
  end
end
