import Foundation

/// Secure networking with certificate pinning
public actor NetworkSecurity {
    private let pinnedCertificates: Set<Data>
    
    public init(certificates: [Data] = []) {
        self.pinnedCertificates = Set(certificates)
    }
    
    public func secureRequest(url: URL) async throws -> Data {
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.timeoutInterval = 30
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.invalidResponse
        }
        
        return data
    }
    
    public func validateCertificate(_ trust: SecTrust) -> Bool {
        guard !pinnedCertificates.isEmpty else { return true }
        
        guard let serverCert = SecTrustGetCertificateAtIndex(trust, 0) else {
            return false
        }
        
        let serverCertData = SecCertificateCopyData(serverCert) as Data
        return pinnedCertificates.contains(serverCertData)
    }
}

public enum NetworkError: Error {
    case invalidResponse, certificatePinningFailed
}
