import scala.io.Source

trait Censor {
    var replacements = Map("Shoot" -> "Pucky", "Darn" -> "Beans")

    def bannedwords(filename: String) = { 
        replacements = Map()
        val s = Source.fromFile(filename)
        s.getLines.foreach(line => {
            val tokens = line.split(' ')
            replacements += (tokens(0) -> tokens(1))
        })
    }

    def replace(text: String) : String = {
        var result = text
        replacements.keys.foreach({key => 
            result = result.replaceAllLiterally(key, replacements(key))
        })
        return result
    }
}

class Redacted(var text: String) extends Censor {

    override def toString = {
        // how can I do text.replace() ?
        // or this.replace()
        replace(text)
    }
}

val rude = "I'm going to Shoot the whole Darn place up.\nAnd those Fishing barrels will be Fishing Gutted."

var redacto = new Redacted(rude)
println(redacto)

redacto.bannedwords("rudewords.txt")
println(redacto)

