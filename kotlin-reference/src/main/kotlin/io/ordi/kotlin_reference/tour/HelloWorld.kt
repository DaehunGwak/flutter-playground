package io.ordi.kotlin_reference.tour

/// https://kotlinlang.org/docs/kotlin-tour-hello-world.html
fun helloWorldMain() {
    // hello world
    println("Hello, world!")

    // variables
    val popcorn = 5 // read-only
    // popcorn = 10 is not possible
    var customers = 10 // mutable
    println(customers)
    customers = 8

    // string templates
    println("There are $popcorn popcorn sets")
    println("There are ${customers + 1} customers")

    // practice
    val name = "Mary"
    val age = 20
    println("$name is $age years old")
}