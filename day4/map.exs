#通常記法
map1 = %{"name" => "yamato", "age" => 26}

#アトムの簡易記法＋通常記法
map2 = %{"name" => "yamato", age: 26}

#アトムの簡易記法
map3 = %{name: "yamato", age: 26}

#アトムの通常記法＋アトムの簡易記法
map4 = %{:name => "yamato", age: 26}

#エラーケース
#アトムの簡易記法+アトムの通常記法
#map5 = %{name: "yamato", :age => "26"}

IO.inspect(map1)
IO.inspect(map2)
IO.inspect(map3)
IO.inspect(map4)
#IO.inspect(map5)