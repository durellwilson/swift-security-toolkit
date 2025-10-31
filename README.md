# Swift Security Toolkit

Production-ready security utilities for Swift/SwiftUI applications. Built for Detroit's cybersecurity and DevRel community.

## 🔒 Features

### Secure Storage
- Keychain integration
- Encrypted data storage
- Device-only access
- Actor-based thread safety

### Input Validation
- Email validation
- XSS prevention
- SQL injection detection
- Input sanitization

### Biometric Authentication
- Face ID / Touch ID support
- Async/await API
- Type detection
- Error handling

### Network Security
- Certificate pinning
- Secure requests
- Timeout handling
- Response validation

## 📦 Installation

### Swift Package Manager

```swift
dependencies: [
    .package(url: "https://github.com/durellwilson/swift-security-toolkit.git", from: "1.0.0")
]
```

## 🚀 Quick Start

### Secure Storage

```swift
import SwiftSecurityToolkit

let storage = SecureStorage()

// Store sensitive data
let apiKey = "secret-key".data(using: .utf8)!
try await storage.store(apiKey, key: "api_key")

// Retrieve
let retrieved = try await storage.retrieve(key: "api_key")

// Delete
try await storage.delete(key: "api_key")
```

### Input Validation

```swift
let validator = InputValidator()

// Validate email
let isValid = validator.validateEmail("user@example.com") // true

// Sanitize input
let clean = validator.sanitizeInput("<script>alert('xss')</script>") // ""

// Detect injection
let hasInjection = validator.detectInjection("'; DROP TABLE users--") // true
```

### Biometric Auth

```swift
let auth = BiometricAuth()

// Check type
let type = await auth.biometricType() // .faceID or .touchID

// Authenticate
let success = try await auth.authenticate(reason: "Unlock app")
```

### Network Security

```swift
let network = NetworkSecurity()

// Secure request
let data = try await network.secureRequest(url: URL(string: "https://api.example.com")!)
```

## 🎯 Use Cases

### Mobile Banking
- Secure credential storage
- Biometric authentication
- Certificate pinning for API calls

### Healthcare Apps
- HIPAA-compliant data storage
- Patient data encryption
- Secure network communication

### Enterprise Apps
- SSO integration
- Input validation
- Audit logging

## 🏗️ Architecture

- **Actor-based**: Thread-safe by design
- **Async/await**: Modern concurrency
- **Protocol-oriented**: Easy to mock/test
- **Zero dependencies**: Pure Swift/Foundation

## 🧪 Testing

```bash
swift test
```

## 📊 Performance

- Keychain operations: <10ms
- Input validation: <1ms
- Biometric auth: ~500ms (system)
- Network requests: Depends on latency

## 🤝 Contributing

Built for Detroit's open source community. Contributions welcome!

1. Fork repository
2. Create feature branch
3. Add tests
4. Submit PR

## 📝 License

MIT License

## 🌟 Detroit DevRel

Part of Detroit's Swift and cybersecurity education initiative.

**Related Projects**:
- [Security Awareness Course](https://github.com/durellwilson/security-awareness-course)
- [Detroit Tech Equity](https://github.com/durellwilson/DetroitTechEquity)
- [ML Text Kit](https://github.com/durellwilson/ml-text-kit)

---

**Built with ❤️ in Detroit** 🏭
