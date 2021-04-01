//
//  Logger.swift
//  CCLogger
//
//  Created by Andrzej Jacak on 12/09/2018.
//  Copyright © 2018 Cybercom Poland Sp. z o.o. All rights reserved.
//

import Foundation

public class Logger {
    public let level: LogLevel

    init(level: LogLevel, loggerNamePrefix: String? = nil, temporaryPrefix: String? = nil, customFileLogger: FileLogger? = nil) {
        self.level = level
        self.namePrefix = loggerNamePrefix
        self.temporaryPrefix = temporaryPrefix
    }
    var namePrefix: String?
    var temporaryPrefix: String?
    var customFileLogger: FileLogger?
    var addTimeInfo: Bool = true

    open func log(_ message: String) {
        log(message, scope: nil)
    }

    open func log(_ message: String, scope: String? = nil) {
        var formattedMessage = ""

        if addTimeInfo {
            formattedMessage += SharedLoggerTools.timeSinceStart
        }

        var threadName = (Thread.current.name ?? "").prefix(4)
        for _ in threadName.count..<4 {
            threadName.append(" ")
        }
        formattedMessage += "\(threadName)|"
        formattedMessage += "\(level.shortIdentifier)|"

        if let scope = scope {
            formattedMessage += scope + "|"
        } else {
            formattedMessage += " |"
        }

        if let namePrefix = namePrefix {
            formattedMessage += namePrefix
        }

        if let temporaryPrefix = temporaryPrefix {
            if formattedMessage.isEmpty == false {
                formattedMessage += " "
            }
            formattedMessage += temporaryPrefix
        }

        formattedMessage += " " + message
        CCLoggerConfiguration.shared.customPrintHandler?(formattedMessage)
        print(formattedMessage)
        (customFileLogger ?? CCLoggerConfiguration.shared.fileLogger)?.log(text: formattedMessage, level: level)
    }
}
