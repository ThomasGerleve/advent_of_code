input = "4134384626
7114585257
1582536488
4865715538
5733423513
8532144181
1288614583
2248711141
6415871681
7881531438"

test_input = "5483143223
2745854711
5264556173
6141336146
6357385478
4167524645
2176841721
6882881134
4846848554
5283751526"

coords = {}
array_of_rows = input.split("\n")
array_row_of_numbers = array_of_rows.map(&:chars)
array_row_of_numbers.each_with_index do |row, index_column|
  row.each_with_index do |num, index_row|
    coords["x#{index_row}y#{index_column}"] = num.to_i
  end
end

def start_plus_one(coords)
  coords.each do |key, value|
    coords[key] += 1
  end
end

def plus_adjacent(coord, coords, fired_coords)
  x_value = coord.scan(/(?<=x)\d+/)[0].to_i
  y_value = coord.scan(/(?<=y)\d+/)[0].to_i
  top_left = "x#{x_value - 1}y#{y_value - 1}"
  top = "x#{x_value}y#{y_value - 1}"
  top_right = "x#{x_value + 1}y#{y_value - 1}"
  right = "x#{x_value + 1}y#{y_value}"
  low_right = "x#{x_value + 1}y#{y_value + 1}"
  low = "x#{x_value}y#{y_value + 1}"
  low_left = "x#{x_value - 1}y#{y_value + 1}"
  left = "x#{x_value - 1}y#{y_value}"
  if coords.has_key?(top_left)
    coords[top_left] += 1 unless fired_coords.include?(top_left)
    flash(top_left, coords, fired_coords) if coords[top_left] > 9
  end
  if coords.has_key?(top)
    coords[top] += 1 unless fired_coords.include?(top)
    flash(top, coords, fired_coords) if coords[top] > 9
  end
  if coords.has_key?(top_right)
    coords[top_right] += 1 unless fired_coords.include?(top_right)
    flash(top_right, coords, fired_coords) if coords[top_right] > 9
  end
  if coords.has_key?(right)
    coords[right] += 1 unless fired_coords.include?(right)
    flash(right, coords, fired_coords) if coords[right] > 9
  end
  if coords.has_key?(low_right)
    coords[low_right] += 1 unless fired_coords.include?(low_right)
    flash(low_right, coords, fired_coords) if coords[low_right] > 9
  end
  if coords.has_key?(low)
    coords[low] += 1 unless fired_coords.include?(low)
    flash(low, coords, fired_coords) if coords[low] > 9
  end
  if coords.has_key?(low_left)
    coords[low_left] += 1 unless fired_coords.include?(low_left)
    flash(low_left, coords, fired_coords) if coords[low_left] > 9
  end
  if coords.has_key?(left)
    coords[left] += 1 unless fired_coords.include?(left)
    flash(left, coords, fired_coords) if coords[left] > 9
  end
end

def flash(coord, coords, fired_coords)
  unless fired_coords.include?(coord)
    $sum_of_flashes += 1
    fired_coords << coord
    coords[coord] = 0
    plus_adjacent(coord, coords, fired_coords)
  end
end

def one_round(coords)
  fired_coords = []
  start_plus_one(coords)
  coords.select { |coord, value| value > 9 }.each { |coord, value| flash(coord, coords, fired_coords) }
end
$sum_of_flashes = 0
100.times { one_round(coords) }
p $sum_of_flashes
