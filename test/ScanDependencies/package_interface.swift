// RUN: %empty-directory(%t)
// RUN: split-file %s %t

// RUN: %target-swift-frontend -emit-module %t/Bar.swift -I %t \
// RUN:   -module-name Bar -package-name barpkg \
// RUN:   -enable-library-evolution -swift-version 5 \
// RUN:   -emit-module-interface-path %t/Bar.swiftinterface \
// RUN:   -emit-private-module-interface-path %t/Bar.private.swiftinterface \
// RUN:   -emit-package-module-interface-path %t/Bar.package.swiftinterface

// RUN: %target-swift-frontend -scan-dependencies -o %t/deps.json -I %t -experimental-package-interface-load \
// RUN:   %t/Client.swift -module-name Client -package-name barpkg -swift-version 5
// RUN: %FileCheck %s --input-file=%t/deps.json --check-prefix CHECK --check-prefix CHECK-PACKAGE

/// When package name doesn't match or not used, it should find private interface.
// RUN: %target-swift-frontend -scan-dependencies -o %t/deps2.json -I %t -experimental-package-interface-load \
// RUN:   %t/Client.swift -module-name Client -package-name foopkg -swift-version 5
// RUN: %FileCheck %s --input-file=%t/deps2.json --check-prefix CHECK --check-prefix CHECK-PRIVATE

// RUN: %target-swift-frontend -scan-dependencies -o %t/deps3.json -I %t -experimental-package-interface-load \
// RUN:   %t/Client.swift -module-name Client -swift-version 5
// RUN: %FileCheck %s --input-file=%t/deps3.json --check-prefix CHECK --check-prefix CHECK-PRIVATE

// CHECK: "swift": "Bar"
// CHECK: "modulePath": "{{.*}}{{/|\\}}Bar-{{.*}}.swiftmodule"
// CHECK-PACKAGE: "moduleInterfacePath": "{{.*}}{{/|\\}}Bar.package.swiftinterface"
// CHECK-PRIVATE: "moduleInterfacePath": "{{.*}}{{/|\\}}Bar.private.swiftinterface"

//--- Bar.swift
public enum PubEnum {
  case red, green
}

package enum PkgEnum {
  case blue, yellow
}

//--- Client.swift
import Bar
