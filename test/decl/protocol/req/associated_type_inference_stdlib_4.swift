// RUN: %target-swift-frontend -emit-silgen %s -disable-experimental-associated-type-inference -DA1
// RUN: %target-swift-frontend -emit-silgen %s -disable-experimental-associated-type-inference -DA2
// RUN: %target-swift-frontend -emit-silgen %s -disable-experimental-associated-type-inference -DA3
// RUN: %target-swift-frontend -emit-silgen %s -disable-experimental-associated-type-inference -DA4
// RUN: %target-swift-frontend -emit-silgen %s -disable-experimental-associated-type-inference -DA5
// RUN: %target-swift-frontend -emit-silgen %s -disable-experimental-associated-type-inference -DA6
// RUN: %target-swift-frontend -emit-silgen %s -disable-experimental-associated-type-inference -DA7
// RUN: %target-swift-frontend -emit-silgen %s -disable-experimental-associated-type-inference -DA8
// RUN: %target-swift-frontend -emit-silgen %s -disable-experimental-associated-type-inference -DA9
// RUN: %target-swift-frontend -emit-silgen %s -disable-experimental-associated-type-inference -DA10
// RUN: %target-swift-frontend -emit-silgen %s -disable-experimental-associated-type-inference -DA11
// RUN: %target-swift-frontend -emit-silgen %s -disable-experimental-associated-type-inference -DA12
// RUN: %target-swift-frontend -emit-silgen %s -disable-experimental-associated-type-inference -DA13
// RUN: %target-swift-frontend -emit-silgen %s -disable-experimental-associated-type-inference -DA14

// RUN: %target-swift-frontend -emit-silgen %s -enable-experimental-associated-type-inference -DA1
// RUN: %target-swift-frontend -emit-silgen %s -enable-experimental-associated-type-inference -DA2
// RUN: %target-swift-frontend -emit-silgen %s -enable-experimental-associated-type-inference -DA3
// RUN: %target-swift-frontend -emit-silgen %s -enable-experimental-associated-type-inference -DA4
// RUN: %target-swift-frontend -emit-silgen %s -enable-experimental-associated-type-inference -DA5
// RUN: %target-swift-frontend -emit-silgen %s -enable-experimental-associated-type-inference -DA6
// RUN: %target-swift-frontend -emit-silgen %s -enable-experimental-associated-type-inference -DA7
// RUN: %target-swift-frontend -emit-silgen %s -enable-experimental-associated-type-inference -DA8
// RUN: %target-swift-frontend -emit-silgen %s -enable-experimental-associated-type-inference -DA9
// RUN: %target-swift-frontend -emit-silgen %s -enable-experimental-associated-type-inference -DA10
// RUN: %target-swift-frontend -emit-silgen %s -enable-experimental-associated-type-inference -DA11
// RUN: %target-swift-frontend -emit-silgen %s -enable-experimental-associated-type-inference -DA12
// RUN: %target-swift-frontend -emit-silgen %s -enable-experimental-associated-type-inference -DA13
// RUN: %target-swift-frontend -emit-silgen %s -enable-experimental-associated-type-inference -DA14

#if A1

for x in S() { _ = x }

#elseif A2

func f<T: Sequence>(_: T.Type) -> T.Element.Type { fatalError() }
let x: String.Type = f(S.self)

#elseif A3

func f<T: Sequence>(_: T.Type) -> T.Iterator.Type { fatalError() }
let x: IndexingIterator<S>.Type = f(S.self)

#elseif A4

func f<T: Sequence>(_: T.Type) -> T.Iterator.Element.Type { fatalError() }
let x: String.Type = f(S.self)

#elseif A5

func f<T: Collection>(_: T.Type) -> T.Element.Type { fatalError() }
let x: String.Type = f(S.self)

#elseif A6

func f<T: Collection>(_: T.Type) -> T.Index.Type { fatalError() }
let x: Int.Type = f(S.self)

#elseif A7

func f<T: Collection>(_: T.Type) -> T.SubSequence.Type { fatalError() }
let x: Slice<S>.Type = f(S.self)

#elseif A8

func f<T: Collection>(_: T.Type) -> T.SubSequence.Element.Type { fatalError() }
let x: String.Type = f(S.self)

#elseif A9

func f<T: Collection>(_: T.Type) -> T.SubSequence.Index.Type { fatalError() }
let x: Int.Type = f(S.self)

#elseif A10

func f<T: Collection>(_: T.Type) -> T.SubSequence.Iterator.Type { fatalError() }
let x: IndexingIterator<Slice<S>>.Type = f(S.self)

#elseif A11

func f<T: Collection>(_: T.Type) -> T.Indices.Type { fatalError() }
let x: Range<Int>.Type = f(S.self)

#elseif A12

func f<T: Collection>(_: T.Type) -> T.Indices.Element.Type { fatalError() }
let x: Int.Type = f(S.self)

#elseif A13

func f<T: Collection>(_: T.Type) -> T.Indices.SubSequence.Type { fatalError() }
let x: Range<Int>.Type = f(S.self)

#elseif A14

func f<T: Collection>(_: T.Type) -> T.SubSequence.Indices.Type { fatalError() }
let x: Range<Int>.Type = f(S.self)

#endif

struct S: RandomAccessCollection {
  public var startIndex: Int { 0 }
  public var endIndex: Int { 0 }
  public subscript(position: Int) -> String { "" }
}

