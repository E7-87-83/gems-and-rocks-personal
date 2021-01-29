"GNU Smalltalk 3.2.5"
"The Weekly Challenge 041 Task 1"
"Attractive Number"
"Usage: gst -S ch-1.st"
"written from 28th to 29th Jan 2021"
" Definition related to the Task Statement: 
 A number is an attractive number if 
 the number of its prime factors is also prime number."
"Task statement:"
"Write a script to display attractive number between 1 and 50."

"comment, 29th Jan: unsatifactory because of use of 
  global variable and I find no ways to change its value"

" TIL: declare global variables "

Smalltalk at: #Primes put: #(2 3 5 7 11 13 17 19
                           23 29 31 37 41 43 47).

Number extend [
  isPrime [
  ^(Smalltalk.Primes includes: self)
  ]
]

Number extend [
  numOfPrimeFactors [
    |t n|
    n := 0.
    t := self.
    [(t<= 50) and: [t~= 1]] whileTrue: [
      Smalltalk.Primes do: [:p|
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

1 to: 50 do: [:i |
  (i isAttractive)
  ifTrue: [i printNl].
].

ObjectMemory quit.
