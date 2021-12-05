//
//  main.swift
//  HW2L2
//
//  Created by Арслан on 05.12.2021.
//

import Foundation

print("Please enter hours")
let hrs = readLine()

print("Please enter minutes")
let min = readLine()

print("Please enter seconds")
let sec = readLine()

func toInt(s: String?) -> Int{
    var result = 0
    if let str: String = s,
       let i = Int(str) {
        result = i
    }
    return result
}

let hours = toInt(s: hrs)
let minutes = toInt(s: min)
let seconds = toInt(s: sec)

func rightTime(h: Int = hours, m: Int = minutes, s: Int = seconds){
    if h < 24 && m < 60 && s < 60{
        
        func conH(hrs: Int, cArr: inout [Int]){
            var lamps = 0
            
            if hrs > 4{
                lamps = hrs / 5
                for i in Range (1...lamps){
                    cArr[i] = 1
                }
            }
            
            lamps = hrs % 5
            if lamps > 0{
                for i in Range(5...lamps + 4){
                    cArr[i] = 1
                }
            }
        }
        
        func conM(min: Int, cArr: inout [Int]){
            var lamps = 0
            
            if min > 4{
                lamps = min / 5
                for i in Range (9...lamps + 8){
                    cArr[i] = 1
                }
            }
            
            lamps = min % 5
            if lamps > 0{
                for i in Range(20...lamps + 19){
                    cArr[i] = 1
                }
            }
        }
        
        func conS(sec: Int, cArr: inout [Int]){
            let lamps = sec % 2
            
            if lamps == 0{
                for i in Range(0...lamps){
                    cArr[i] = 1
                }
            }
        }
        
        var cArr: [Int] = []
        
        for _ in Range(0...23){
            cArr.append(0)
        }
        
        conH(hrs: toInt(s: hrs), cArr: &cArr)
        conM(min: toInt(s: min), cArr: &cArr)
        conS(sec: toInt(s: sec), cArr: &cArr)
        
        
        print(cArr[0...0])
        print(cArr[1...4])
        print(cArr[5...8])
        print(cArr[9...19])
        print(cArr[20...23])
    }
    else{
        print("Please enter correct time")
    }
}
rightTime()
