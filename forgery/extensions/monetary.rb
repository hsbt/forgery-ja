# encoding: utf-8
# Extensions Forgery::Monetary
class Forgery::Monetary
  # @param Hash options
  # @option options [Integer] :max (1000) 金額の最大値
  # @option options [Integer] :min (0) 金額の最小値
  # @return String :max - :minの間の数値に[円]を付与して返します
  def self.ja_formatted_money(options={})
    "%d円" % ja_money(options)
  end

  # @params Hash options
  # @option options [Fixnum] :max (1000) 金額の最大値
  # @option options [Fixnum] :min (0) 金額の最小値
  # @return Fixnum
  def self.ja_money(options={})
    options = {:max => 1000,
               :min => 0}.merge(options)

    (options[:min]..options[:max]).random
  end

  # popularity in Japan
  # @params Hash options
  # @option options [Fixnum] :digit (4) 金額の桁
  # @return Fixnum
  def self.ja_popularity_money(options={})
    # TODO Popularityではない。適当過ぎる
    options = {:digit => 4}.merge(options)
    base_money = (1..9).random * (10 ** (options[:digit] - 1) )
    return base_money if options[:digit] < 3
    base_money + 98 * (10 ** (options[:digit] - 3))
  end
end
