require_relative '../search'

describe Search do
  it 'handles exact searches' do
    records = [{name: 'bob'}, {name: 'joe'}]
    search = Search.for name: 'bob'
    expect(search.filter records).to eq([{name: 'bob'}])
  end

  it 'handles partial searches' do
    records = [{name: 'bob', age: 20}, {name: 'joe', age: 20}]
    search = Search.for name: 'bob'
    expect(search.filter records).to eq([{name: 'bob', age: 20}])
  end

  it 'handles searching for partial terms' do
    records = [{name: 'Johnny'}, {name: 'jon'}]
    search = Search.for name: 'john'
    expect(search.filter records).to eq([{name: 'Johnny'}])
  end

  it 'returns all records if there are no criteria' do
    records = [{name: 'bob'}]
    search = Search.for({})
    expect(search.filter records).to eq([{name: 'bob'}])
  end

  it 'must match all criteria' do
    records = [{name: 'bob', age: 20}]
    search = Search.for({name: 'bob', age: 21})
    expect(search.filter records).to eq []
  end

  it 'accepts negative search criteria' do
    records = [{name: 'bob'}, {name: 'joe'}]
    search = Search.not({name: 'bob'})
    expect(search.filter records).to eq([{name: 'joe'}])
  end

  it 'can combine negative and positive search criteria' do
    records = [{name: 'bob', age: 21},
      {name: 'bob', age: 20},
      {name: 'joe', age: 21}]
    search = Search.for(name: 'bob').not(age: 20)
    expect(search.filter records).to eq [{name: 'bob', age: 21}]
  end

  it 'can combine positive and negative search criteria' do
    records = [{name: 'bob', age: 21},
      {name: 'bob', age: 20},
      {name: 'joe', age: 21}]
    search = Search.not(age: 20).for(name: 'bob')
    expect(search.filter records).to eq [{name: 'bob', age: 21}]
  end

  it 'searches the hash representation of objects' do
    goal = double(to_h: {name: 'bob'})
    records = [goal]
    search = Search.for(name: 'bob')
    expect(search.filter records).to eq [goal]
  end
end
