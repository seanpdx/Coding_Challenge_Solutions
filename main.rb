#!/usr/bin/env ruby

@remainder = [] # stores one or two words left at end of line
@sequence_hash = {}

while input = ARGF.gets
  # ARGF can receive input from arguments or the pipe
  #This reference was most handy: http://robm.me.uk/ruby/2013/12/03/argf-ruby.html


  input.each_line do |line|
    input_array = line.gsub(/[^-a-zA-Z0-9]/, ' ').split
    while input_array.size >= 3

      if !@remainder.empty?
        # since one or two words was left from the previous line, we insert it at the beginning of the new line's array
        input_array.insert(0, @remainder)
        input_array.flatten!
        @remainder = []
      end
      # Sliding Windows approach:
      seq_string = input_array[0].downcase + " " + input_array[1].downcase + " " + input_array[2].downcase
      input_array.delete_at(0)
      #Hash the string to create its key
      seq_hash_key = seq_string.hash
      # check to see if that hash value exists and increment if it does
      if @sequence_hash.has_key?(seq_hash_key)
        @sequence_hash[seq_hash_key][:seq_count] = @sequence_hash[seq_hash_key][:seq_count] + 1

      else
        # this sequence does not exist in the hash, so it needs to be added.
        seq_hash_value = {:string => seq_string, :seq_count => 0}
        @sequence_hash.merge!({seq_hash_key => seq_hash_value})
      end


    end
    if !input_array.empty?
      # one or two words are left in the array, these will be added to the beginning of the new input_array
      @remainder = input_array
    end

  end

end

# use ruby's  hash sorting by value
@sorted_array = @sequence_hash.sort_by { |k, v| v[:seq_count] }


if @sorted_array.length < 100
  max_print_index = @sorted_array.size
else
  max_print_index = 100
end
print_index = 1 #since starting at end of array


while (print_index <= max_print_index)
 # @sorted_array[@sorted_array.length - 1] has the sequence with the most repetitions.
  print_str = @sorted_array[@sorted_array.length - print_index][1][:seq_count].to_s + " - " + @sorted_array[@sorted_array.length - print_index][1][:string].to_s + "\n"
  puts print_str
  print_index = print_index + 1
end




