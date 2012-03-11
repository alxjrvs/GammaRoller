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
    case r
    when 3
       modlist = [r, -4]
    when (4..5) 
       modlist = [r, -3]
    when (6..7)
       modlist = [r, -2]
    when (8..9)
       modlist = [r, -1]
    when (10..11)
       modlist = [r, 0]
    when (12..13)
       modlist = [r, 1]
    when (14..15)
       modlist = [r, 2]
    when (16..17)
       modlist = [r, 3]
    when 18
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
        if o.name == "Engineered Human"
            next
        else
        found << o
        end
        }
        
            
        return found[rand(found.size)]
    end
end

class PC 
    attr_accessor :name, :primo, :seco, :stats
    #Now it does random origins - but how do I make it so that there are no duplicates, to create the 
    def initialize(name) 
        @name = name
        @primo = Origin.randO() 
        @seco = Origin.randO()
        if self.primo == self.seco
            self.seco = $engineered
        end
        @stats = statroll()
    end
end

class Power
        attr_accessor :name, :level, :origin, :use, :type, :act, :range, :target, :attack, :hit

    def initialize(name, level, origin, use, type, act, range, target, attack, hit) 
        @name = name
        @level = level
        @origin = origin 
        @use = use
        @type = type
        @act = act
        @range = range
        @target = target
        @attack = attack
        @hit = hit
    end 
end 

#This line is going to be important later.
#stat[0], stat[0][0], stat[0][1] 


def startup()
    $photonic = Origin.new("Photonic", "LIGHT") 
    $demon = Origin.new("Demon", "demon") 
    $octopod = Origin.new("Octopod", "octopus") 
    $seismic = Origin.new("Seismic", "Rock") 
    $android = Origin.new("Android", "Robot")
    $engineered = Origin.new("Engineered Human", "Special Human") 
    $a = PC.new("Alex")
    return $a
end

$st = startup()
