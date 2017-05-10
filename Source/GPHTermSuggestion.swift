//
//  GPHSuggestion.swift
//  GiphyCoreSDK
//
//  Created by Cem Kozinoglu on 4/22/17.
//  Copyright © 2017 Giphy. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to
//  deal in the Software without restriction, including without limitation the
//  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
//  sell copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
//  IN THE SOFTWARE.
//

import Foundation

/// Represents a Giphy Term Suggestion
///
@objc public class GPHTermSuggestion: NSObject, NSCoding {
    
    /// Username
    public private(set) var term: String
    
    override public init() {
        self.term = ""
        super.init()
    }
    
    convenience init(_ term: String) {
        self.init()
        self.term = term
    }
    
    required convenience public init?(coder aDecoder: NSCoder) {
        guard let term = aDecoder.decodeObject(forKey: "term") as? String
            else { return nil }
        
        self.init(term)
        
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(self.term, forKey: "term")
    }
    
    // MARK: NSCoder Hash and Equality/Identity
    override public func isEqual(_ object: Any?) -> Bool {
        if object as? GPHTermSuggestion === self {
            return true
        }
        if let other = object as? GPHTermSuggestion, self.term == other.term {
            return true
        }
        return false
    }
    
    override public var hash: Int {
        return "gph_term_suggestion_\(self.term)".hashValue
    }
    
}

// MARK: Human readable

/// Make objects human readable
///
extension GPHTermSuggestion {
    
    override public var description: String {
        return "GPHTermSuggestion(\(self.term))"
    }
    
}

// MARK: Parsing & Mapping

/// For parsing/mapping protocol
///
extension GPHTermSuggestion: GPHMappable {
    
    /// this is where the magic will happen + error handling
    public static func mapData(_ root: GPHTermSuggestion?,
                               data jsonData: GPHJSONObject,
                               request requestType: GPHRequestType,
                               media mediaType: GPHMediaType = .gif,
                               rendition renditionType: GPHRenditionType = .original) -> (object: GPHTermSuggestion?, error: GPHJSONMappingError?) {
        
        guard
            let term = jsonData["name"] as? String
            else {
                return (nil, GPHJSONMappingError(description: "Couldn't map GPHTermSuggestion for \(jsonData)"))
        }
        
        let obj = GPHTermSuggestion(term)
        
        return (obj, nil)
    }
    
}