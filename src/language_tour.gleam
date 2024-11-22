//// A module containing some unusual functions and types.

import gleam/bool
import gleam/bytes_tree
import gleam/dict
import gleam/float
import gleam/int
import gleam/io as input_output
import gleam/io.{debug, print, println}
import gleam/list
import gleam/option.{type Option, None, Some}
import gleam/result
import gleam/string as text
import gleam/string.{reverse, uppercase}
import gleam/string_tree.{type StringTree}

// Custom types
pub type Season {
  Spring
  Summer
  Autumn
  Winter
}

pub type SchoolPerson {
  Teacher(name: String, subject: String)
  Student(name: String)
}

pub type Fish {
  Starfish(name: String, favourite_color: String)
  Jellyfish(name: String, jiggly: Bool)
}

pub type IceCream {
  IceCream(flavour: String)
}

pub type Lehrer {
  Lehrer(name: String, subject: String, floor: Int, room: Int)
}

// Generic custom types
// pub type Option(inner) {
//   Some(inner)
//   None
// }

pub type PurchaseError {
  NotEnoughMoney(required: Int)
  NotLuckyEnough
}

pub type Person {
  Person(name: String, pet: Option(String))
}

// Opaque types
// Opaque types are types where a custom type itself is public and can be used
// by other modules, but the constructors for the type are private and can only
// be used by the module that defines the type.
pub opaque type PositiveInt {
  PositiveInt(inner: Int)
}

// An option of string
pub const name: Option(String) = Some("Annah")

// An option of int
pub const level: Option(Int) = Some(10)

/// A type where the value can never be constructed.
pub type Never {
  Never(Never)
}

pub type UserId =
  Int

pub const cints: List(Int) = [10, 20, 30]

const cfloats = [1.1, 2.2, 3.3]

