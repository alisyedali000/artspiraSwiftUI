//
//  Fonts.swift
//  Artspira
//
//  Created by Syed Ahmad  on 19/12/2024.
//

import Foundation
import SwiftUI

extension Font {
    
    
    //MARK: Poppins
    static func bold(size: CGFloat) -> Font {
        self.custom("OpenSans-Bold", size: size)
    }
    
    static func semiBold(size: CGFloat) -> Font {
        self.custom("OpenSans-SemiBold", size: size)
    }
    
    static func medium(size: CGFloat) -> Font {
        self.custom("OpenSans-Medium", size: size)
    }
    
    static func regular(size: CGFloat) -> Font {
        self.custom("OpenSans-Regular", size: size)
    }
    
    
}
