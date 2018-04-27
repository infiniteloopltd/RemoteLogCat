//
//  main.swift
//  RemoteLogCat
//
//  Created by user909680 on 4/27/18.
//  Copyright © 2018 user909680. All rights reserved.
//

import Foundation

Logging.Key = "..." // From RemoteLogCat.com
Logging.Log(Channel: "macOS", Log: "Hello Log!") {
    print("Success: \($0)")
}
sleep(4)


