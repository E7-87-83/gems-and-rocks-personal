"GNU Smalltalk 3.2.5"
"The Weekly Challenge 041 Task 1"
"Attractive Number"
"Usage: gst -S ch-1.st"
"written from 28 to 29th Jan 2021"
" Definition related to the Task Statement: 
 A number is an attractive number if 
 the number of its prime factors is also prime number."

"Remark: from target=55, 
 program prints 'Global garbage collection... done' msg"


'Attractive numbers from 1 to : (50?)' printNl.
target := stdin nextLine.
'' printNl.

target := target asInteger.
Smalltalk at: #target put: target.

Object subclass: Primes [
  |upperLimit|
  upperLimit := 50.
  primes := #(2 3 5 7 11 13 17 19 23 29 31 37 41 43 47).
  new [
    |r|
    <category: 'instance creation'>
    r := super new.
    r init.
    ^r
  ]
  init: s [
    <category: 'initialization'>
  ]
  Primes>>showUpperLimit [
    ^upperLimit
  ]
  Primes>>setUpperLimit: aLimit [
    upperLimit := aLimit
  ]
  listprime [
    |subsetOfPrimes|
    subsetOfPrimes := Set new.
    subsetOfPrimes := (primes asSet) copy.
    (upperLimit >= 53) ifTrue: [
      |s u bool|
      s := upperLimit.
      53 to: s do: [:k|
        bool := false.
        u := 2.
        [(bool not) & (u <= k sqrt)] whileTrue: [
          bool := (k \\ u = 0).
          u := u + 1.
        ].
        (bool not) ifTrue: [
          subsetOfPrimes add: k
        ]
      ]
    ].
    ^subsetOfPrimes
  ]
]






Number extend [
  isPrime [
  |P|
  P := Primes new.
  P setUpperLimit: Smalltalk.target .
  ^((P listprime) includes: self)
  ]
]


Number extend [
  numOfPrimeFactors [
    |t n P|
    n := 0.
    t := self.
    [t~= 1] whileTrue: [
      P := Primes new.
      P setUpperLimit: Smalltalk.target .
      (P listprime) do: [:p|
        (t \\ p = 0) ifTrue: [
          n := n + 1.
          t := t // p.
      ]]
    ].
    ^n
  ]
]

Number extend [
  isAttractive [
    ^((self numOfPrimeFactors) isPrime)
  ]
]

1 to: target do: [:i |
  (i isAttractive) ifTrue: [i printNl].
].

"Test cases:"
"(5 isPrime) ifTrue: ['5 is prime' printNl].
(6 isPrime) ifTrue: ['6 is prime' printNl].
(47 isPrime) ifTrue: ['47 is prime' printNl].
(53 isPrime) ifTrue: ['53 is prime' printNl].
(59 isPrime) ifTrue: ['59 is prime' printNl].
(60 isPrime) ifTrue: ['60 is prime' printNl].
(70 isPrime) ifTrue: ['70 is prime' printNl].
(101 isPrime) ifTrue: ['101 is prime' printNl]."


ObjectMemory quit.
