require "similar/version"

# Provide implementation of various methods for comparing arrays of data to
# quantify similarity.
module Similar
  # Calculate the pearson score for the values in two Arrays.
  #
  # Each Array must contain the same number of elements.
  def self.pearson_score(a, b)
    # There is nothing to compare if either of the arrays are empty
    return 0 if a.length + b.length == 0

    raise ArgumentError.new('Array lengths not equal') if a.length != b.length

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
    sum_1 = a.inject(:+)
    sum_2 = b.inject(:+)

    # sum of the squares
    sum_1_sq = a.map { |n| n ** 2.0 }.inject(:+)
    sum_2_sq = b.map { |n| n ** 2.0 }.inject(:+)

    # sum of the product
    prod_sum = a.zip(b).map { |ab| ab[0] * ab[1] }.inject(:+)

    # calculate the Pearson score
    n = a.length
    num = prod_sum - (sum_1 * sum_2 / n)
    den = Math.sqrt((sum_1_sq - (sum_1 ** 2) / n) * (sum_2_sq - (sum_2 ** 2) / n))

    return 0 if den == 0

    num / den.to_f
  end

  # Calculate the distance between two Arrays of values.
  #
  # Distance is inverted, so higher values are better.
  def self.euclidean_distance(a, b)
    # sum, of the squares of the differences
    sum = a.zip(b).map { |x, y| ((x - y) ** 2) }.inject(:+)
    1 / (1 + sum)
  end
end
