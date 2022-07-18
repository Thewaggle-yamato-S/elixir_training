###comment

defmodule Math do
    def multiplication(x, y) do
        x * y    
    end    
end

n = 1
n = 
    n 
    |> Math.multiplication(2)
    |> Math.multiplication(3)
    |> Math.multiplication(4)
IO.inspect(n)