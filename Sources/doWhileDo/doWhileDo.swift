// doWhileDo
// @author: Slipp Douglas Thompson
// @license: Public Domain per The Unlicense.  See accompanying LICENSE file or <http://unlicense.org/>.



// MARK: Types

public typealias DoFunc = ()->Void
public typealias WhileConditionFunc = ()->Bool
public typealias UntilConditionFunc = ()->Bool



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
