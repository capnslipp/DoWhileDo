// doWhileDo
// @author: Slipp Douglas Thompson
// @license: Public Domain per The Unlicense.  See accompanying LICENSE file or <http://unlicense.org/>.



// MARK: Types

public typealias DoFunc = ()->Void
public typealias WhileConditionFunc = ()->Bool
public typealias UntilConditionFunc = ()->Bool

enum DoWhileDoError : Error {
	case exitLoop
}



// MARK: do-while-do

@inlinable
public func doWhileDo(_ do1: DoFunc, while: WhileConditionFunc, do do2: DoFunc)
{
	while true {
		do1()
		guard `while`() else {
			return
		}
		do2()
	}
}


public typealias WhileFunc = (@autoclosure WhileConditionFunc) throws -> Void

public func doWhileDo(_ context: (_ `while`: WhileFunc) throws -> Void)
{
	func whileFunc(_ whileCondition: WhileConditionFunc) throws {
		guard whileCondition() else {
			throw DoWhileDoError.exitLoop
		}
	}
	
	try! {
		do {
			while true {
				try context(whileFunc)
			}
		} catch DoWhileDoError.exitLoop {}
	}()
}



// MARK: do-until-do

@inlinable
public func doUntilDo(_ do1: DoFunc, until: UntilConditionFunc, do do2: DoFunc)
{
	while true {
		do1()
		guard !until() else {
			return
		}
		do2()
	}
}


public typealias UntilFunc = (@autoclosure UntilConditionFunc) throws -> Void

public func doUntilDo(_ context: (_ until: UntilFunc) throws -> Void)
{
	func untilFunc(_ untilCondition: UntilConditionFunc) throws {
		guard !untilCondition() else {
			throw DoWhileDoError.exitLoop
		}
	}
	
	try! {
		do {
			while true {
				try context(untilFunc)
			}
		} catch DoWhileDoError.exitLoop {}
	}()
}
