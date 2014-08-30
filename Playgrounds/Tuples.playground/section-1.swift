// Playground - noun: a place where people can play


let a = (1,"foo")
a.0
a.1

let b = (index:1, word:"foo")
b.index
b.word

func f() -> String {
    return "hi"
}

f()

func httpResponse1() -> (Int, String) {
    return (200, "some content for your request")
}

httpResponse1()

func httpResponse2() -> (code: Int, content: String) {
    return (code:200, content:"some content for your request")
}

let response = httpResponse2()
response.code
response.content

let array = [(1,"some"), (421, "foobar")]
array[0]
