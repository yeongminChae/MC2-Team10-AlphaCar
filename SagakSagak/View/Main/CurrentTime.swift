//
//  CurrentTime.swift
//  SagakSagak
//
//  Created by 신정연 on 2023/05/10.
//

import Foundation

let currentHour: String = {
    let format = DateFormatter()
    format.dateFormat = "HH"
    let current_time_string = format.string(from: Date())
    return current_time_string
}()

let currentTimee: String = {
    let format = DateFormatter()
    format.dateFormat = "HH:mm"
    let current_time_string = format.string(from: Date())
    return current_time_string
}()
