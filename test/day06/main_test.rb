# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../../lib/day06/main'

describe 'GroupResponses' do
  describe '#log_answers' do
    def setup
      @resps = GroupResponses.new
    end
    it 'counts a solo group' do
      @resps.log_answers('abc')

      assert 3, @resps.yeses
    end

    it 'counts a multi group' do
      @resps.log_answers('a')
      @resps.log_answers('b')
      @resps.log_answers('c')

      assert 3, @resps.yeses
    end

    it 'counts a multi group with repeat answers' do
      @resps.log_answers('ab')
      @resps.log_answers('ac')

      assert 2, @resps.yeses
    end

    it 'counts a multi group with very repeated answers' do
      @resps.log_answers('a')
      @resps.log_answers('a')
      @resps.log_answers('a')
      @resps.log_answers('a')

      assert 1, @resps.yeses
    end

    it 'counts a solo group with a single answer' do
      @resps.log_answers('b')

      assert 1, @resps.yeses
    end
  end
end

describe 'GroupResponses2' do
  describe '#log_answers' do
    def setup
      @resps = GroupResponses2.new
    end
    it 'counts a solo group' do
      @resps.log_answers('abc')

      assert 3, @resps.yeses
    end

    it 'counts a multi group' do
      @resps.log_answers('a')
      @resps.log_answers('b')
      @resps.log_answers('c')

      assert 0, @resps.yeses
    end

    it 'counts a multi group with repeat answers' do
      @resps.log_answers('ab')
      @resps.log_answers('ac')

      assert 1, @resps.yeses
    end

    it 'counts a multi group with very repeated answers' do
      @resps.log_answers('a')
      @resps.log_answers('a')
      @resps.log_answers('a')
      @resps.log_answers('a')

      assert 1, @resps.yeses
    end

    it 'counts a solo group with a single answer' do
      @resps.log_answers('b')

      assert 1, @resps.yeses
    end
  end
end
