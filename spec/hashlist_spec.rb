require 'hashlist'

RSpec.describe Hashlist do

  let(:hashlist) { described_class.new }

  let(:enumerables) {
    [
      :all?, :any?, :chunk, :chunk_while,
      :collect, :collect_concat, :count, :cycle,
      :detect, :drop, :drop_while, :each,
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
  }

  it "can be initialized" do
    expect { Hashlist.new }.not_to raise_error
  end

  it "can shovel values" do
    hashlist << "test"
    expect(hashlist[0]).to eq("test")
  end

  it "can get value at index using braket notation" do
    hashlist << "test"
    expect(hashlist[0]).to eq("test")
  end

  it "can set value at index using bracket notation" do
    hashlist[0] = "test"
    expect(hashlist[0]).to eq("test")
  end

  it "can add values to list" do
    hashlist.add("test")
    expect(hashlist[0]).to eq("test")
  end

  it "can get values at index" do
    hashlist.add("test")
    expect(hashlist.get(0)).to eq("test")
  end

  it "can add hashlists" do
    hashlist << "test"
    expect(hashlist + hashlist).to eq(["test", "test"])
  end

  it "raises Type error when trying to add with different class" do
    msg = "no implicit conversion of Array into #{described_class}"
    expect { hashlist + [] }.to raise_error(TypeError, msg)
  end

  it "has a to_s method" do
    expect(hashlist.to_s).to eq("")
    hashlist << "test"
    hashlist << "testing"
    expect(hashlist.to_s).to eq("test\ntesting")
  end

  it "has an inspect method" do
    expect(hashlist.inspect).to eq([])
    hashlist << "test"
    hashlist << "testing"
    expect(hashlist.inspect).to eq(["test", "testing"])
  end

  it "has set intersection" do
    hashlist << "testing"
    hashlist << "test"
    hl = Hashlist.new
    hl << "test"
    hl << "other test"

    expect(hashlist & hl).to eq(["test"])
  end

  it "has * method" do
    hashlist << "testing"
    hashlist << "test"
    expect(hashlist * 2).to eq(["testing", "test", "testing", "test"])
  end

  it "has enumerables" do
    hashlist << "testing"
    hashlist << "test"

    enumerables.each do |e|
      expect(hashlist.respond_to?(e)).to be_truthy
    end
  end
end
