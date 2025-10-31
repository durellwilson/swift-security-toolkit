import Foundation

/// Input validation for security-critical operations
public struct InputValidator {
    public init() {}
    
    public func validateEmail(_ email: String) -> Bool {
        let pattern = "^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,}$"
        let regex = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive)
        let range = NSRange(email.startIndex..., in: email)
        return regex?.firstMatch(in: email, range: range) != nil
    }
    
    public func sanitizeInput(_ input: String) -> String {
        input
            .replacingOccurrences(of: "<script>", with: "", options: .caseInsensitive)
            .replacingOccurrences(of: "javascript:", with: "", options: .caseInsensitive)
            .replacingOccurrences(of: "onerror=", with: "", options: .caseInsensitive)
            .trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    public func detectInjection(_ input: String) -> Bool {
        let patterns = [
            "(?i)(union.*select|insert.*into|delete.*from|drop.*table)",
            "(?i)(script|javascript|onerror|onclick)",
            "(?i)(eval\\(|exec\\(|system\\()"
        ]
        return patterns.contains { pattern in
            (try? NSRegularExpression(pattern: pattern).firstMatch(in: input, range: NSRange(input.startIndex..., in: input))) != nil
        }
    }
}
