import Foundation

class CoronaClass {
 
    var seats = [Int]()
    var place: Int

    init(n: Int) {
        place = n
    }
    
    func seat() -> Int {
        var index = 0
        var studentPlace = 0
        var temporary = 0
        
//        guard seats.count > 1 else {
//            seats.append(0)
//        }
        if seats.isEmpty {
            seats.append(0)
        } else {
            if seats.first != 0 {
                studentPlace = 0
                seats.insert(studentPlace, at: 0)
                return studentPlace
            }
            if seats.last != place - 1 && seats.count <= 1 {
                seats.append(place - 1)
                studentPlace = place - 1
            } else {
                for i in 1 ..< seats.count {
                    if (seats[i] - seats[i - 1]) / 2 > temporary {
                        temporary = (seats[i] - seats[i - 1]) / 2
                        index = i
                        studentPlace = seats[i - 1] + temporary
                    }
                }
                
                if seats.last != place - 1 {
                    if (place - 1 - seats.last!) > temporary {
                        studentPlace = place - 1
                        seats.append(place - 1)
                        return studentPlace
                    }
                }
                seats.insert(studentPlace, at: index)
            }
        }
        return studentPlace
    }
    
    func leave(_ p: Int) {
        if let index = seats.firstIndex(of: p) {
            seats.remove(at: index)
        }
    }
}
