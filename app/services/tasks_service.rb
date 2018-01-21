class TasksService

  def get_result(params)
    params.each_value do |number|
      return nil unless number.match(/-?\d+(\.\d+)?/).to_s == number
    end
    if params['d'].nil?
      line_solution(params['a'].to_f, params['b'].to_f, params['c'].to_f)
    else
      square_solution(params['a'].to_f, params['b'].to_f,
                      params['c'].to_f, params['d'].to_f)
    end
  end

  # ax + b = c
  def line_solution(a, b, c)
    return [] if a.zero?
    [(c - b) / a]
  end

  # ax^2 + bx + c = d
  def square_solution(a, b, c, d)
    if a.zero?
      line_solution(b, c, d)
    else
      discriminant = b**2 - 4 * a * c
      return [] if discriminant < 0
      x1 = (- b + Math.sqrt(discriminant)) / (2 * a)
      x2 = (- b - Math.sqrt(discriminant)) / (2 * a)
      return [x1] if x1 == x2
      [x1, x2]
    end
  end
end
