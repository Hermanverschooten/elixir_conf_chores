defmodule Chore do
  defstruct id: 0, name: "", description: "", required: false
end

defmodule ChoreRepository do
  alias PersistentStorage

  def repository_file do
    Application.get_env(:chore_repository, :config)[:file]
  end

  def setup do
    PersistentStorage.setup path: repository_file
  end

  def insert(name, order, description, required) do
    PersistentStorage.put(order, %{
      id: order,
      name: name,
      description: description,
      required: required
    })
  end

  def fetch(order) do
    PersistentStorage.get(order) |> map_to_chore
  end

  def next(order) do
    order + 1 |> PersistentStorage.get |> map_to_chore
  end

  def map_to_chore(nil) do
    %Chore{ }
  end

  def map_to_chore(map) do
    %Chore{ id: map.id, name: map.name, description: map.description, required: map.required }
  end

  def insert(name, order, description) do
    insert(name, order, description, false)
  end

  def seed do
    insert("Attend Joel's Talk", "1", "I think you'll enjoy it.", "true")
    insert("Tweet at Joel", "2", "Promise to follow or at least mention @joelbyler once connected to wifi")
    insert("Compliment your neighbor", "3", "Its good to make friends at a conference", "true")
    insert("Applause", "4", "Go over the top, clap and laugh hysterically!")
    insert("Give Joel a big high five!", "5", "See if you can be the first to give him a high five (or even a hug?). Don't be shy!")
  end
end
