def roll(sides)
return rand(sides) + 1  
end




$statlist = ['STR', 'DEX', 'CHA', 'INT', 'WIS', 'CON'] 

def statroll() 
stathash = {} 
    for stat in $statlist 
        rolls = 0
        for i in (1..3)
            rolls =  rolls + roll(6) 
        end
        stathash[stat] = rolls  
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

