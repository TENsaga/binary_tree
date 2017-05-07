# Extremely basic hardcoded print used to visualize 3 layer tree
# Full tree links of any size can be viewed by calling Node.all
module BasicView
  def basic_view(view)
    return nil if view.size > 7
    builder
    swap(view)
    printer
  end

  def builder
    @visual = []
    3.times do
      @visual << Array.new(40, " ")
    end
  end

  # Gross, I know
  def swap(view)
    coordinates = [[0, 19], [1, 8], [2, 2], [2, 14], [1, 30], [2, 24], [2, 36]]
    view.each.with_index do |x, index|
      @visual[coordinates[index][0]][coordinates[index][1]] = x
    end
  end

  def printer
    3.times do |x|
      40.times do |y|
        print @visual[x][y]
      end
      print "\n"
    end
  end
end
