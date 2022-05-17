require '../week5/substring/sub_string'
require 'faker'
ERROR_MESSAGE = 'every input value must be string'

describe SubString do
  it 'check which word is part of substring' do
    substring = %w[below down go going horn how howdy it i low part partner sit]
    answer = { 'below' => 1, 'low' => 1 }
    expect(SubString.new('below', substring).call.sort).to eq answer.sort
  end

  it 'check if long string contain words from substring' do
    substring = %w[below down go going horn how howdy it i low own part partner sit]
    answer = {
      'down' => 1, 'go' => 1, 'going' => 1, 'how' => 2, 'howdy' => 1, 'it' => 2,
      'i' => 3, 'own' => 1, 'part' => 1, 'partner' => 1, 'sit' => 1
    }
    input = "Howdy partner, sit down! How's it going?"
    output = SubString.new(input, substring).call
    expect(output.sort).to eq answer.sort
  end

  it 'check when input string is empty' do
    substring = %w[below down go going horn ho it i low own pt partner sit]
    input = ''
    output = SubString.new(input, substring).call
    answer = {}
    expect(output).to eq answer
  end

  it 'return error if directory is include only string' do
    substring = ['sdjn', 'rmsd,n', 1, 'esj,dn']
    input = 's'
    expect(SubString.new(input, substring).call).to eq ERROR_MESSAGE
  end

  it 'return error if input string is not string' do
    substring = ['sdjn', 'rmsd,n', 'esj,dn']
    input = 1
    expect(SubString.new(input, substring).call).to eq ERROR_MESSAGE
  end

  it 'return error when input string and directory contain integer' do
    substring = ['sdjn', 1, 'rmsd,n', 'esj,dn']
    input = 1
    expect(SubString.new(input, substring).call).to eq ERROR_MESSAGE
  end

  it 'when input string is one symbol' do
    substring = ['sdjn', 'rmsd,n', 'esj,dn']
    input = 's'
    answer = {}
    expect(SubString.new(input, substring).call).to eq answer
  end

  it 'when directory contain same words' do
    substring = ['ss', 'ss', 'esj,dn']
    input = 'sshh'
    answer = { 'ss' => 1 }
    expect(SubString.new(input, substring).call.sort).to eq answer.sort
  end
end