pub fn main() {
  let joe = "Hello, Joe!"
  input_output.println(joe)
  println(joe)
  print(joe <> "\n")
  debug(joe)
  io.debug(joe)
  io.println(joe)
  println(text.reverse(joe))
  println(reverse(joe))
  println(string.uppercase(joe))
  println(uppercase(joe))
  // println(666) // type error
  println(int.to_string(666))

  io.debug(1 + 1)
  io.debug(5 - 1)
  io.debug(5 / 2)
  io.debug(3 * 3)
  io.debug(5 % 2)

  // Int comparisons
  io.debug(2 > 1)
  io.debug(2 < 1)
  io.debug(2 >= 1)
  io.debug(2 <= 1)

  // Equality works for any type
  io.debug(1 == 1)
  io.debug(2 == 1)

  // Standard library int functions
  io.debug(int.max(42, 77))
  io.debug(int.clamp(5, 10, 20))

  io.debug(1.0 +. 1.5)
  io.debug(5.0 -. 1.5)
  io.debug(5.0 /. 2.5)
  io.debug(3.0 *. 3.5)

  // Float comparisons
  io.debug(2.2 >. 1.3)
  io.debug(2.2 <. 1.3)
  io.debug(2.2 >=. 1.3)
  io.debug(2.2 <=. 1.3)

  // Equality works for any type
  io.debug(1.1 == 1.1)
  io.debug(2.1 == 1.2)

  // Division by zero is not an error
  io.debug(3.14 /. 0.0)

  // Standard library float functions
  io.debug(float.max(2.0, 9.5))
  io.debug(float.ceiling(5.4))

  io.debug(1_000_000)
  io.debug(10_000.01)

  // Binary, octal, and hex Int literals
  io.debug(0b00001111)
  io.debug(0o17)
  io.debug(0xF)

  // Scientific notation Float literals
  io.debug(7.0e7)
  io.debug(3.0e-4)

  io.debug(100 == 100)
  io.debug(1.5 != 0.1)

  // String literals
  io.debug("👩‍💻 こんにちは Gleam 🏳️‍🌈")
  io.debug(
    "multi
    line
    string",
  )
  io.debug("\u{1F600}")

  debug("∀ a. → ⇒ ")

  // Double quote can be escaped
  io.println("\"X\" marks the spot")

  // String concatenation
  io.debug("One " <> "Two")

  // String functions
  io.debug(string.reverse("1 2 3 4 5"))
  io.debug(string.append("abc", "def"))

  io.debug(True && False)
  io.debug(True && True)
  io.debug(False || False)
  io.debug(False || True)

  // Bool functions
  io.debug(bool.to_string(True))
  io.debug(bool.to_int(False))
  io.debug(bool.to_int(True))

  let x = "Original"
  io.debug(x)

  // Assign `y` to the value of `x`
  let y = x
  io.debug(y)

  // Assign `x` to a new value
  let x = "New"
  io.debug(x)

  // The `y` still refers to the original value
  io.debug(y)

  let score = 1000
  let _score = 1000

  let _name: String = "Gleam"
  let _is_cool: Bool = True
  let _version: Int = 1

  let _name1 = "Gleam"
  let _is_cool1 = True
  let _version1 = 1

  // Referring to a type in a qualified way
  let _bytes: bytes_tree.BytesTree = bytes_tree.new()

  // Refering to a type in an unqualified way
  let _text: StringTree = string_tree.new()

  let one: UserId = 1
  let two: Int = 2

  // UserId and Int are the same type

  io.debug(one == two)

  let fahrenheit = {
    let degrees = 64
    degrees
  }

  io.debug("Fahrenheit: " <> int.to_string(fahrenheit))

  // Changing order of evaluation
  let celsius = { fahrenheit - 32 } * 5 / 9
  io.debug(celsius)

  // let ints: List(Int) = [1, 2, 3]
  let ints = [0, 1, 2, 3, 4, 5]

  io.debug(ints)

  // Immutably prepend
  io.debug([-1, 0, ..ints])

  // The original lists are unchanged
  io.debug(ints)

  io.debug(cints)
  io.debug(cints == [1, 2, 3])
  io.debug(cints == [10, 20, 30])

  io.debug(cfloats)
  io.debug(cfloats == [1.1, 2.2, 3.3])

  io.debug(double(10))

  // Call a function with another function
  io.debug(twice(1, add_one))

  // Functions can be assigned to variables
  let my_function = add_one
  io.debug(my_function(100))

  // Assign an anonymous function to a variable
  let add_one = fn(a) { a + 1 }
  io.debug(twice(1, add_one))

  // Pass an anonymous function as an argument
  io.debug(twice(1, fn(a) { a * 2 }))

  // Closures
  let secret_number = 42
  // This anonymous function always returns 42
  let secret = fn() { secret_number }
  io.debug(secret())

  // Function captures

  // These two statements are equivalent
  let add_one_1 = fn(x) { add(1, x) }
  let add_one_2 = add(1, _)

  io.debug(add_one_1(10))
  io.debug(add_one_2(10))

  // Generic functions

  let add_one = fn(x) { x + 1 }
  let exclaim = fn(x) { x <> "!" }

  // Invalid, Int and String are not the same type
  // twice(10, exclaim)

  // Here the type variable is replaced by the type Int
  io.debug(twice1(10, add_one))

  // Here the type variable is replaced by the type String
  io.debug(twice1("Hello", exclaim))

  // Pipelines

  // Without the pipe operator
  io.debug(string.drop_start(string.drop_end("Hello, Mike!", 1), 7))

  // With the pipe operator
  "Hello, Mike!"
  // drop "!"
  |> string.drop_end(1)
  // drop "Hello, "
  |> string.drop_start(7)
  |> io.debug

  // Changing order with function capturing. Prints "312"!
  "1"
  |> string.append("2")
  |> string.append("3", _)
  |> io.debug

  // Labelled arguments

  // Without using labels
  io.debug(calculate(1, 2, 3))

  // Using the labels
  io.debug(calculate(1, add: 2, multiply: 3))

  // Using the labels in a different order
  io.debug(calculate(1, multiply: 3, add: 2))
  // Unknown label
  // io.debug(calculate(value: 1, multiply: 3, add: 2)) 

  // Deprecations

  old_function()
  new_function()

  // Case expressions

  let x = int.random(5)
  io.debug(x)

  let result = case x {
    0 -> "Zero"
    1 -> "One"
    _ -> "Other"
  }
  io.debug(result)

  // Variable patterns

  let result = case int.random(5) {
    0 -> "Zero"
    1 -> "One"
    other -> "It is " <> int.to_string(other)
  }
  io.debug(result)

  // String patterns

  io.debug(get_name("Hello, Joe"))
  io.debug(get_name("Hello, Mike"))
  io.debug(get_name("System still working?"))

  // List patterns

  let x = list.repeat(int.random(5), times: int.random(3))
  io.print("Random List: ")
  io.debug(x)

  let result = case x {
    [] -> "Empty list"
    [1] -> "List of just 1"
    [4, ..] -> "List starting with 4"
    [_, _] -> "List of 2 elements"
    _ -> "Some other list"
  }
  io.debug(result)

  // Recursion

  io.debug(factorial(5))
  io.debug(factorial(7))

  // Tail calls

  io.debug(factorial1(5))
  io.debug(factorial1(7))

  // List recursion

  let sum = sum_list([18, 56, 35, 85, 91], 0)
  io.debug(sum)

  // Multiple subjects

  let x = int.random(2)
  let y = int.random(2)
  io.debug(x)
  io.debug(y)

  let result = case x, y {
    0, 0 -> "Both are zero"
    0, _ -> "First is zero"
    _, 0 -> "Second is zero"
    _, _ -> "Neither are zero"
  }
  io.debug(result)

  // Alternative patterns

  let number = int.random(10)
  io.debug(number)

  let result = case number {
    2 | 4 | 6 | 8 -> "This is an even number"
    1 | 3 | 5 | 7 -> "This is an odd number"
    _ -> "I'm not sure"
  }
  io.debug(result)

  // Pattern aliases

  io.debug(get_first_non_empty([[], [1, 2, 3], [4, 5]]))
  io.debug(get_first_non_empty([[1, 2], [3, 4, 5], []]))
  io.debug(get_first_non_empty([[], [], []]))

  // Guards

  let numbers = [1, 2, 3, 4, 5]
  io.debug(get_first_larger(numbers, 3))
  io.debug(get_first_larger(numbers, 5))

  // Tuples

  let triple = #(1, 2.2, "three")
  io.debug(triple)

  let #(a, _, _) = triple
  io.debug(a)
  io.debug(triple.0)
  io.debug(triple.1)
  io.debug(triple.2)
  // io.debug(triple.3)

  // Custom types

  io.debug(weather(Spring))
  io.debug(weather(Autumn))

  // Records

  let teacher1 = Teacher("Mr Schofield", "Physics")
  let teacher2 = Teacher(name: "Miss Percy", subject: "Physics")
  let student1 = Student("Koushiar")
  let student2 = Student("Naomi")
  let student3 = Student("Shaheer")

  let school: List(SchoolPerson) = [
    teacher1,
    teacher2,
    student1,
    student2,
    student3,
  ]
  io.debug(school)

  // Record accessors

  io.debug(teacher1.name)
  io.debug(student1.name)
  // io.debug(student1.subject)

  // Record pattern matching

  handle_fish(Starfish("Lucy", "Pink"))
  handle_ice_cream(IceCream("strawberry"))

  // Record updates

  let teacher1 = Lehrer(name: "Mr Dodd", subject: "ICT", floor: 2, room: 2)

  // Use the update syntax
  let teacher2 = Lehrer(..teacher1, subject: "PE", room: 6)

  io.debug(teacher1)
  io.debug(teacher2)

  // Nil - Gleam's unit type

  // The type of the value Nil is Nil.
  let x = Nil
  io.debug(x)

  // let y: List(String) = Nil

  let result = io.println("Hello!")
  io.debug(result == Nil)

  // Results

  // Built-in Result(value, error) type. It has two variants:
  //   Ok,    which contains the return value of a successful computation.
  //   Error, which contains the reason for a failed computation.

  let _ = io.debug(buy_pastry(10))
  let _ = io.debug(buy_pastry(8))
  let _ = io.debug(buy_pastry(5))
  let _ = io.debug(buy_pastry(3))

  // Bit arrays

  //    Each segment of a bit array can be given options to specify the representation used for that segment.
  //
  //     size: the size of the segment in bits.
  //     unit: the number of bits that the size value is a multiple of.
  //     bits: a nested bit array of any size.
  //     bytes: a nested byte-aligned bit array.
  //     float: a 64 bits floating point number.
  //     int: an int with a default size of 8 bits.
  //     big: big endian.
  //     little: little endian.
  //     native: the endianness of the processor.
  //     utf8: utf8 encoded text.
  //     utf16: utf16 encoded text.
  //     utf32: utf32 encoded text.
  //     utf8_codepoint: a utf8 codepoint.
  //     utf16_codepoint: a utf16 codepoint.
  //     utf32_codepoint: a utf32 codepoint.
  //     signed: a signed number.
  //     unsigned: an unsigned number.
  //
  // Multiple options can be given to a segment by separating each with a dash: x:unsigned-little-size(2).
  //
  // For more information on bit arrays see the Erlang bit syntax documentation. 

  // 8 bit int. In binary: 00000011
  io.debug(<<3>>)
  io.debug(<<3>> == <<3:size(8)>>)

  // 16 bit int. In binary: 0001100000000011
  io.debug(<<6147:size(16)>>)

  // A bit array of UTF8 data
  io.debug(<<"Hello, ∀ → Joe!":utf8>>)

  // Concatenation
  let first = <<4>>
  let second = <<2>>
  io.debug(<<first:bits, second:bits>>)

  // Standard library package

  // List module

  io.println("=== map ===")
  io.debug(list.map(ints, fn(x) { x * 2 }))

  io.println("=== filter ===")
  io.debug(list.filter(ints, fn(x) { x % 2 == 0 }))
  io.debug(list.filter(ints, int.is_even))

  io.println("=== fold ===")
  io.debug(list.fold(ints, 0, fn(count, e) { count + e }))
  io.debug(list.fold(ints, 0, int.add))
  io.debug(list.fold(ints, 0, add))

  io.println("=== find ===")
  let _ = io.debug(list.find(ints, fn(x) { x > 3 }))
  let _ = io.debug(list.find(ints, greater(_, 3)))
  let _ = io.debug(list.find(ints, fn(x) { x > 13 }))

  // Result module
  io.println("⇒ Result module")

  io.println("=== map === ⇒ result's map <$>")
  let _ = io.debug(result.map(Ok(1), fn(x) { x * 2 }))
  let _ = io.debug(result.map(Error(1), fn(x) { x * 2 }))

  io.println("=== try === ⇒ result's bind =>>")
  let _ = io.debug(result.try(Ok("1"), int.parse))
  let _ = io.debug(result.try(Ok("no"), int.parse))
  let _ = io.debug(result.try(Error(Nil), int.parse))

  io.println("=== unwrap === == fromLeft")
  io.debug(result.unwrap(Ok("1234"), "default"))
  io.debug(result.unwrap(Error(Nil), "default"))

  io.println("=== pipeline ===")
  let _ =
    int.parse("-1234")
    |> result.map(int.absolute_value)
    |> result.try(int.remainder(_, 42))
    |> io.debug

  // Dict module
  io.println("⇒ Dict module")

  let scores: dict.Dict(String, UserId) =
    dict.from_list([#("Lucy", 13), #("Drew", 15)])
  io.debug(scores)

  let scores: dict.Dict(String, UserId) =
    scores
    |> dict.insert("Bushra", 16)
    |> dict.insert("Darius", 14)
    |> dict.delete("Drew")
  io.debug(scores)

  // Option module
  io.println("⇒ Option module")

  let person_with_pet = Person("Al", Some("Nubi"))
  let person_without_pet = Person("Maria", None)

  io.debug(person_with_pet)
  io.debug(person_without_pet)

  // Opaque types
  io.println("Opaque types")

  let positive = new_positive_int(1)
  let zero = new_positive_int(0)
  let negative = new_positive_int(-1)

  io.debug(to_int(positive))
  io.debug(to_int(zero))
  io.debug(to_int(negative))
  // Use

  // Panic

  print_score(10)
  print_score(100_000)
  // this will panic:
  // print_score(-1)

  // Let assert

  let a = unsafely_get_first_element([123])
  io.debug(a)
  // we were lying to the compiler -> runtime error
  // let b = unsafely_get_first_element([])
  // io.debug(b)

  // Externals
  io.debug(extension("hello.txt"))
  io.debug(reverse_list([1, 2, 3, 4, 5]))
  io.debug(reverse_list(["a", "b", "c", "d", "e"]))
  io.debug(reverse_list1([1, 2, 3, 4, 5]))
  io.debug(reverse_list1(["a", "b", "c", "d", "e"]))
  io.debug(reverse_list2([1, 2, 3, 4, 5]))
  io.debug(reverse_list2(["a", "b", "c", "d", "e"]))
}

fn double(a: Int) -> Int {
  multiply(a, 2)
}

fn multiply(a: Int, b: Int) -> Int {
  a * b
}

/// Call a function twice with an initial value.
fn twice(argument: Int, passed_function: fn(Int) -> Int) -> Int {
  passed_function(passed_function(argument))
}

/// Call a function three times with an initial value.
pub fn thrice(argument: value, my_function: fn(value) -> value) -> value {
  my_function(my_function(my_function(argument)))
}

// The name `value` refers to the same type multiple times
fn twice1(argument: value, my_function: fn(value) -> value) -> value {
  my_function(my_function(argument))
}

fn add_one(argument: Int) -> Int {
  argument + 1
}

fn add(a: Int, b: Int) -> Int {
  a + b
}

fn calculate(value: Int, add addend: Int, multiply multiplier: Int) {
  value * multiplier + addend
}

@deprecated("Use new_function instead")
fn old_function() {
  Nil
}

fn new_function() {
  Nil
}

fn get_name(x: String) -> String {
  case x {
    "Hello, " <> name -> name
    _ -> "Unknown person"
  }
}

/// A recursive functions that calculates factorial
pub fn factorial(x: Int) -> Int {
  case x {
    0 -> 1
    1 -> 1
    _ -> x * factorial(x - 1)
  }
}

pub fn factorial1(x: Int) -> Int {
  // The public function calls the private tail recursive function
  factorial_loop(x, 1)
}

fn factorial_loop(x: Int, accumulator: Int) -> Int {
  case x {
    0 -> accumulator
    1 -> accumulator
    _ -> factorial_loop(x - 1, accumulator * x)
  }
}

fn sum_list(list: List(Int), total: Int) -> Int {
  case list {
    [first, ..rest] -> sum_list(rest, total + first)
    [] -> total
  }
}

fn get_first_non_empty(lists: List(List(t))) -> List(t) {
  case lists {
    [] -> []
    [[_, ..] as first, ..] -> first
    [[], ..rest] -> get_first_non_empty(rest)
  }
}

fn get_first_larger(numbers: List(Int), limit: Int) -> Int {
  case numbers {
    [] -> 0
    [first, ..] if first > limit -> first
    [_, ..rest] -> get_first_larger(rest, limit)
  }
}

fn weather(season: Season) -> String {
  case season {
    Spring -> "Mild"
    Summer -> "Hot"
    Autumn -> "Windy"
    Winter -> "Cold"
  }
}

fn handle_fish(fish: Fish) -> String {
  case fish {
    Starfish(_, favourite_color) -> io.debug(favourite_color)
    Jellyfish(name, ..) -> io.debug(name)
  }
}

fn handle_ice_cream(ice_cream: IceCream) -> String {
  // if the custom type has a single variant you can
  // destructure it using `let` instead of a case expression!
  let IceCream(flavour) = ice_cream
  io.debug(flavour)
}

fn buy_pastry(money: Int) -> Result(Int, PurchaseError) {
  case money >= 5 {
    True ->
      case int.random(4) == 0 {
        True -> Error(NotLuckyEnough)
        False -> Ok(money - 5)
      }
    False -> Error(NotEnoughMoney(required: 5))
  }
}

fn greater(x: Int, y: Int) {
  x > y
}

pub fn new_positive_int(i: Int) -> PositiveInt {
  case i >= 0 {
    True -> PositiveInt(i)
    False -> PositiveInt(0)
  }
}

pub fn to_int(i: PositiveInt) -> Int {
  i.inner
}

// Use 

pub fn without_use() -> Result(String, d) {
  result.try(get_username(), fn(username) {
    result.try(get_password(), fn(password) {
      result.map(log_in(username, password), fn(greeting) {
        greeting <> ", " <> username
      })
    })
  })
}

pub fn with_use() -> Result(String, e) {
  use username <- result.try(get_username())
  use password <- result.try(get_password())
  use greeting <- result.map(log_in(username, password))
  greeting <> ", " <> username
}

// Here are some pretend functions for this example:

fn get_username() -> Result(String, a) {
  Ok("alice")
}

fn get_password() -> Result(String, b) {
  Ok("hunter2")
}

fn log_in(_username: String, _password: String) -> Result(String, c) {
  Ok("Welcome")
}

// Todo

pub fn todo_with_reason() -> g {
  todo as "I haven't written this code yet!"
}

pub fn todo_without_reason() -> f {
  todo
}

pub fn print_score(score: Int) -> Nil {
  case score {
    score if score > 1000 -> io.println("High score!")
    score if score > 0 -> io.println("Still working on it")
    _ -> panic as "Scores should never be negative!"
  }
}

pub fn unsafely_get_first_element(items: List(a)) -> a {
  // This will panic if the list is empty.
  // A regular `let` would not permit this partial pattern
  let assert [first, ..] = items
  first
}

// https://www.erlang.org/doc/apps/stdlib/filename.html#extension/1
@external(erlang, "filename", "extension")
fn extension(path: String) -> String

// If your Gleam project runs on the Erlang virtual machine and you wish to
// call the reverse function from the Erlang lists module you can do it by
// adding the @external attribute to a Gleam function head like this:
@external(erlang, "lists", "reverse")
pub fn reverse_list(x: List(a)) -> List(a)

// If you attempt to compile this code for JavaScript runtimes it will fail
// with an error message as there is no implementation for JavaScript. Another
// implementation can be specified for JavaScript runtimes like this:
@external(erlang, "lists", "reverse")
@external(javascript, "./my_module.mjs", "reverse")
pub fn reverse_list1(x: List(a)) -> List(a)

// It is also possible to write a Gleam implementation that will be used when
// there is no external implementation for the current compile target:
@external(erlang, "lists", "reverse")
pub fn reverse_list2(x: List(a)) -> List(a) {
  tail_recursive_reverse(x, [])
}

fn tail_recursive_reverse(list, reversed) {
  case list {
    [] -> reversed
    [x, ..xs] -> tail_recursive_reverse(xs, [x, ..reversed])
  }
}
