class Hashlist
  def initialize
    @hash = {}
    @tail_index = 0

    define_enumerables!
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
    case val.class.to_s
    when "Hashlist"
      values + val.values
    else
      raise_type_error!(val)
    end
  end

  def &(val)
    case val.class.to_s
    when "Hashlist"
      values & val.values
    else
      raise_type_error!(val)
    end
  end

  def *(val)
    case val.class.to_s
    when "String"
      values.join(val)
    when "Integer"
      values * val
    else
      raise_type_error!(val)
    end
  end

  protected

  def values
    @hash.values
  end

  private

  def _add_(val, index=@tail_index)
    @hash[index] = val
    @tail_index += 1
    val
  end

  def _get_(index)
    @hash[index]
  end

  def raise_type_error!(val)
    raise TypeError, "no implicit conversion of #{val.class} into #{self.class}"
  end

  def define_enumerables!
    enumerables.each do |enum|
      self.class.send(:define_method, enum) { values.send(enum) }
    end
  end

  def enumerables
    [
      :all?, :any?, :bsearch, :bsearch_index, :chunk,
      :chunk_while, :collect, :collect_concat, :count,
      :cycle, :detect, :drop, :drop_while, :each,
      :each_cons, :each_entry, :each_slice,
      :each_with_index, :each_with_object, :entries,
      :find, :find_all, :find_index, :first,
      :flat_map, :grep, :grep_v, :group_by, :include?,
      :inject, :lazy, :map, :max, :max_by, :member?,
      :min, :min_by, :minmax, :minmax_by, :none?,
      :one?, :partition, :reduce, :reject,
      :reverse_each, :select, :slice_after,
      :slice_before, :slice_when, :sort, :sort_by,
      :sum, :take, :take_while, :to_a, :to_h, :uniq, :zip
    ]
  end
end
