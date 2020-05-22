class Translation
  DICTIONARY = {
  'Methionine'    => ['AUG'],
  'Phenylalanine' => ['UUU', 'UUC'],
  'Leucine'       => ['UUA', 'UUG'],
  'Serine'        => ['UCU', 'UCC', 'UCA', 'UCG'],
  'Tyrosine'      => ['UAU', 'UAC'],
  'Cysteine'      => ['UGU', 'UGC'],
  'Tryptophan'    => ['UGG'],
  'STOP'          => ['UAA', 'UAG', 'UGA']
  }

  def self.of_codon(three_letters)
    DICTIONARY.select {|_, v| v.include?(three_letters)}.keys.first
  end


  def self.of_rna(letters)
    raise InvalidCodonError unless valid?(letters)
    
    letters.scan(/.{3}/).each_with_object([]) do |letters, arr|
      return arr if DICTIONARY['STOP'].include?(letters)
      arr << of_codon(letters)
    end
  end

  private

  def self.valid?(letters)
    letters.scan(/.{3}/).each do |three|
      return false unless DICTIONARY.values.any? do |v|
        v.include?(three)
      end
    end
    true
  end
end


class InvalidCodonError < StandardError
end
