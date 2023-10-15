import Foundation

public enum AlertViewStyle {
    
    #if os(iOS)
    case iOS16AppleMusic
    #endif
    
    #if os(iOS) || os(visionOS)
    case iOS17AppleMusic
    #endif
}
