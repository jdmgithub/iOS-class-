// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, my name is "

var names = ["Jo", "John", "Jennifer", "Julie"]

var nameDict = ["Jo":30, "John":50, "Jennifer":23, "Julie":30]


names += "Jeff"

for name in names {
    
    var myName = str + name
    
}

for (key, value) in nameDict {
    
    var person = "Hello \(key), they are a \(names)."
}

var (x,y) = (10,10)

x * 2