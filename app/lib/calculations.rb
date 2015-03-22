module Calculations

  module_function

  def spread sequence_of_pairs, _x: :first.to_proc, _y: :second.to_proc
    sequence_of_pairs.each_cons(2).map do |p1, p2|
      [
        p2.try(&_x),
        (p2.try(&_y) - p1.try(&_y)),
      ]
    end
  end


  def zip_serieses_by_abscissa *serieses, _x: :first.to_proc, _y: :second.to_proc
    unique_abscissa = serieses.flat_map{|series| series.map(&_x)}.uniq.sort
    unique_abscissa.map do |x|
      [x] + serieses.map do |series|
        y = series.find{|el| el.try(&_x) == x}.try(&_y)
        series.delete y
        y
      end
    end
  end

end
