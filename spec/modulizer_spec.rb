require 'spec_helper'

describe Modulizer do
  it 'has a version number' do
    expect(Modulizer::VERSION).not_to be nil
  end

  it 'build scoped style right' do
    raw = """
    a b c {
      color: red;
      xxx: yyyy yyyy;
    }
    """

    result = Modulizer::StyleBuilder.build("my_mod", raw, {"scoped" => true})
    puts result

    expect(result).to eq("\ndiv#my_mod a b c {color: red; xxx: yyyy yyyy;}\n")
  end

  it 'build unscoped style right' do
    raw = """
    a b c {
      color: red;
      xxx: yyyy yyyy;
    }
    """

    result = Modulizer::StyleBuilder.build("my_mod", raw, {})
    puts result

    expect(result).to eq("\na b c {color: red; xxx: yyyy yyyy;}\n")
  end
end
