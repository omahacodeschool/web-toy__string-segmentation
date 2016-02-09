require_relative "dictionary.rb"

class StringSegmenter

  def initialize
    @test_arr  = Array.new
    @valid_arr = Array.new
    @this_many = 1
  end

  def run_string_segmenter(string_to_segment)
    @str = string_to_segment
    @start_arr = @str.chars
    empty_str?
    until_empty_start_arr
  end

  def empty_str?
    if @str.empty?
      nil
    end
  end

  def until_empty_start_arr
    until @start_arr.empty?
      start_arr_true
      if test_arr_single
      else
         test_arr_nested
         test_arr_dangler
      end
      @this_many = 1
      @start_arr.shift(@valid_arr[-1].length.to_i)
    end
    @valid_arr
  end  
        
  def start_arr_true
    while @start_arr.length >= @this_many
      str_section = @start_arr.take(@this_many).join

      if valid_word?(str_section)
        @test_arr << str_section
      end  
      @this_many += 1
    end
  end

  def test_arr_single
    if @test_arr.length == 1
      @valid_arr << @test_arr.shift
    end
  end

  def test_arr_nested
    @this_many = 1
    @str_loc = @test_arr[0].length

    while @start_arr[@str_loc..-1].length >= @this_many
      @new_section = @start_arr[@str_loc..-1].take(@this_many).join
      
      if valid_word?(@new_section)
        @valid_arr << @test_arr.shift
        @test_arr.clear
        break
      end

      @this_many += 1
    end
  end

  def test_arr_dangler       
    if @test_arr.length > 0
      @valid_arr << @test_arr.pop
      @test_arr.clear
      else
    end
  end
end