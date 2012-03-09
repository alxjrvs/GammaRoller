def dice(sides)
return rand(sides) + 1  
end


def roller(num) 
rolls = 0 
    for i in (1..num)
    rolls = rolls + dice(6)  
    
    end

puts rolls
return rolls
end


$statlist = ['STR', 'DEX', 'CHA', 'INT', 'WIS', 'CON'] 

def statroll() 
    stathash = {}
    for stat in $statlist 
        stathash[stat] = roller(3)
        puts stat.to_s + " is " + stathash[stat].to_s
    end 

stathash.each {|key, value| puts "#{key} is #{value}" }
end

class Origin
    attr_accessor :name, :desc

    def initialize(name, desc)
        @name = name
        @desc = desc
    end
end

