//
//  LogBehaviour.swift
//  
//
//  Created by Daniel Marriner on 23/07/2023.
//

public enum LogBehaviour : Int
{
    case none = 0
    case errorsAndWarnings = 1
    case full = 2

    public init(stringValue: String)
    {
        self = .none
        let lower = stringValue.lowercased()
        if lower == "full"
        {
            self = .full
        }
        else if lower == "errorsandwarnings" || lower == "errors_and_warnings"
        {
            self = .errorsAndWarnings
        }

    }
}
