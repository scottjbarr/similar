require "similar/version"

module Similar

  # Calculate the pearson score for the values in two Arrays.
  #
  # Each Array must contain the same number of elements.
  def self.pearson_score(a, b)
    n = a.length

    # There is nothing to compare.
    return 0 unless n > 0

    raise ArgumentError.new("Arrays not of equal length") if n != b.length

    # There is a case with pearson score, where if the two arrays
    # are exactly the same it returns 0, when really the score should be 1.0
    # as there is an exact correlation between the values.
    #
    # Zero is returned in this case because determining the difference between
    # points shows that there is no difference at all... zero.
    #
    # I am returning 1.0 to show extremely high similarity.
    return 1.0 if a == b

    # sum of the values
    sum_1 = a.inject(0) { |sum, c| sum + c }
    sum_2 = b.inject(0) { |sum, c| sum + c }

    # sum of the squares
    sum_1_sq = a.inject(0) { |sum, c| sum + c ** 2 }
    sum_2_sq = b.inject(0) { |sum, c| sum + c ** 2 }

    # sum of the product
    prod_sum = a.zip(b).inject(0) { |sum, ab| sum + ab[0] * ab[1] }

    # calculate the Pearson score
    num = prod_sum - (sum_1 * sum_2 / n)
    den = Math.sqrt((sum_1_sq - (sum_1 ** 2) / n) * (sum_2_sq - (sum_2 ** 2) / n))

    return 0 if den == 0

    num / den.to_f
  end

  def self.euclidean_distance(a, b)
    # sum, of the squares of the differences...
    sum = a.zip(b).map { |x, y| ( (x - y) ** 2) }.inject(:+)
    1 / (1+ sum)
  end

end
