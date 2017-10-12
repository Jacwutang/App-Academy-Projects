require 'program'
require 'rspec'

RSpec.describe "TDD" do



  describe "my_uniq" do
    let(:a) {[1, 2, 1, 3, 3]}

    it "doesnt modify original arr" do
      a.my_uniq
      expect(a).to eq (a)
    end

    it "runs uniq method" do
      expect(a.my_uniq).to_not eq (a)
    end

    it "returns an array" do
      expect(a.my_uniq).to be_a(Array)
    end
  end

  describe "two_sum" do
    let(:b) { [-1, 0, 2, -2, 1] }
    it "returns an array" do
      expect(b.two_sum).to be_a(Array)
    end

    it "correctly returns pairs that sum to two" do
      expect(b.two_sum).to eq([[0,4], [2,3]])
    end

    it "correctly returns the pairs in dictionary order" do
      c = b.two_sum
      expect(c[0][0]).to be <= c[1][0]
    end
  end

  describe "my_transpose" do
    let(:rows) { [[0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]]}

    let(:cols) { [[0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]]}

    it "checks for square arrays"   do
      expect(rows.length).to eq(cols.length)
    end

    it "correctly tranposes" do
      expect(rows.my_transpose). to eq(rows.transpose)

    end

  end

  describe "stock_picker" do
    let(:prices) {[1,5,24,6,23,6,8,2]}

    it "correctly selects the pair of days" do
      expect(prices.stock_picker).to eq([0,2])
    end

    it "will not return an pair of days with a negative difference" do
      days = prices.stock_picker
      expect(prices[days[0]] - prices[days[1]]).to be < 0
    end

    it "produced an error if passed an array of non numbers" do
      string_arr = ["a", "b","c","is"]
      expect {string_arr.stock_picker}.to raise_error
    end

  end





end
