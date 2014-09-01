// Playground - noun: a place where people can play


// Tuple
let a = (1,"foo")
a.0
a.1


// Tuple mit benannten Parametern
let b = (index:1, word:"foo")
b.index
b.word


// Funktion, die ein Tuple zurueckgibt
func httpResponse1() -> (Int, String) {
    return (200, "some content for your request")
}

httpResponse1()


// das zurueckgegebene Tuple hat genannte Parameter
func httpResponse2() -> (code: Int, content: String) {
    return (code:200, content:"some content for your request")
}

let response = httpResponse2()
response.code
response.content


// Array von Tuples
let array = [(1,"some"), (421, "foobar")]
array[0]
