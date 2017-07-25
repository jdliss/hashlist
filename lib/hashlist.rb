class Hashlist
  def initialize
    @hash = {}
  end

  def <<(val)
    add(val)
  end

  def [](index)
    _get_(index)
  end

  def []=(index, val)
    _add_(val, index)
  end

  def add(val)
    _add_(val)
  end

  def get(index)
    _get_(index)
  end

  def to_s
    values.join("\n")
  end

  def inspect
    values
  end

  def +(val)
    if val.is_a?(Hashlist)
      values + val.values
    else
      raise TypeError, "no implicit conversion of #{val.class} into #{self.class}"
    end
  end

  protected

  def values
    @hash.values
  end

  private

  def _add_(val, index=keys.max + 1)
    @hash[index] = val
  end

  def _get_(index)
    @hash[index]
  end

  def keys
    @hash.keys.empty? ? [-1] : @hash.keys
  end

end
