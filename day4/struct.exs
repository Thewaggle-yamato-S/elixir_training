#comment

defmodule User do 
    defstruct name: "Kobayashi", age: 19
    IO.inspect("Hello!")

end

defmodule Main do
  def main do
    usr = %User{}
    IO.inspect(usr.name)
    IO.inspect(usr.age)
    IO.inspect(usr)
    hoge = Map.get(usr, :age)
    IO.inspect(hoge)
  end
end

Main.main