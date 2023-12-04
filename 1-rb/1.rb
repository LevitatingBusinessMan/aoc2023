$lines = File.read("input").lines

$dic = {
    "one": "1",
    "two": "2",
    "three": "3",
    "four": "4",
    "five": "5",
    "six": "6",
    "seven": "7",
    "eight": "8",
    "nine": "9",
    "1": "1",
    "2": "2",
    "3": "3",
    "4": "4",
    "5": "5",
    "6": "6",
    "7": "7",
    "8": "8",
    "9": "9",
}

def part n
    sum = 0
    for line in $lines
        first = last = nil
        for i in 0..line.length-1
            for key, val in $dic
                next if key.length > 1 and n == 1
                if line[i..].start_with? key.to_s
                    first = val if first.nil?
                    last = val
                end
            end
        end
        sum += [first, last].join.to_i
    end
    return sum
end

puts "Part 1: #{part 1}"
puts "Part 2: #{part 2}"
