colours = [ "red", "green", "blue" ]

mapcolours = [ (alabama, florida, georgia, mississ, tenness) |
    alabama <- colours,
    florida <- colours,
    georgia <- colours, 
    mississ <- colours,
    tenness <- colours, 
    alabama /= tenness,
    alabama /= mississ,
    alabama /= georgia,
    alabama /= florida,
    georgia /= florida,
    georgia /= tenness,
    mississ /= tenness ]
