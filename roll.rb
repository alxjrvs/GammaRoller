$statlist = ['STR', 'DEX', 'CHA', 'INT', 'WIS', 'CON'] 

# Roll a D(sides) size die. 
def rollD(sides)
return rand(sides) + 1  
end


# Rolls a number of dice of particular sizes.
def rollmanyD(dice, sides) 
    rolls = 0 
    for i in (1..dice)
        rolls = rolls + rollD(sides)
    end
return rolls
end

def modstat(r)
modlist = []
    if r == 3
        modlist = [r, -4]
    elsif (4..5).include? r
        modlist = [r, -3]
    elsif (6..7).include? r
        modlist = [r, -2]
    elsif (8..9).include? r
        modlist = [r, -1]
    elsif (10..11).include? r
        modlist = [r, 0]
    elsif (12..13).include? r
        modlist = [r, 1]
    elsif (14..15).include? r
        modlist = [r, 2]
    elsif (16..17).include? r
        modlist = [r, 3]
    elsif  r == 18
        modlist = [r, 4]
    else 
        puts "nothing"
    end
    return modlist
end

    

#This iterates through the Stat list and turns each stat into a key. It then rolls 3 d6's to get the starting value for that stat.
def statroll() 
stathash = {} 
    for stat in $statlist 
        stathash[stat] = modstat(rollmanyD(3, 6)) 
    end 
    return stathash
#prints the new hash 
#stathash.each {|key, value| puts "#{key} is #{value}" }
end


#Classes, what the hell are you doing here? No, It's okay. I'll move you later. 

class Origin
    attr_accessor :name, :desc

    def initialize(name, desc)
        @name = name
        @desc = desc
    end
    def self.randO()
        found = []
        ObjectSpace.each_object(Origin) { |o|
        found << o}
        
        return found[rand(found.size)]
    end
end

class PC 
    attr_accessor :name, :primo, :seco, :stats

    def initialize(name) 
        @name = name
        @primo = Origin.randO() 
        @seco = Origin.randO()
        @stats = statroll()
    end
end


#This line is going to be important later.
#stat[0], stat[0][0], stat[0][1] 


def startup()
    $seismic = Origin.new("Seismic", "Rock") 
    $android = Origin.new("Android", "Robot")
    $a = PC.new("Alex")
    return $a
end

