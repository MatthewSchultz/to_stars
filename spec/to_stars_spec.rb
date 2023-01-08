# frozen_string_literal: true

RSpec.describe ToStars do
  it 'has a version number' do
    expect(ToStars::VERSION).not_to be nil
  end

  it 'displays stars' do
    expect(3.stars).to eq('★★★')
  end

  it 'handles characters' do
    expect(3.stars(character: 'b')).to eq('bbb')
  end

  it 'displays stars with out of' do
    expect(3.stars(out_of: 5)).to eq('★★★/5')
  end

  it 'handles seperators' do
    expect(3.stars(out_of: 5, seperator: ' out of ')).to eq('★★★ out of 5')
  end

  it 'supports out of formats' do
    expect(3.stars(out_of: 5, out_of_format: :one_and_numeric)).to eq('★★★/5★')
    expect(3.stars(out_of: 5, out_of_format: :character)).to eq('★★★/★★★★★')
  end

  it 'supports configuration' do
    ToStars.character = '◯'
    ToStars.seperator = ' of '
    ToStars.out_of = 6
    ToStars.out_of_format = :numeric

    expect(2.stars).to eq('◯◯ of 6')
  end
end
