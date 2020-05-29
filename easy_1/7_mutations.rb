class DNA
  def initialize(strand)
    @strand = strand
    @length = strand.length
  end

  def hamming_distance(comparison)
    @length < comparison.length ? shorter = @strand : shorter = comparison
    counter = 0
    shorter.length.times do |index|
      counter +=1 unless @strand[index] == comparison[index]
    end
    counter
  end

 
end
