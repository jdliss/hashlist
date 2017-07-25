require 'hashlist'

RSpec.describe Hashlist do

  let(:hashlist) { described_class.new }

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
end
