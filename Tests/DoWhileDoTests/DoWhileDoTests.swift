import XCTest
@testable import DoWhileDo



final class DoWhileDoTests : XCTestCase
{
	func testDoWhileDo() throws
	{
		var lineNumber = 1
		var isPresent = false
		doWhileDo {
			indentPrint("trying isLinePresent #\(lineNumber)")
			isPresent = Mocks.isLinePresent(line: lineNumber)
		}
		while: { isPresent }
		do: {
			indentPrint("#\(lineNumber) -> #\(lineNumber + 1)")
			lineNumber += 1
		}
		
		XCTAssertEqual(lineNumber, 10)
	}
	
	func testDoWhileDoWithContext() throws
	{
		var lineNumber = 1
		doWhileDo { `while` in
			indentPrint("trying isLinePresent #\(lineNumber)")
			let isPresent = Mocks.isLinePresent(line: lineNumber)
			
			try `while`(isPresent)
			
			indentPrint("#\(lineNumber) -> #\(lineNumber + 1)")
			lineNumber += 1
		}
		
		XCTAssertEqual(lineNumber, 10)
	}
	
	func testDoUntilDo() throws
	{
		var tryNumber = 1
		var didHit = false
		doUntilDo {
			indentPrint("trying hitTest #\(tryNumber)")
			didHit = Mocks.hitTest(try: tryNumber)
		}
		until: { didHit }
		do: {
			indentPrint("#\(tryNumber) -> #\(tryNumber + 1)")
			tryNumber += 1
		}
		
		XCTAssertEqual(tryNumber, 10)
	}
	
	func testDoUntilDoWithContext() throws
	{
		var tryNumber = 1
		doUntilDo { until in
			indentPrint("trying hitTest #\(tryNumber)")
			let didHit = Mocks.hitTest(try: tryNumber)
			
			try until(didHit)
			
			indentPrint("#\(tryNumber) -> #\(tryNumber + 1)")
			tryNumber += 1
		}
		
		XCTAssertEqual(tryNumber, 10)
	}
}



fileprivate struct Mocks
{
	static func isLinePresent(line lineNumber: Int) -> Bool {
		if lineNumber < 10 { return true }
		return false
	}

	static func hitTest(try tryNumber: Int) -> Bool {
		if tryNumber >= 10 { return true }
		return false
	}
}



fileprivate func indentPrint(
	indent: Int = 1,
	_ items: String...,
	separator: String = " ",
	terminator: String = "\n",
	indentor: String = "\t"
) {
	let indentString = String(repeating: indentor, count: indent)
	let message = indentString + items.joined(separator: separator)
	print(message, terminator: terminator)
}
