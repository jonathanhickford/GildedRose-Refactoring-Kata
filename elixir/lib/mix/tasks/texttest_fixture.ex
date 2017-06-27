defmodule Mix.Tasks.Texttest.Fixture do
  use Mix.Task

  @shortdoc "Generate TextTest compatible output"
  def run(args) do
    IO.puts "OMGHAI!"

    items = [
      %Item{name: "+5 Dexterity Vest", sell_in: 10, quality: 20},
      %Item{name: "Aged Brie", sell_in: 2, quality: 0},
      %Item{name: "Elixir of the Mongoose", sell_in: 5, quality: 7},
      %Item{name: "Sulfuras, Hand of Ragnaros", sell_in: 0, quality: 80},
      %Item{name: "Sulfuras, Hand of Ragnaros", sell_in: -1, quality: 80},
      %Item{name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 15, quality: 20},
      %Item{name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 10, quality: 49},
      %Item{name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 5, quality: 49},
      # This Conjured item does not work properly yet
      %Item{name: "Conjured Mana Cake", sell_in: 3, quality: 6} # <-- :O
    ]

    days = args
      |> extract_first_argument()
      |> convert_argument_to_integer()
 
    itterate_over_days(items, 0, days)
  end
  
  defp extract_first_argument(args) do
    cond do
      length(args) > 0 -> List.first(args)
      true -> "1"
    end
  end

  defp convert_argument_to_integer(first_argument) do
    case Integer.parse(first_argument) do
      {x, ""}  when is_integer(x) -> x
      _ -> 1
    end
  end

  defp itterate_over_days(items, day, max_days) when day >= max_days do
    display_day(items, day)
  end

  defp itterate_over_days(items, day, max_days) do
    display_day(items, day)
    itterate_over_days(GildedRose.update_quality(items), day + 1, max_days)
  end

  defp display_day(items, day) do
    IO.puts "-------- day #{day} --------"
    IO.puts "name, sellIn, quality"
    Enum.each(items, fn(item) ->
        IO.puts "#{item.name}, #{item.sell_in}, #{item.quality}"
      end)
    IO.puts ""
  end

end