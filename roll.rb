$statlist = ['STR', 'DEX', 'CHA', 'INT', 'WIS', 'CON'] 

# Roll a D(sides) size die. 
def D(sides)
return rand(sides) + 1  
end


# Rolls a number of dice of particular sizes.
def rollmany(dice, sides) 
    rolls = 0 
    for i in (1..dice)
        rolls = rolls + D(sides)
    end
return rolls
end


#This iterates through the Stat list and turns each stat into a key. It then rolls 3 d6's to get the starting value for that stat.
def statroll() 
stathash = {} 
    for stat in $statlist 
        stathash[stat] = rollmany(3, 6) 
    end 
#prints the new hash 
stathash.each {|key, value| puts "#{key} is #{value}" }
end


#Class, what the hell are you doing here? No, It's okay. I'll move you later. 

class Origin
    attr_accessor :name, :desc

    def initialize(name, desc)
        @name = name
        @desc = desc
    end
end


class PC 
    class_accessor :name, :primo, :seco
    def initialize(name, primo, seco) 
        @name = name
        @primo = primo
        @seco = seco
    end
end

class Test
    attr_accessor :stats

    def initialize()
        @stats = statroll()
    end
end

def startup()
    seismic = Origin.new("Seismic", "Rock Guy") 
    android = Origin.new("Android", "Robot")
    mark = PC.new("Mark", android, seismic)

end
