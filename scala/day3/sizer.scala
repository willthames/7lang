import scala.io._
import scala.actors._
import Actor._

val reLinks = "<[Aa] [^>]*href=\"".r

object PageLoader {
 def getSource(url : String) : String = Source.fromURL(url).mkString
}

val urls = List("http://www.amazon.com/", 
               "https://twitter.com/",
               "http://www.google.com/",
               "http://www.cnn.com/" )

// START:time
def timeMethod(method: () => Unit) = {
 val start = System.nanoTime
 method()
 val end = System.nanoTime
 println("Method took " + (end - start)/1000000000.0 + " seconds.")
}
// END:time

// START:sequential
def getPageSizeSequentially() = {
 for(url <- urls) {
   var source = PageLoader.getSource(url)
   println("Size for " + url + ": " + source.length)
   println("Number of links for " + url + ": " + reLinks.findAllIn(source).size)
 }
}
// END:sequential

// START:concurrent
def getPageSizeConcurrently() = {
 val caller = self

 for(url <- urls) {
   actor { caller ! (url, PageLoader.getSource(url)) }
 }

 for(i <- 1 to urls.size) {
   receive {
     case (url, source : String) =>
       println("Size for " + url + ": " + source.length)            
       println("Number of links for " + url + ": " + reLinks.findAllIn(source).size)
   }
 }
}
// END:concurrent

// START:script
println("Sequential run:")
timeMethod { getPageSizeSequentially }

println("Concurrent run")
timeMethod { getPageSizeConcurrently }
// END:script
