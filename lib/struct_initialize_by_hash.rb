class Struct

  def self.initialize_by_hash(h)
    return h.map{ |single_hash| initialize_by_hash(single_hash) } if h.is_a? Array

    new(*h.with_indifferent_access.values_at(*members))
  end

end