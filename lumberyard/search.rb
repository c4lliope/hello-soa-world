class Search
  def initialize criteria
    @criteria = criteria
  end

  def self.for criteria
    Search.new criteria
  end

  def for new_criteria
    Search.new criteria.merge new_criteria
  end

  def self.not criteria
    negative_criteria = Hash[criteria.map{|k,val| [k,negativize(val)] } ]
    Search.for negative_criteria
  end

  def not new_criteria
    negative_criteria = Hash[new_criteria.map{|k,val| [k,negativize(val)] } ]
    Search.new criteria.merge negative_criteria
  end

  def filter records
    records.select do |record|
      @criteria.reduce(true) do |match, (key, val)|
        match && record.details[key].to_s =~ /#{val}/i
      end
    end
  end

  private
  attr_reader :criteria

  def self.negativize val
    "(?!#{val})\\A.*\\z"
  end

  def negativize val
    Search.negativize val
  end
end
